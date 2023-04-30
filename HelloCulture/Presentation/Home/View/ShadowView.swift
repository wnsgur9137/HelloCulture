//
//  ShadowView.swift
//  HelloCulture
//
//  Created by 이준혁 on 2023/04/08.
//

import UIKit

final class ShadowView: UIView {
    init() {
        super.init(frame: CGRect())
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor(cgColor: CGColor(red: 0, green: 0, blue: 0, alpha: 0.7))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
