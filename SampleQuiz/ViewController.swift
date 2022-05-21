//
//  ViewController.swift
//  SampleQuiz
//
//  Created by 高木克 on 2022/05/14.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startButton.layer.borderWidth = 2
        startButton.layer.borderColor = UIColor.black.cgColor
    }


}

