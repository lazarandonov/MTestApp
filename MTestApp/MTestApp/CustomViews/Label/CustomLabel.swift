//
//  CustomLabel.swift
//  MtestApp
//
//  Created by Lazar Andonov on 2.3.23..
//

import UIKit

enum FontType {
    case bold
    case regular
}

class CustomLabel: UILabel {

    // MARK: - Initialization
    convenience init() {
        self.init(frame: .zero)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        font = UIFont.systemFont(ofSize: 16)
        textColor = .black
    }

    // MARK: - Methods
    func setFontSize(to fontSize: CGFloat, type: FontType = .regular, color: UIColor = .black) {
        switch type {
        case .bold: font = UIFont.boldSystemFont(ofSize: fontSize)
        case .regular: font = UIFont.systemFont(ofSize: fontSize)
        }
        textColor = color
    }
}
