import Foundation
import CoreLocation

protocol LocationDelegate {
    func locationUpdated()
}

final class Location: NSObject {
    static let manager = Location()
    private override init() {}
    
    private let locationManager = CLLocationManager()
    private var notified = Bool()
    
    lazy var current: CLLocation? = {
        guard let lat = UserDefaultsManager.lattitude,
            let long = UserDefaultsManager.lattitude,
            let latDegree = CLLocationDegrees(lat),
            let longDegree = CLLocationDegrees(long) else {
                return nil
        }
        return CLLocation(latitude: latDegree, longitude: longDegree)
    }()
    
    var delegate: LocationDelegate?

    // MARK : - Private methods
    private func configureManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locationManager.activityType = .otherNavigation
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.pausesLocationUpdatesAutomatically = false
        locationManager.startUpdatingLocation()
    }
    
    private func noMoreUpdatesPlease() {
        UserDefaultsManager.lattitude = nil
        UserDefaultsManager.longitude = nil
        stopUpdating()
    }

    private func notifyUser() {
        if !notified {
            notified = true
            AppDelegate.shared.window?.currentViewController()?
                .showAlertControllerWith(message: .location,
                                         buttons: .cancel({self.notified = true}), .settings)
        }
    }
    
    private func servicesEnabled(completion: ()->()) {
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .authorizedAlways, .authorizedWhenInUse:
                completion()
            case .denied, .restricted:
                notifyUser()
            default: break
            }
        } else {
            notifyUser()
        }
    }
    
    // MARK : - Public methods
    func startUpdating() {
        if  Bundle.main.object(forInfoDictionaryKey:
            "NSLocationWhenInUseUsageDescription") != nil {
            self.locationManager.requestWhenInUseAuthorization()
        }
        configureManager()
    }
    
    func stopUpdating() {
        locationManager.stopUpdatingLocation()
    }
    
}

// MARK : - LocationManager delegates
extension Location: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            startUpdating()
        case .denied, .restricted:
            noMoreUpdatesPlease()
            notifyUser()
        case .notDetermined: break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        UserDefaultsManager.lattitude = "\(location.coordinate.latitude)"
        UserDefaultsManager.longitude = "\(location.coordinate.longitude)"
        delegate?.locationUpdated()
    }
}
