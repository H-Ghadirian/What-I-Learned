import Foundation
import SwiftUI
import MapKit

struct MapView: View {

    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 51.507222,
            longitude: -0.1275
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 0.5,
            longitudeDelta: 0.5
        )
    )

    private let locationManager = CLLocationManager()

    private func getHeight(from height: CGFloat) -> CGFloat {
        height > 50 ? height - 50 : 0
    }

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                Map(
                    coordinateRegion: $region,
                    showsUserLocation: true,
                    userTrackingMode: .constant(.follow)
                )
                .frame(height: getHeight(from: geometry.size.height))
                .onAppear {
                    locationManager.requestWhenInUseAuthorization()
                }
            }

    //        Map(
    //            coordinateRegion: .constant(
    //                region
    //            ),
    //            interactionModes: []
    //        )
    //        .frame(width: 400, height: 300)

    //        Map(
    //            coordinateRegion: .constant(
    //                region
    //            ),
    //            interactionModes: [.zoom]
    //        )
    //        .frame(width: 400, height: 300)
        }
    }
}
