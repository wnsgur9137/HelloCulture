//
//  SearchView.swift
//  
//
//  Created by JUNHYEOK LEE on 2023/04/30.
//

import UIKit

final class SearchView: UIView {
    
    private let searchTextField: UITextField = {
        let systemGrayColor: UIColor = .systemGray
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = systemGrayColor.cgColor
        textField.placeholder = "검색"
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 20.0, weight: .regular)
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        addSubviews()
        setLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        self.addSubview(searchTextField)
    }
    
    private func setLayoutConstraints() {
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 12.0),
            searchTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12.0),
            searchTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12.0),
            searchTextField.heightAnchor.constraint(equalToConstant: 50.0)
        ])
    }
}
