//
//  SelectLevelViewController.swift
//  SampleQuiz
//
//  Created by 高木克 on 2022/05/15.
//

import UIKit

class SelectLevelViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
//    ボタン押下時のアクション
    @IBAction func levelButtonAction(sender: UIButton) {
        print(sender.tag)
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
