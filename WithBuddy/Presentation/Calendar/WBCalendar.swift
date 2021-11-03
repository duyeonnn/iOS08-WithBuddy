//
//  WBCalendar.swift
//  WithBuddy
//
//  Created by 이나정 on 2021/11/03.
//

import UIKit

class WBCalendar: UIView {
    private let thisMonth = UILabel()
    private let prevMonthButton = UIButton()
    private let nextMonthButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureMonth()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureMonth()
    }
    
    private func configureMonth() {
        self.addSubview(thisMonth)
        self.addSubview(prevMonthButton)
        self.addSubview(nextMonthButton)
        thisMonth.text = "2021년 10월"
        thisMonth.textColor = UIColor(named: "LabelPurple")
        thisMonth.font = .boldSystemFont(ofSize: 17)
        prevMonthButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        nextMonthButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        self.thisMonth.translatesAutoresizingMaskIntoConstraints = false
        self.prevMonthButton.translatesAutoresizingMaskIntoConstraints = false
        self.nextMonthButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.thisMonth.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            self.thisMonth.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.thisMonth.widthAnchor.constraint(equalToConstant: thisMonth.intrinsicContentSize.width),
            self.prevMonthButton.centerYAnchor.constraint(equalTo: self.thisMonth.centerYAnchor),
            self.nextMonthButton.centerYAnchor.constraint(equalTo: self.thisMonth.centerYAnchor),
            self.prevMonthButton.trailingAnchor.constraint(equalTo: self.thisMonth.leadingAnchor),
            self.prevMonthButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.nextMonthButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.nextMonthButton.leadingAnchor.constraint(equalTo: self.thisMonth.trailingAnchor)
        ])
    }
}
