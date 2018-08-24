//import UIKit
//import GoogleMaps
//import GooglePlaces
//
//extension Location {
//    struct Google {
//        private init(){}
//        
//        static let geocoder = GMSGeocoder()
//        static let client = GMSPlacesClient.shared()
//    }
//    
//    /**
//     Decode address name from lattitude and longitudes of a place.
//     - parameter lattitude: lattitude of the location
//     - parameter longitude: lattitude of the location
//     - parameter completion: a closure that aacepts a string as parameter
//     - parameter address: Address of the place decoded
//     */
//    func decodeFrom(lattitude: String, longitude: String,
//                    completion: @escaping (_ address: String)->()) {
//        guard let latDegree = CLLocationDegrees(lattitude),
//            let longDegree = CLLocationDegrees(longitude) else {
//                return
//        }
//        let coordinates = CLLocationCoordinate2D(latitude: latDegree, longitude: longDegree)
//        Google.geocoder.reverseGeocodeCoordinate(coordinates) { (response, error) in
//            debugPrint(error.debugDescription)
//            
//            if let location = response?.firstResult()?.lines {
//                let address = location.joined(separator: ", ")
//                completion(address)
//            }
//        }
//    }
//    
//    /**
//     Autocomplete method for
//     - parameter text: string enterd by the user
//     - parameter completion: a closure that aacepts a string as parameter
//     - parameter predictions: Array of predictions as a result of the query
//     */
//    func autocompleteForSearch(text: String,
//                               completion: @escaping (_ predictions: [Prediction])->()) {
//        Google.client.autocompleteQuery(text, bounds: nil, boundsMode: .bias, filter: nil) { (result, error) in
//            debugPrint(error?.localizedDescription ?? "")
//            
//            if let places = result {
//                let predictions = places.compactMap {
//                    Prediction(name: $0.attributedFullText.string, placeId: $0.placeID)
//                }
//                completion(predictions)
//            } else {
//                completion([Prediction]())
//            }
//        }
//    }
//    
//    /**
//     Autocomplete method for
//     - parameter id: PlaceId to be decoded
//     - parameter completion: a closure that aacepts a string as parameter
//     - parameter place: A GMSPlace object for decoded place
//     */
//    func decodePlace(withId id: String, completion: @escaping (_ place: GMSPlace?)->()) {
//        Google.client.lookUpPlaceID(id) { (place, error) in
//            debugPrint(error?.localizedDescription ?? "")
//            completion(place)
//        }
//    }
//}
