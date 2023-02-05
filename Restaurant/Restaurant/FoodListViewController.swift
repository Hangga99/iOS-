//
//  FoodListViewController.swift
//  Restaurant
//
//  Created by 박기태 on 2023/02/05.
//

import UIKit

class FoodListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! CustomCell
        let text: String = self.menu[indexPath.row]
        let text2: String = self.pay[indexPath.row]
        
        cell.foodName?.text = text
        cell.menuPrice?.text = text2
        cell.foodImg.image = UIImage(named: foodimage[indexPath.row])
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBOutlet weak var restaurantLbl: UILabel!
    @IBOutlet weak var restaurantImg: UIImageView!
    @IBOutlet weak var foodTableView: UITableView!
    
    let cellIdentifier: String = "cell"
    var textToFoodList: String?
    
    var image: [String] = []
    
    var foodimage: [String] = []
    var menu: [String] = []
    var pay: [String] = []
    
    func menuChoice() {
            switch textToFoodList {
            case "민들레뜨락" :
                image = ["mint"]
                menu = ["부추수육구이", "모듬소세지", "어묵탕"]
                pay = ["20,000", "15,000", "13,000"]
                foodimage = ["mint", "", ""]
            case "밥은" :
                image = ["bob"]
                menu = ["제육덮밥", "참치마요덮밥", "치킨마요덮밥"]
                pay = ["4,500", "3,500", "4,500"]
                foodimage = ["", "", ""]
            case "휘경곱창" :
                image = ["hwikyung"]
                menu = ["야채곱창", "순대곱창", "알곱창"]
                pay = ["10,000", "11,000", "11,000"]
                foodimage = ["", "", ""]
            case "민들래초밥" :
                image = ["mincho"]
                menu = ["모듬초밥", "특초밥", "민들레 초밥"]
                pay = ["12,000", "15,000", "19,000"]
                foodimage = ["", "", ""]
            case "하다식당" :
                image = ["hada"]
                menu = ["등심하다", "안심하다", "카레우동세트"]
                pay = ["9,000", "10,000", "8,500"]
                foodimage = ["", "", ""]
            case "파스타찹찹" :
                image = ["chapchap"]
                menu = ["알새우 바질크림", "크림 까르보나라", "빠네새우"]
                pay = ["8,500", "8,000", "12,000"]
                foodimage = ["", "", ""]
            case "용궁중화요리" :
                image = ["yong"]
                menu = ["짜장면", "간짜장", "중화비빔밥"]
                pay = ["4,000", "5,000", "7,000"]
                foodimage = ["", "", ""]
            case "고빠루" :
                image = ["go"]
                menu = ["짜장면", "짬뽕", "볶음밥"]
                pay = ["4,500", "5,000", "5,500"]
                foodimage = ["", "", ""]
            case "킹콩 떡볶이" :
                image = ["king"]
                menu = ["킹콩 떡볶이", "쿵쿵튀김", "킹콩파닭 떡볶이"]
                pay = ["3,000", "3,000", "4,500"]
                foodimage = ["", "", ""]
            case "김가네" :
                image = ["kim"]
                menu = ["김가네김밥", "오물렛라이스", "돈까스"]
                pay = ["3,500", "6,500", "6,500"]
                foodimage = ["", "", ""]
            case "노랑통닭" :
                image = ["no"]
                menu = ["후라이드치킨", "양념치킨", "순살3종세트"]
                pay = ["16,000", "17,000", "18,000"]
                foodimage = ["", "", ""]
            case "맘스터치" :
                image = ["mam"]
                menu = ["싸이버거", "통새우버거", "휠렛버거"]
                pay = ["5,800", "5,600", "4,900"]
                foodimage = ["", "", ""]
            case "bhc" :
                image = ["bhc"]
                menu = ["맛초킹", "맵스터", "쁘링클"]
                pay = ["18,000", "18,000", "19,000"]
                foodimage = ["", "", ""]
            default :
                return
            }
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        restaurantLbl.text = self.textToFoodList
        menuChoice()
    }

}
