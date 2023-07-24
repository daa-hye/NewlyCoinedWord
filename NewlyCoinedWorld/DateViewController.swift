//
//  DateViewController.swift
//  NewlyCoinedWorld
//
//  Created by 박다혜 on 2023/07/20.
//

import UIKit

class DateViewController: UIViewController {


    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var shadowViews: [UIView]!
    @IBOutlet var backgroundImages: [UIImageView]!
    @IBOutlet var dateLabels: [UILabel]!
    @IBOutlet var background100ImageView: UIImageView!
    @IBOutlet var background200ImageView: UIImageView!
    @IBOutlet var background300ImageView: UIImageView!
    @IBOutlet var background400ImageView: UIImageView!
    @IBOutlet var date100Label: UILabel!
    @IBOutlet var date200Label: UILabel!
    @IBOutlet var date300Label: UILabel!
    @IBOutlet var date400Label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // setDateLabelValue()
        setDataPickerDesign()
        setBackgroundDesign()
        setLabelDesign()
        datePickerValueChanged(datePicker)
    }


    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        // DateFormatter : 1.시간대 변경 2. 날짜 포맷 변경
        let format = DateFormatter()
        format.dateFormat = "yyyy년 MM월 dd일"

        let dayPlus100 = Calendar.current.date(byAdding: .day, value: 100, to: sender.date)
        let dayPlus200 = Calendar.current.date(byAdding: .day, value: 200, to: sender.date)
        let dayPlus300 = Calendar.current.date(byAdding: .day, value: 300, to: sender.date)
        let dayPlus400 = Calendar.current.date(byAdding: .day, value: 400, to: sender.date)

        date100Label.text = format.string(from: dayPlus100!)
        date200Label.text = format.string(from: dayPlus200!)
        date300Label.text = format.string(from: dayPlus300!)
        date400Label.text = format.string(from: dayPlus400!)
    }

    func setDateLabelValue() {
        let format = DateFormatter()
        format.dateFormat = "yyyy년 MM월 dd일"

        let dayPlus100 = Calendar.current.date(byAdding: .day, value: 100, to: Date())
        let dayPlus200 = Calendar.current.date(byAdding: .day, value: 200, to: Date())
        let dayPlus300 = Calendar.current.date(byAdding: .day, value: 300, to: Date())
        let dayPlus400 = Calendar.current.date(byAdding: .day, value: 400, to: Date())
        date100Label.text = format.string(from: dayPlus100!)
        date200Label.text = format.string(from: dayPlus200!)
        date300Label.text = format.string(from: dayPlus300!)
        date400Label.text = format.string(from: dayPlus400!)
    }

    func setBackgroundDesign() {
        for item in backgroundImages {
            item.layer.cornerRadius = 20
            item.clipsToBounds = true
        }

        for item in shadowViews {
            item.layer.cornerRadius = 20
            item.layer.shadowColor = UIColor.black.cgColor
            item.layer.shadowOffset = .zero // 빛을 비추는 방향
            item.layer.shadowRadius = 5  // 그림자 퍼짐 정도
            item.layer.shadowOpacity = 0.7 // 불투명도
            item.clipsToBounds = false
        }

        background100ImageView.image = UIImage(named: "1")
        background200ImageView.image = UIImage(named: "2")
        background300ImageView.image = UIImage(named: "3")
        background400ImageView.image = UIImage(named: "4")
    }

    func setLabelDesign() {
        for item in dateLabels {
            item.textAlignment = .center
            item.font = .boldSystemFont(ofSize: 15)
            item.textColor = .white
        }
        date100Label.layer.cornerRadius = 20
        date100Label.clipsToBounds = true
    }

    func setDataPickerDesign() {
        datePicker.datePickerMode = .date
        datePicker.tintColor = .systemPink
        if #available(iOS 14.0, *) {
            datePicker.preferredDatePickerStyle = .inline
        } else {
            datePicker.preferredDatePickerStyle = .wheels
        }
    }

}
