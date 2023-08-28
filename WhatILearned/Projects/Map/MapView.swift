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

    let locationManager = CLLocationManager()

    var body: some View {
        Map(
            coordinateRegion: $region,
            showsUserLocation: true,
            userTrackingMode: .constant(.follow)
        )
        .onAppear {
            locationManager.requestWhenInUseAuthorization()
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
