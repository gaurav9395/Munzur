import MapKit

extension MKMapView {
    func centralize(location: (latitude: String, longitude: String)) {
        guard let latDegree = CLLocationDegrees(location.latitude),
            let longDegree =  CLLocationDegrees(location.longitude) else {
                return
        }
        let center = CLLocationCoordinate2D(latitude: latDegree, longitude: longDegree)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: center, span: span)
        self.setRegion(region, animated: true)
    }
}
