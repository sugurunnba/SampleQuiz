//
//  SelectLevelViewController.swift
//  SampleQuiz
//
//  Created by 高木克 on 2022/05/15.
//

import UIKit

class SelectLevelViewController: UIViewController {
    
    var selectTag = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
//    セグエが走る前に実行するprepareメソッド
//    問題表示のcontrollerへ、選択したレベルを渡すメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
//        as!でダウンキャストする。ダウンキャスト->クラスの継承やプロトコルの準拠などの階層関係がある型どうしにおいて、下位の型として扱う操作
//        as!はダウンキャストの際、強制的に右辺の型にキャストをします（強制キャスト）。
        let quizVC = segue.destination as! QuizViewController
        quizVC.selectLevel = selectTag
    }
    
//    ボタン押下時のアクション
    @IBAction func levelButtonAction(sender: UIButton) {
        selectTag = sender.tag
        performSegue(withIdentifier: "toQuizVC", sender: nil)
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
