import SwiftUI

struct SimpleToastView: View {
    var message: String
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {

                Text(message)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)

                Spacer(minLength: 10)
            }
            .padding()
        }
        .background(Color.black)
        .overlay(
            Rectangle()
                .fill(.black)
                .frame(width: 6)
                .clipped()
            , alignment: .leading
        )
        .frame(minWidth: 0, maxWidth: .infinity)
        .cornerRadius(8)
        .shadow(color: .black.opacity(0.12), radius: 9, x: 0, y: 1)
        .shadow(color: .black.opacity(0.14), radius: 5, x: 0, y: 6)
        .shadow(color: .black.opacity(0.2), radius: 2.5, x: 0, y: 3)
        .padding(.horizontal, 16)
    }
}

struct SimpleToastViewPreviews: PreviewProvider {
  static var previews: some View {
    VStack {
        SimpleToastView(
            message: "Lorem ipsum dolor sit amet, adipiscing elit. ")

        SimpleToastView(
            message: "Lorem ipsum dolor sit amet, adipiscing elit. ")
    }
  }
}
