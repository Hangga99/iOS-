//
//  FoodListViewController.swift
//  Restaurant
//
//  Created by 박기태 on 2023/02/05.
//

import UIKit

class FoodListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // meun 배열을 값을 반환
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // CustomCell을 사용하기 위한 코드
        let cell: CustomCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! CustomCell
        // menu, pay 배열의 값을 각각 text, text2에 저장
        let text: String = self.menu[indexPath.row]
        let text2: String = self.pay[indexPath.row]
        
        cell.foodName?.text = text      // CustomCell의  foodName.Lable에 text값 저장
        cell.menuPrice?.text = text2    // CustomCell의  menuPrice.Lable에 text2값 저장
        cell.foodImg.image = UIImage(named: foodimage[indexPath.row]) // CustomCell의  foodImg.Image에 image배열의 indexPath.row 값을 저장
        return cell
    }
    // TableView에 표시될 섹션의 수를 하나로 지정
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.foodTableView.rowHeight = 120 // 테이블 뷰의 셀 높이 지정

    }
    // Lable 아웃렛
    @IBOutlet weak var restaurantLbl: UILabel!
    // Table View 아웃렛
    @IBOutlet weak var foodTableView: UITableView!
    
    let cellIdentifier: String = "cell"
    var textToFoodList: String?
    // case에 마다 값을 불러오기 위한 변수로 배열을 생성
    var menu: [String] = []
    var pay: [String] = []
    var foodimage: [String] = []
    // textToFoodList 화면 맨 위에 Lable에 따른 배열 초기화 메서드
    func menuChoice() {
        switch textToFoodList {
            case "민들레뜨락":
                menu = ["부추수육구이", "모듬소세지", "어묵탕"]
                pay = ["20,000", "15,000", "13,000"]
                foodimage = ["ha1", "ha2", ""]
            case "밥은":
                menu = ["제육덮밥", "참치마요덮밥", "치킨마요덮밥"]
                pay = ["4,500", "3,500", "4,500"]
                foodimage = ["bob1", "bob2", "bob3"]
            case "휘경곱창":
                menu = ["야채곱창", "순대곱창", "알곱창"]
                pay = ["10,000", "11,000", "11,000"]
                foodimage = ["", "", ""]
            case "민들레초밥":
                menu = ["모듬초밥", "특초밥", "민들레 초밥"]
                pay = ["12,000", "15,000", "19,000"]
                foodimage = ["", "", ""]
            case "하다식당":
                menu = ["등심하다", "안심하다", "카레우동세트"]
                pay = ["9,000", "10,000", "8,500"]
                foodimage = ["ha1", "ha2", "ha3"]
            case "파스타찹찹":
                menu = ["알새우 바질크림", "크림 까르보나라", "빠네새우"]
                pay = ["8,500", "8,000", "12,000"]
                foodimage = ["", "", ""]
            case "용궁중화요리":
                menu = ["짜장면", "간짜장", "중화비빔밥"]
                pay = ["4,000", "5,000", "7,000"]
                foodimage = ["", "", ""]
            case "고빠루":
                menu = ["짜장면", "짬뽕", "볶음밥"]
                pay = ["4,500", "5,000", "5,500"]
                foodimage = ["", "", ""]
            case "킹콩 떡볶이":
                menu = ["킹콩 떡볶이", "쿵쿵튀김", "킹콩파닭 떡볶이"]
                pay = ["3,000", "3,000", "4,500"]
                foodimage = ["", "", ""]
            case "김가네":
                menu = ["김가네김밥", "오물렛라이스", "돈까스"]
                pay = ["3,500", "6,500", "6,500"]
                foodimage = ["", "", ""]
            case "노랑통닭":
                menu = ["후라이드치킨", "양념치킨", "순살3종세트"]
                pay = ["16,000", "17,000", "18,000"]
                foodimage = ["", "", ""]
            case "맘스터치":
                menu = ["싸이버거", "통새우버거", "휠렛버거"]
                pay = ["5,800", "5,600", "4,900"]
                foodimage = ["", "", ""]
            case "bhc":
                menu = ["맛초킹", "맵스터", "쁘링클"]
                pay = ["18,000", "18,000", "19,000"]
                foodimage = ["", "", ""]
            default:
                return
            }
        }
    // 화면 전환 시 데이터 이동
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        restaurantLbl.text = self.textToFoodList
        menuChoice()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController: MapViewController = segue.destination as? MapViewController else { return } 
        nextViewController.textToSet = textToFoodList
    }

}
