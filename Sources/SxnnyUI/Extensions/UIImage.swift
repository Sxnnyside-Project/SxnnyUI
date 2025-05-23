//
//  FixedOrientation.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//

import UIKit
import CoreImage


public extension UIImage {
    /// Returns a new image with the corrected orientation.
    ///
    /// - Returns: A new `UIImage` instance with orientation fixed to `.up`, or the original image if no correction is needed.
    func fixedOrientation() -> UIImage? {
        // Return early if orientation is already correct
        guard imageOrientation != .up else {
            return self
        }
        
        guard let cgImage = self.cgImage else {
            return self
        }
        
        let width = self.size.width
        let height = self.size.height
        
        var transform = CGAffineTransform.identity
        
        switch imageOrientation {
        case .down, .downMirrored:
            transform = transform.translatedBy(x: width, y: height).rotated(by: .pi)
        case .left, .leftMirrored:
            transform = transform.translatedBy(x: width, y: 0).rotated(by: .pi / 2)
        case .right, .rightMirrored:
            transform = transform.translatedBy(x: 0, y: height).rotated(by: -.pi / 2)
        default:
            break
        }
        
        switch imageOrientation {
        case .upMirrored, .downMirrored:
            transform = transform.translatedBy(x: width, y: 0).scaledBy(x: -1, y: 1)
        case .leftMirrored, .rightMirrored:
            transform = transform.translatedBy(x: height, y: 0).scaledBy(x: -1, y: 1)
        default:
            break
        }
        
        guard let colorSpace = cgImage.colorSpace,
              let context = CGContext(data: nil,
                                      width: Int(width),
                                      height: Int(height),
                                      bitsPerComponent: cgImage.bitsPerComponent,
                                      bytesPerRow: 0,
                                      space: colorSpace,
                                      bitmapInfo: cgImage.bitmapInfo.rawValue) else {
            return self
        }
        
        context.concatenate(transform)
        
        let drawRect: CGRect
        switch imageOrientation {
        case .left, .leftMirrored, .right, .rightMirrored:
            drawRect = CGRect(x: 0, y: 0, width: height, height: width)
        default:
            drawRect = CGRect(x: 0, y: 0, width: width, height: height)
        }
        
        context.draw(cgImage, in: drawRect)
        
        guard let correctedImage = context.makeImage() else {
            return self
        }
        
        return UIImage(cgImage: correctedImage, scale: scale, orientation: .up)
    }
    
    /// Resizes the image to a new size.
    func resized(to newSize: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(newSize, false, self.scale)
        defer { UIGraphicsEndImageContext() }
        self.draw(in: CGRect(origin: .zero, size: newSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    /// Crops the image to the specified size.
    func cropped(to size: CGSize) -> UIImage? {
        let originX = max((self.size.width - size.width) / 2, 0)
        let originY = max((self.size.height - size.height) / 2, 0)
        let cropRect = CGRect(origin: CGPoint(x: originX, y: originY), size: size).applying(CGAffineTransform(scaleX: self.scale, y: self.scale))
        
        guard let cgImage = self.cgImage?.cropping(to: cropRect) else { return nil }
        return UIImage(cgImage: cgImage, scale: self.scale, orientation: self.imageOrientation)
    }
    
    /// Returns the image as a base64 encoded string.
    func asBase64() -> String? {
        self.pngData()?.base64EncodedString()
    }
    
    /// Converts the image to a `CIImage`.
    func asCIImage() -> CIImage? {
        CIImage(image: self)
    }
    
    /// Checks if the image has an alpha channel.
    var hasAlphaChannel: Bool {
        guard let alpha = self.cgImage?.alphaInfo else { return false }
        return alpha == .first || alpha == .last || alpha == .premultipliedFirst || alpha == .premultipliedLast
    }
}
