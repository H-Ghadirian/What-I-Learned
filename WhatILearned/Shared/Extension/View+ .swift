import SwiftUI

extension View {
  static func + <T> (lhs: Self, rhs: T) -> some View where T: View {
    HStack {
      lhs
      rhs
    }
  }
}
