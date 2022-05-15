//
//  QuizViewController.swift
//  SampleQuiz
//
//  Created by 高木克 on 2022/05/14.
//

import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet weak var quizNumberLabel: UILabel!
    @IBOutlet weak var quizTextView: UITextView!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    @IBOutlet weak var judgeImageView: UIImageView!
    
//    全ての問題が入っている配列
    var csvArray: [String] = []
//    取り出す問題が入っている配列
    var quizArray: [String] = []
//    配列を取得する時などに使うcount
    var quizCount = 0
//    スコアを表示するときに使うcount
    var correctCount = 0

//    画面を表示したときに実行するコード
    override func viewDidLoad() {
        super.viewDidLoad()
        
        csvArray = loadCSV(fileName: "quiz")
        
//        csvArrayの0行目をカンマ区切りでquizArrayに代入する
        quizArray = csvArray[quizCount].components(separatedBy: ",")

        quizNumberLabel.text = "第\(quizCount + 1)問"
        quizTextView.text = quizArray[0]
        answerButton1.setTitle(quizArray[2], for: .normal)
        answerButton2.setTitle(quizArray[3], for: .normal)
        answerButton3.setTitle(quizArray[4], for: .normal)
        answerButton4.setTitle(quizArray[5], for: .normal)

    
        // Do any additional setup after loading the view.
    }
    
//    ScoreViewControllerのcorrect(正解数の変数)に正解数をセットする
//    prepareメソッドは、セグエが実行される前に呼び出されるメソッド
//    segueは動作するsegue。senderは次のViewControllerに送信するObject(Any?だからなんでも送れる)

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        遷移先のViewController(ScoreViewController)を取得
//        as!で、ScoreViewControllerの時に値を取得。as!は取得に失敗したらアプリがクラッシュする(エラー発生)
        let scoreVC = segue.destination as! ScoreViewController
        scoreVC.correct = correctCount
    }
    
//    ボタンをクリックするとコンソールにtagを表示する
    @IBAction func btnAction(_ sender: UIButton) {
        if sender.tag == Int(quizArray[1]) {
          print("正解")
          correctCount += 1
//            正解画像を代入
            judgeImageView.image = UIImage(named: "correct")
        } else {
          print("不正解")
//            不正解画像を代入
            judgeImageView.image = UIImage(named: "incorrect")
        }
        print("スコア:\(correctCount)")
//       　表示する画像を表示
        judgeImageView.isHidden = false
        answerButton1.isEnabled = false
        answerButton2.isEnabled = false
        answerButton3.isEnabled = false
        answerButton4.isEnabled = false
//        一定時間後に処理を行う。今回は0.5秒後に実行する。
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//            表示する画像を非表示
            self.judgeImageView.isHidden = true
            self.answerButton1.isEnabled = true
            self.answerButton2.isEnabled = true
            self.answerButton3.isEnabled = true
            self.answerButton4.isEnabled = true
            self.nextQuiz()
        }
    }
    
//    次の問題をセットするメソッド
    func nextQuiz() {
        quizCount += 1
//        問題数がquizCountより少ない場合、問題をセットする
        if quizCount < csvArray.count {
            quizArray = csvArray[quizCount].components(separatedBy: ",")

            quizNumberLabel.text = "第\(quizCount + 1)問"
            quizTextView.text = quizArray[0]
            answerButton1.setTitle(quizArray[2], for: .normal)
            answerButton2.setTitle(quizArray[3], for: .normal)
            answerButton3.setTitle(quizArray[4], for: .normal)
            answerButton4.setTitle(quizArray[5], for: .normal)
        } else {
//            次の問題がなければ、スコア画面に遷移する
//            指定したIdentifierのSegue(遷移)を実行する。画面遷移先に何かしらを受け渡したい場合はsenderにセット。
            performSegue(withIdentifier: "toScoreVC", sender: nil)
        }
    }
    
//    問題文を1問ずつ、1つの文字列として配列に入れたものを返すメソッド
    func loadCSV(fileName: String) -> [String] {
//        ファイルネームを元にcsvファイルを読み込む。csvBundleには対象ファイルのフルパスが格納されている。
        let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv")!
        do {
//            String()で文字列に変換。contentsOfFileはファイルパス。encoding:は文字コードの指定(一般的にはutf8)。
//            対象のファイルの中身を取得する。csvDataにはファイルの記述内容が入る。
            let csvData = try String(contentsOfFile: csvBundle, encoding: String.Encoding.utf8)
//            改行に\rが使われていれば\nに書き換える。
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "\n")
//            改行毎に文字列を分割して、csvArray配列の中に入れる
            csvArray = lineChange.components(separatedBy: "\n")
//            リストの一番最後の配列を削除CSVファイルの構造上配列が無駄に作られてしまう。(\nだけの配列)
//            removeLast() -> 一番最後の要素を削除して、戻り値として削除した要素を返す
            csvArray.removeLast()
        } catch {
            print("エラー")
        }
        return csvArray
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
