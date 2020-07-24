//
//  ViewController.swift
//  SlideshowApp
//
//  Created by FUSAMAMASAKI on 2020/07/17.
//  Copyright © 2020 FUSAMAMASAKI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var smallView: UIImageView!
    @IBOutlet weak var ahead: UIButton!    //進む釦無効の為、初回提出後に追加した!
    @IBOutlet weak var back: UIButton!     //戻る釦無効の為、初回提出後に追加した!
    
    var answerNumber:Int = 0    //スライド（"gu","choki","pa")の制御変数の初期化
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        smallView.image = UIImage(named:"gu")
    }
    
    @IBAction func small(_ sender: Any) {               //第一画面の画像釦(small)
        
        if self.timer == nil {
        return                       //タイマー停止中なので、単に画面遷移する
        
      } else {
        if self.timer != nil {
            
        self.timer.invalidate()      //タイマー稼働中なので、画面遷移前にタイマー停止する
        self.timer = nil
    
        }
      }
    }
    
    
    
    
        
    @IBAction func aheadButton(_ sender: Any) {     //進む釦の機能プログラム
    
     if self.timer == nil {
        
        self.answerNumber += 1
        self.answerNumber %= 3
        
     if self.answerNumber == 0 {
            smallView.image = UIImage(named:"gu")
     } else if self.answerNumber == 1 {
            smallView.image = UIImage(named:"choki")
     } else if self.answerNumber == 2 {
            smallView.image = UIImage(named:"pa")
        }
     } else {
        return
     }
    }


    @IBAction func backButton(_ sender: Any) {      //戻る釦の機能プログラム
        
        if self.timer == nil {
        self.answerNumber -= 1
        if self.answerNumber < 0 {
        self.answerNumber = self.answerNumber + 3
        }
        
        print("answerNumber(1) = \(answerNumber)")
        
        if self.answerNumber == 0 {
            smallView.image = UIImage(named: "gu")
        } else if self.answerNumber == 1 {
            smallView.image = UIImage(named: "choki")
        } else if self.answerNumber == 2 {
            smallView.image = UIImage(named: "pa")
        }
      } else {
        return
      }
    }
    
    var timer:Timer!
    var timer_sec:Int = 0
    var update:String = "gu"
    @objc func updateTimer(_ timer:Timer){          // *****？疑問だった？******
        self.timer_sec += 1
        self.answerNumber += 1
        self.answerNumber %= 3
        
        if self.answerNumber == 0 {
            smallView.image = UIImage(named:"gu")
            print("2秒自動画像 = gu")
           } else if self.answerNumber == 1 {
            smallView.image = UIImage(named:"choki")
            print("2秒自動画像 = choki")
           } else if self.answerNumber == 2 {
            smallView.image = UIImage(named:"pa")
            print("2秒自動画像 = pa")
        }
    }                                               // *****？疑問だった？******
   
    
    var count:Int = 0           //再生・停止ボタンのセット/リセット制御変数の初期化
   
    @IBOutlet weak var setReset: UIButton!          //再生・停止ボタン(setReset)
    
    @IBAction func setReset(_ sender: UIButton) {
    
        //"isEnabled = false"移動前の位置：ココ
        
        count %= 2                  //再生・停止ボタンのセット/リセット制御変数で仕分け
        if count == 0 {             //再生状態である
          sender.setTitle("停止", for: .normal)
            
          if self.timer == nil {
            ahead.isEnabled = false                    //進む釦の無効。初回提出後に追加した!
            back.isEnabled = false                     //戻る釦の無効。初回提出後に追加した!
            
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            count += 1
            }
         }
         else {                     //停止状態である
            
          sender.setTitle("再生", for: .normal)
            
          if self.timer != nil {
            
                self.timer.invalidate()
                self.timer = nil
                ahead.isEnabled = true                       //進む釦の有効。初回提出後に追加した!
                back.isEnabled = true                        //戻る釦の有効。初回提出後に追加した!
                count += 1
            }
        }
        print("count[再生:1,停止:2] =\(count)")
        print("timer_sec =\(timer_sec)")
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        resultViewController.x = smallView.image!
    }
    
    @IBAction func unwind(_ segue:UIStoryboardSegue){
        
        if count == 1 {             //画像遷移前はタイマー稼働中だった
            
            ahead.isEnabled = false                    //進む釦の無効。初回提出後に追加した!
            back.isEnabled = false                     //戻る釦の無効。初回提出後に追加した!
            
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)

        
         } else {                   //画像遷移前はタイマー停止中だった
            

                ahead.isEnabled = true                       //進む釦の有効。初回提出後に追加した!
                back.isEnabled = true                        //戻る釦の有効。初回提出後に追加した!
            
    
        
        }
        print("count2 [再生:1,停止:2] =\(count)")
        print("timer_sec2 =\(timer_sec)")
    }
    
}

