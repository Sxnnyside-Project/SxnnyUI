//
//  FloatFormatter.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//

import Foundation

public class FloatFormatter: Formatter {
    private let numberFormatter: NumberFormatter

    public override init() {
        numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        super.init()
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func string(for obj: Any?) -> String? {
        guard let number = obj as? NSNumber else { return nil }
        return numberFormatter.string(from: number)
    }

    public override func getObjectValue(_ obj: AutoreleasingUnsafeMutablePointer<AnyObject?>?, for string: String, errorDescription: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool {
        if let number = numberFormatter.number(from: string) {
            obj?.pointee = number
            return true
        }
        return false
    }
}
