//
//  FixedOrientation.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//

import SwiftUI

extension UIImage {
    public func fixedOrientation() -> UIImage? {

        var transform = CGAffineTransform.identity

        switch imageOrientation {
        case .up, .upMirrored:
            transform = transform.rotated(by: .pi / 2)
        case .down, .downMirrored:
            transform = transform.rotated(by: -.pi / 2)
        case .left, .leftMirrored:
            transform = transform.rotated(by: .pi)
        case .right, .rightMirrored:
            transform = transform.rotated(by: 0)
        default:
            return self
        }

        guard let cgImage = cgImage, let colorSpace = cgImage.colorSpace,
              let context = CGContext(data: nil, width: Int(size.height), height: Int(size.width),
                                      bitsPerComponent: cgImage.bitsPerComponent, bytesPerRow: 0,
                                      space: colorSpace, bitmapInfo: cgImage.bitmapInfo.rawValue) else {
            return self
        }

        context.concatenate(transform)

        switch imageOrientation {
        case .left, .leftMirrored, .right, .rightMirrored:
            context.draw(cgImage, in: CGRect(x: 0, y: 0, width: size.height, height: size.width))
        default:
            context.draw(cgImage, in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        }

        guard let newCgImage = context.makeImage() else { return self }
        return UIImage(cgImage: newCgImage)
    }
}
