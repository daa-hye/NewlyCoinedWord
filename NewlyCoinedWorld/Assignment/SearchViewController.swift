//
//  searchViewController.swift
//  NewlyCoinedWorld
//
//  Created by 박다혜 on 2023/07/20.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet var searchBarView: UIView!
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var wordListStackView: UIStackView!
    @IBOutlet var wordLabelList: [UILabel]!
    @IBOutlet var wordMeaingLabel: UILabel!

    let coinedWord = [
        "중꺾마" : "중요한건 꺾이지 않는 마음",
        "중꺾그마" : "중요한건 꺾였는데도 그냥 하는 마음",
        "그 잡채" : "그 자체",
        "분좋카" : "분위기 좋은 카페",
        "내봬누" : "내일 봬요 누나",
        "오저치고" : "오늘 저녁 치킨 고?",
        "웃안웃" : "웃긴데 안웃겨",
        "깊꾸" : "기프티콘 꾸미기",
        "쩝쩝박사" : "맛있는 음식, 음식 조합을 잘 알고 있는 사람",
        "꾸웨엑?" : "후회해?"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setWordData()
        setWordLabelDesign()
        setSearchBarDesign()
        setMeaningLabelDesign()
        setWordData()
    }

    @IBAction func searchButtonDidTap(_ sender: UITapGestureRecognizer) {
        searchTextFieldKeyboardDidTap(searchTextField)
        view.endEditing(true)
    }

    @IBAction func searchTextFieldKeyboardDidTap(_ sender: UITextField) {
        let searchKeyword = searchTextField.text
        if coinedWord.keys.contains(searchKeyword ?? "") {
            wordMeaingLabel.text = coinedWord[searchKeyword ?? ""]
        } else if searchKeyword == "" {

        } else {
            wordMeaingLabel.text = "등록되어있지 않습니다"
        }
        setWordData()
    }

    @IBAction func wordLabelDidTap(_ sender: UITapGestureRecognizer) {
        let keyword = (sender.view as? UILabel)?.text
        searchTextField.text = keyword
        searchTextFieldKeyboardDidTap(searchTextField)
        view.endEditing(true)
    }

    @IBAction func mainViewDidTap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    func setWordLabelDesign() {
        wordListStackView.distribution = .fillEqually
        for item in wordLabelList {
            item.textAlignment = .center
            item.layer.borderColor = UIColor.black.cgColor
            item.layer.borderWidth = 1
            item.layer.cornerRadius = 10
        }
    }

    func setSearchBarDesign() {
        searchBarView.backgroundColor = .black
    }

    func setMeaningLabelDesign() {
        wordMeaingLabel.textAlignment = .center
    }

    func setWordData() {
        var keywords: [String] = []
        let currentKeyword = searchTextField.text

        while true {
            let pickedWord = coinedWord.keys.randomElement()!

            guard pickedWord != currentKeyword
            else { continue }

            if !keywords.contains(pickedWord) {
                keywords.append(pickedWord)
            }
            if keywords.count == 4 {
                break
            }
        }

        for i in 0..<wordLabelList.count {
            wordLabelList[i].text = keywords[i]
        }
    }

}
