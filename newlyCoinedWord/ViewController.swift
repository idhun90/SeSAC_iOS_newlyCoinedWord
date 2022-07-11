//
//  ViewController.swift
//  newlyCoinedWord
//
//  Created by 이도헌 on 2022/07/10.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var resultButton1: UIButton!
    @IBOutlet weak var resultButton2: UIButton!
    @IBOutlet weak var resultButton3: UIButton!
    @IBOutlet weak var resultButton4: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultImage: UIImageView!
    
    //해시태그 아울렛 컬렉션
    @IBOutlet var buttonList: [UIButton]!
    
    let list = [
        "모각코": "모여서 각자 코딩", "무물보": "무엇이든물어보세요", "쿠쿠루삥뽕": "ㅋㅋㅋㅋ", "알잘딱깔센": "알아서 잘 딱 깔끔하고 센스있게", "쉽살재빙": "쉽게만 살면 재미없고 빙고"
    ]
    
    //해시태그 추적 관리용
    var buttonNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designButton(resultButton1)
        designButton(resultButton2)
        designButton(resultButton3)
        designButton(resultButton4)
        designTextField()
        desingResultPage()
        
        //해시태그 버튼 숨김 처리
        for i in buttonList {
            
            i.isHidden = true
            
        }
    }
    
    func designButton(_ button: UIButton) {
        
        button.setTitle("", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.systemOrange.cgColor
        button.layer.backgroundColor = UIColor.white.cgColor
        button.tintColor = .black
        
    }
    
    func designTextField() {
        
        textField.placeholder = "신조어를 입력하세요."
        textField.attributedPlaceholder = NSAttributedString(string:textField.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
        
    }
    
    func desingResultPage() {
        
        resultImage.image = UIImage(named: "background")
        resultLabel.text = "신조어의 의미는?"
        resultLabel.textColor = .systemOrange
        resultLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
    }
    
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func searchActionWithButton(_ sender: UIButton) {
        
        resultLabel.text = ""
        let userInputText = textField.text
        guard let userInputText = userInputText else { return }
        
        changeAndReturn(userInputText)
        hashTag(sender: userInputText)
        
    }
    
    
    @IBAction func searchActionWithReturnKey(_ sender: UITextField) {
        
        resultLabel.text = ""
        let userInputText = sender.text
        guard let userInputText = userInputText else { return }
        
        changeAndReturn(userInputText)
        hashTag(sender: userInputText)
        
    }
    
    func changeAndReturn(_ sender: String) {
        
        resultLabel.textColor = .systemOrange // default 구문이 실행된 후 텍스트 컬러가 계속 빨간색으로 설정되어 있는 부분 초기화
        
        switch sender {
        case "모각코":
            resultLabel.text = list[sender]
        case "무물보":
            resultLabel.text = list[sender]
        case "쿠쿠루삥뽕":
            resultLabel.text = list[sender]
        case "알잘딱깔센":
            resultLabel.text = list[sender]
        case "쉽살재빙":
            resultLabel.text = list[sender]
        default:
            resultLabel.textColor = .red
            resultLabel.text = "검색한 신조어 정보가 없습니다."
        }
        
        textField.text = ""
    }
    
    func hashTag(sender: String) {
        
        buttonList[buttonNumber].setTitle(sender, for: .normal)
        buttonList[buttonNumber].isHidden = false
        buttonNumber += 1
        
        
        if buttonNumber == buttonList.count {
            buttonNumber = 0
        }
        
        
    }
    
}


