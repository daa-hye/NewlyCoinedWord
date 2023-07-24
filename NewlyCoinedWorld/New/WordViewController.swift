//
//  WordViewController.swift
//  NewlyCoinedWorld
//
//  Created by 박다혜 on 2023/07/21.
//

import UIKit

class WordViewController: UIViewController {


    @IBOutlet var wordTextField: UITextField!
    @IBOutlet var meaningLabel: UILabel!
    @IBOutlet var wordFirstButton: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        wordFirstButton.titleLabel?.font = .systemFont(ofSize: 20)
        wordFirstButton.titleLabel?.textColor = .black
        getRandomWord()

        wordFirstButton.isHidden = true

    }

    @discardableResult
    func getRandomWord() -> String {
        let randomList = ["고래밥","포카칩","팝콘","도리토스"]
        let result = randomList.randomElement()!
        return result
    }


    //버튼 클릭 시 텍스트 필드의 텍스트에 버튼 타이틀이 들어가는 기능
    @IBAction func wordButtonDidTap(_ sender: UIButton) {
        wordTextField.text = sender.currentTitle
        // sender.titleLabel?.text
        textFieldKeyboardDidTap(wordTextField)
    }

    @IBAction func textFieldKeyboardDidTap(_ sender: UITextField) {
        switch wordTextField.text?.lowercased() {
        case "별다줄" :
            meaningLabel.text = "별 걸 다 줄인다"
        case "뉴진스" :
            meaningLabel.text = "❤️"
        case "jmt" : //, "JMT" :
            meaningLabel.text = "매우 맛있다"
        default :
            meaningLabel.text = "찾으시는 결과가 없습니다"
        }
    }

    
}
