//
//  RouteViewController.swift
//  gomywayride
//
//  Created by Snow-Macmini-2 on 26/11/19.
//  Copyright © 2019 Snow-Macmini-1. All rights reserved.
//

import UIKit
import GoogleMaps

import SwiftyJSON
class RouteViewController: UIViewController {

    @IBOutlet weak var CustomMapView: UIView!
    @IBOutlet weak var RouteMapVw: GMSMapView!
    var zoomLevel: Float = 15.0
     var tripDetails: TripDetailData?
     var locationsArr = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let viewTrip = tripDetails?.viewTrip {
                   let originStr = viewTrip.origin ?? ""
                   let destination = viewTrip.destination ?? ""
                   locationsArr.append(originStr)
                   
                   if let tripStopPoints = tripDetails?.tripStopPoints {
                       locationsArr += tripStopPoints.map { $0.stopPoint ?? "" }
                   }
                   
                   locationsArr.append(destination)
               }
               
               showProgressHud(view: self.view)
               fetchLocations()
           }

           func fetchLocations() {
               let dispatchGroup = DispatchGroup()
               var finalLocDictArr = [NSDictionary]()
               
               for address in locationsArr {
                   dispatchGroup.enter()
                   getAddress(addressStr: address, success: { response in
                       finalLocDictArr.append(response)
                       dispatchGroup.leave()
                   }) { error in
                       dispatchGroup.leave()
                       print(error.localizedDescription)
                   }
               }

               dispatchGroup.notify(queue: DispatchQueue.main) {
                   print("All Done")
                   dissmissHUD(self.view)
                   self.showMapWithRoute(locations: finalLocDictArr)
               }
           }

           func showMapWithRoute(locations: [NSDictionary]) {
               guard let firstLoc = locations.first,
                     let lat = firstLoc["latitude"] as? Double,
                     let long = firstLoc["longitude"] as? Double else {
                   return
               }

               RouteMapVw.camera = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: zoomLevel)
               RouteMapVw.settings.compassButton = true

               var bounds = GMSCoordinateBounds()

               for data in locations {
                   if let lat = data["latitude"] as? Double,
                      let long = data["longitude"] as? Double {
                       let location = CLLocationCoordinate2D(latitude: lat, longitude: long)
                       let marker = GMSMarker(position: location)
                       marker.snippet = data["placeName"] as? String ?? ""
                       marker.map = RouteMapVw
                       bounds = bounds.includingCoordinate(marker.position)
                   }
               }

               let update = GMSCameraUpdate.fit(bounds, withPadding: 100)
               RouteMapVw.animate(with: update)
               drawPath(positions: locations.map { CLLocationCoordinate2D(latitude: $0["latitude"] as! Double, longitude: $0["longitude"] as! Double )})
           }

           func drawPath(positions: [CLLocationCoordinate2D]) {
               let origin = positions.first!
               let destination = positions.last!
               var wayPoints = ""
               
               for point in positions {
                   wayPoints = wayPoints.isEmpty ? "\(point.latitude),\(point.longitude)" : "\(wayPoints)%7C\(point.latitude),\(point.longitude)"
               }
               
               let key = KGoogleApi_Key
               let urlString = "https://maps.googleapis.com/maps/api/directions/json?origin=\(origin.latitude),\(origin.longitude)&destination=\(destination.latitude),\(destination.longitude)&mode=driving&waypoints=\(wayPoints)&key=\(key)"
               
               guard let url = URL(string: urlString) else {
                   // Handle URL creation error
                   return
               }
               
               let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                   if let error = error {
                       // Handle the error
                       print(error)
                       return
                   }
                   
                   if let data = data {
                       do {
                           let json = try JSON(data: data)
                           let routes = json["routes"][0]["overview_polyline"]["points"].stringValue
                           
                           if let path = GMSPath(fromEncodedPath: routes) {
                               DispatchQueue.main.async {
                                   let polyline = GMSPolyline(path: path)
                                   polyline.strokeWidth = 4
                                   polyline.strokeColor = .blue
                                   polyline.map = self.RouteMapVw
                               }
                           }
                       } catch {
                           // Handle JSON parsing error
                           print(error)
                       }
                   }
               }
               task.resume()
           }


    
    @IBAction func backTap(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
   

//   
}
