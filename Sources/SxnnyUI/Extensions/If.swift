//
//  If.swift
//  SxnnyUI
//
//  Created by TI on 31/03/25.
//

import SwiftUI

public extension View {
    /// Conditional view modifier that applies a transformation if the condition is true.
    func `if`(_ condition: @autoclosure () -> Bool, then apply: (Self) -> some View) -> some View {
        if condition() {
            return AnyView(apply(self))
        } else {
            return AnyView(self)
        }
    }

    /// Conditional view modifier that applies one of two transformations based on the condition.
    func ifElse(_ condition: @autoclosure () -> Bool,
                    then ifTransform: (Self) -> some View,
                else elseTransform: (Self) -> some View) -> some View {
        if condition() {
            return AnyView(ifTransform(self))
        } else {
            return AnyView(elseTransform(self))
        }
    }

    /// Conditional view modifier that applies a transformation if the optional value is not nil.
    func `if`<Transform: View>(_ condition: Bool, transform: (Self) -> Transform) -> some View {
        Group {
            if condition {
                transform(self)
            } else {
                self
            }
        }
    }

    /// Conditional view modifier that applies one of two transformations based on the condition.
    func ifElse<TrueTransform: View, FalseTransform: View>(
        _ condition: Bool,
        if ifTransform: (Self) -> TrueTransform,
        else elseTransform: (Self) -> FalseTransform
    ) -> some View {
        Group {
            if condition {
                ifTransform(self)
            } else {
                elseTransform(self)
            }
        }
    }

    /// Applies a transformation if the optional value exists.
    func ifLet<T, Transform: View>(_ value: T?, transform: (Self, T) -> Transform) -> some View {
        Group {
            if let value = value {
                transform(self, value)
            } else {
                self
            }
        }
    }

    /// Applies one of two transformations based on the optional value.
    func ifLetElse<T, SomeTransform: View, NoneTransform: View>(
        _ value: T?,
        if someTransform: (Self, T) -> SomeTransform,
        else noneTransform: (Self) -> NoneTransform
    ) -> some View {
        Group {
            if let value = value {
                someTransform(self, value)
            } else {
                noneTransform(self)
            }
        }
    }
}
