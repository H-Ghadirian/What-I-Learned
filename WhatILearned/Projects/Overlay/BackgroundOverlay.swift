import SwiftUI

struct BackgroundOverlayView: View {
    var body: some View {
        VStack {
            Text("Hamed")
                .foregroundStyle(.red)
                .overlay {
                    Circle()
                        .fill(.blue.opacity(0.9))
                        .frame(width: 100, height: 100)
                }
            Spacer()
                .frame(height: 100)
            Text("Hamed")
                .foregroundStyle(.red)
                .background {
                    Circle()
                        .fill(.blue.opacity(0.9))
                        .frame(width: 100, height: 100)
                }
            Spacer()
                .frame(height: 100)
            Image(systemName: "square.and.arrow.up")
                .background {
                    Circle().fill(.green.opacity(0.5))
                        .frame(width: 100, height: 100)
                }
            
        }
    }
}

struct BackgroundOverlayView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundOverlayView()
    }
}
