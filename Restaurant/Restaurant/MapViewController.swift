//
//  MapViewController.swift
//  Restaurant
//
//  Created by 박기태 on 2023/02/07.
//

import UIKit
import MapKit
// MapKit을 사용하기 위해 CLLocationManagerDelegate 채택
class MapViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var reLbl: UILabel!
    
    let locarionManger = CLLocationManager()
    
    var textToSet: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locarionManger.delegate = self
        // 정확도를 최고로 설정
        locarionManger.desiredAccuracy = kCLLocationAccuracyBest
        // 위피 데이터를 추적 하기 위해 사용자에게 승인 요구
        locarionManger.requestWhenInUseAuthorization()
        // 위치 업데이트 시작
        locarionManger.startUpdatingLocation()
        // 위치 보기 설정
        mapView.showsUserLocation = true
    }
    // 뷰에 보여줄 컨텐츠를 미리 로드하는 메서드
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reLbl.text = self.textToSet // FoodListViewController에서 textToSet으로 지정한 텍스트값 읽어 reLbl.text에 초기화
        mapControll() // 함수 실행
    }
    
    // 위도와 경도, 스팬을 입력받아 지도에 표시
    func goLocation(latitudeValue: CLLocationDegrees, longtudeValue: CLLocationDegrees, delta span: Double) -> CLLocationCoordinate2D {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longtudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        mapView.setRegion(pRegion, animated: true)
        return pLocation
    }
    
    // 특정 위도와 경도에 핀 설치
    func setAnnotation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double){
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longtudeValue: longitudeValue, delta: span)
        mapView.addAnnotation(annotation)
    }
    
    
    // textToSet.text 값에 따른 위도,경도 초기화
    func mapControll(){
        switch textToSet {
        case "밥은":
            setAnnotation(latitudeValue: 37.63462, longitudeValue: 127.05803, delta: 0.1)
        case "휘경곱창":
            setAnnotation(latitudeValue: 37.63347, longitudeValue: 127.05871, delta: 0.1)
        case "민들레초밥":
            setAnnotation(latitudeValue: 37.63341, longitudeValue: 127.05774, delta: 0.1)
        case "용궁중화요리":
            setAnnotation(latitudeValue: 37.62909, longitudeValue: 127.05661, delta: 0.1)
        case "고빠루":
            setAnnotation(latitudeValue: 37.62880, longitudeValue: 127.05490, delta: 0.1)
        case "하다식당":
            setAnnotation(latitudeValue: 37.63399, longitudeValue: 127.05829, delta: 0.1)
        case "킹콩 떡볶이":
            setAnnotation(latitudeValue: 37.63388, longitudeValue: 127.05834, delta: 0.1)
        case "김가네":
            setAnnotation(latitudeValue: 37.63158, longitudeValue: 127.05750, delta: 0.1)
        case "노랑통닭":
            setAnnotation(latitudeValue: 37.63110, longitudeValue: 127.05828, delta: 0.1)
        case "맘스터치":
            setAnnotation(latitudeValue: 37.62934, longitudeValue: 127.05712, delta: 0.1)
        case "bhc":
            setAnnotation(latitudeValue: 37.63145, longitudeValue: 127.05764, delta: 0.1)
        case "민들레뜨락":
            setAnnotation(latitudeValue: 37.63307, longitudeValue: 127.05776, delta: 0.1)
        case "파스타찹찹":
            setAnnotation(latitudeValue: 37.6325, longitudeValue: 127.0517, delta: 0.1)
        default:
            return
        }
    }
}
