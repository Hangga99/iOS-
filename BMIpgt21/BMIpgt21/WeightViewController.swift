//
//  WeightViewController.swift
//  BMIpgt21
//
//  Created by 박기태 on 2022/12/12.
//

import UIKit

class WeightViewController: UIViewController {

    @IBOutlet weak var txtBench: UITextField!
    @IBOutlet weak var txtDead: UITextField!
    @IBOutlet weak var txtSquat: UITextField!
    @IBOutlet weak var Result: UILabel!
    
    @IBAction func butWeight(_ sender: UIButton) {
        if txtBench.text == "" || txtDead.text == "" || txtSquat.text == "" {
            print("Input error")
            Result.text = "모든 중량을 입력해주세요!"
            return
        } else {
            let Bench = Double(txtBench.text!)!
            let Dead = Double(txtDead.text!)!
            let Squat = Double(txtSquat.text!)!
            let sum = Double(Bench+Dead+Squat)
            var body = ""
            var color = UIColor.white
            if sum > 500 {
                color = UIColor(displayP3Red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
                body = "언더아머 가능"
            } else if sum >= 350 && sum < 490 {
                color = UIColor(displayP3Red: 0.7, green: 0.0, blue: 0.0, alpha: 1.0)
                body = "고급자"
            } else if sum >= 250 && sum < 350 {
                color = UIColor(displayP3Red: 0.4, green: 0.0, blue: 0.0, alpha: 1.0)
                body = "중급자"
            } else if sum >= 185 && sum < 250 {
                color = UIColor(displayP3Red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)
                body = "초급자"
            } else {
                color = UIColor(displayP3Red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
                body = "헬린이"
            }
            print(sum)
            Result.backgroundColor = color
            Result.clipsToBounds = true
            Result.layer.cornerRadius = 15
            Result.text = "3대 중량은\(sum)이고,\(body)입니다"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
