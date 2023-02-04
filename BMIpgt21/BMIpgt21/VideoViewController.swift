//
//  VideoViewController.swift
//  BMIpgt21
//
//  Created by 박기태 on 2022/12/06.
//

import UIKit
import AVKit

class VideoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func playVideo(_ sender: UIButton) {
        let file:String? = Bundle.main.path(forResource: "bmi", ofType: "mp4")
        let url = NSURL(fileURLWithPath: file!)
        let playerController = AVPlayerViewController()
        let player = AVPlayer(url: url as URL)
        playerController.player = player
        self.present(playerController, animated: true)
        player.play()
    }

}
