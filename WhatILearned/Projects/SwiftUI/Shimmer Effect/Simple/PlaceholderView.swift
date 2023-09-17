import Foundation
import SwiftUI

struct PlaceholderView: View {
  var body: some View {
    List {
      ForEach(0..<10) { _ in
        HStack {
          Image(systemName: "star.fill")
          Text(
            """
            Lorem ipsum dolor sit amet,
            consectetur adipiscing elit,
            sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam
            """
          )
        }
        .redacted(reason: .placeholder)
        .shimmer()
      }
    }
  }
}
