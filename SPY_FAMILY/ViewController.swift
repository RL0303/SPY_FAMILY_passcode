//
//  ViewController.swift
//  SPY_FAMILY
//
//  Created by Robert Lin on 2022/12/1.
//

import UIKit

class ViewController: UIViewController {
    
    //設定正確密碼為一個陣列
    let password = [0, 0, 0, 0]
    
    //使用者輸入數字也是用一個陣列存起來，一開始目前是空的
    var userInputs: [Int] = []
    
    //四個密碼圖片的檔案名稱存入陣列
    let facelessMenFileNames = ["Anya.png", "Loid.png", "Yor.png",  "Bond.png"]
    
    //建立好用來顯示密碼圖片的imageViews陣列
    var digitImageViews: [UIImageView] = []
    
    //密碼圖像區塊View outlet
    @IBOutlet weak var firstDigitView: UIView!
    
    @IBOutlet weak var secondDigitView: UIView!
    
    @IBOutlet weak var thirdDigitView: UIView!
    
    @IBOutlet weak var fourthDigitView: UIView!
    
    //數字0~9和刪除button outlet
    @IBOutlet weak var deleteButton: UIButton!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var oneButton: UIButton!
    
    @IBOutlet weak var twoButton: UIButton!
    
    @IBOutlet weak var threeButton: UIButton!
    
    @IBOutlet weak var fourButton: UIButton!
    
    @IBOutlet weak var fiveButton: UIButton!
    
    @IBOutlet weak var sixButton: UIButton!
    
    @IBOutlet weak var sevenButton: UIButton!
    
    @IBOutlet weak var eightButton: UIButton!
    
    @IBOutlet weak var nineButton: UIButton!
    
    @IBOutlet weak var zeroButton: UIButton!

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

