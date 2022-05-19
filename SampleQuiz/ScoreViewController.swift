//
//  ScoreViewController.swift
//  SampleQuiz
//
//  Created by 高木克 on 2022/05/14.
//

import UIKit

class ScoreViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    
    var correct = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "\(correct)問正解"

        // Do any additional setup after loading the view.
    }
    
    @IBAction func shareButtonAction(_ sender: Any) {
        let activityItems = ["\(correct)問正解しました。","#クイズアプリ"]
        let activityVC = UIActivityViewController(activityItems: activityItems,applicationActivities: nil)
        self.present(activityVC, animated: true)
    }
    
//    トップ画面に戻る処理 ※セグエで遷移するとメモリを消費してしまうため、dismissメソッドでviewControllerを破棄する
    @IBAction func toTopButtonAction(_ sender: Any) {
//        2つの画面を同時に閉じる処理
//        self(自分自身の).presentingViewController?(スコア画面と).presentingViewController?(問題画面を).dismiss(破棄する)(animated: true or false(アニメーションを入れるかどうか))
        self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true)
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
