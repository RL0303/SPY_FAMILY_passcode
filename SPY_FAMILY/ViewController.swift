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
    let spyFamilyFileNames = ["Anya.png", "Loid.png", "Yor.png",  "Bond.png"]
    
    //建立好用來顯示密碼圖片的imageViews陣列
    var digitImageViews: [UIImageView] = []
    
    //密碼影像區塊View outlet
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

    //四個密碼圖片imageView outlet
    @IBOutlet weak var firstDigitImageView: UIImageView!
    
    @IBOutlet weak var secondDigitImageView: UIImageView!
    
    @IBOutlet weak var thirdDigitImageView: UIImageView!
    
    @IBOutlet weak var fourthDigitImageView: UIImageView!
    
    //放大刪除按鈕圖片的函式
    func enlargeDeleteButtonImage() {
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 23, weight: .medium, scale: .medium)
        let largeDeleteIcon = UIImage(systemName: "delete.backward.fill", withConfiguration: largeConfig)
        deleteButton.setImage(largeDeleteIcon, for: .normal)
    }
    
    //根據使用者輸入數字的個數來顯示密碼圖片
    func showDigitImage() {
        //先將所有密碼圖片View放到一個陣列中
        let digitViews = [firstDigitView, secondDigitView, thirdDigitView, fourthDigitView]
        //根據userInputs的數量來顯示哪幾個密碼圖片要顯示出來
        for index in 0...userInputs.count - 1 {
            let view = digitViews[index]
            view?.backgroundColor = UIColor.clear
            digitImageViews[index].isHidden = false
        }
    }
    
    //隱藏所有的密碼圖片
    func hideAllDigitImages() {
        let digitViews = [firstDigitView, secondDigitView, thirdDigitView, fourthDigitView]
        for index in 0...digitViews.count - 1 {
            let view = digitViews[index]
            view?.backgroundColor = UIColor.systemGray2
            digitImageViews[index].isHidden = true
        }
    }
    
    //檢查密碼輸入是否正確，只在userInputs長度為4時觸發檢查
    func checkInputsCount() {
        if userInputs.count < 4 {
            return
        } else if userInputs.count == 4 {
            if userInputs == password {
                //密碼輸入正確會顯示「解鎖成功」
                resultLabel.text = "解鎖成功！"
                resultLabel.isHidden = false
                performSegue(withIdentifier: "showPost", sender: nil)
            } else {
                // 0.3秒後執行
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    //密碼輸入錯誤清空userInputs並且顯示錯誤訊息
                    //因為userInputs清空，所以圖片會全部消失
                    self.userInputs = []
                    self.resultLabel.text = "密碼錯誤，請重新輸入"
                    self.resultLabel.isHidden = false
                    self.hideAllDigitImages()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //將四個密碼圖片區塊用mask做出剪影和圖片
        let numberButtons = [zeroButton, oneButton, twoButton, threeButton, fourButton, fiveButton, sixButton, sevenButton, eightButton, nineButton]
        let digitViews = [firstDigitView, secondDigitView, thirdDigitView, fourthDigitView]
        
        digitImageViews = [firstDigitImageView, secondDigitImageView, thirdDigitImageView, fourthDigitImageView]
        for index in 0...digitViews.count - 1 {
            let mask = UIImageView(image: UIImage(named: spyFamilyFileNames[index]))
            digitViews[index]!.mask = mask
            digitImageViews[index].frame = CGRect(origin: .zero, size: mask.frame.size)
            digitImageViews[index].isHidden = true
        }
        
        //將按鈕的數字放大
        for index in 0...numberButtons.count - 1  {
            var title = AttributedString(String(index))
            title.font = UIFont(name: "Helvetica", size: 30)
            numberButtons[index]?.setAttributedTitle(NSAttributedString(title), for: .normal)
        }
        
        //放大刪除按鈕的圖案、隱藏結果訊息label
        enlargeDeleteButtonImage()
        resultLabel.isHidden = true
    }

    @IBAction func inputNumberButtons(_ sender: UIButton) {
        //檢查userInputs如果長度為4就直接結束action，用在解鎖成功的時
        if userInputs.count == 4 {
            return
        }
        //輸入數字時要清空之前的結果訊息
        resultLabel.text = ""
        //從button的attributedTitle擷取按了哪個數字
        let userInput = sender.attributedTitle(for: .normal)?.string
        //字串轉為整數型態
        let userInputInt = Int(userInput!)!
        print(userInputInt)
        //加到userInputs陣列中
        userInputs.append(userInputInt)
        print(userInputs)
        //根據輸入了幾個密碼位數來顯示幾個圖片
        showDigitImage()
        //加入陣列後後再次確認長度，必要時就核對密碼
        checkInputsCount()
    }
    
    @IBAction func deleteOneDigit(_ sender: Any) {
        //如果長度為0就代表不用作用，直接return
        if userInputs.count == 0 {
            return
        }
        //刪除時也清空結果訊息
        resultLabel.text = ""
        //移除userInpus最後一個位數，_代表return出來的東西後續不再使用
        let _ = userInputs.popLast()
        print(userInputs)
        //處理完之後再檢查一次userInputs，如果為0就隱藏密碼圖片
        //如果不為0就先全部隱藏後再顯示對應數量的密碼圖片
        if userInputs.count == 0 {
            hideAllDigitImages()
        } else {
            hideAllDigitImages()
            showDigitImage()
        }
    }

}

