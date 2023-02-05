//
//  ViewController.swift
//  Restaurant
//
//  Created by 박기태 on 2023/02/03.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return " 한식"
        case 1:
            return " 일식"
        case 2:
            return " 양식"
        case 3:
            return " 중식"
        case 4:
            return " 분식"
        case 5:
            return " 패스트푸드"
        default:
            return ""
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return food[section].count
        }
        
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
            
            cell.textLabel?.text = food[indexPath.section][indexPath.row]
            return cell
        }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.textLabel?.textColor = .black //글자색
            headerView.textLabel?.textAlignment = .left //글자 정렬
            headerView.textLabel?.font = UIFont(name: "Copperplate-Bold", size: 18) //폰트와 폰트 크기 설정
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return food.count
        
        }
    
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier: String = "cell"
    
    let food = [
        ["민들레뜨락", "밥은", "휘경곱창"],
        ["민들레초밥", "하다식당"],
        ["파스타찹찹"],
        ["용궁중화요리", "고빠루"],
        ["킹콩 떡볶이", "김가네"],
        ["노랑통닭", "맘스터치", "bhc"]
    ]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController: FoodListViewController = segue.destination as? FoodListViewController else { return }
        guard let cell: UITableViewCell = sender as? UITableViewCell else { return }
        
        nextViewController.textToFoodList = cell.textLabel?.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
    }
}
