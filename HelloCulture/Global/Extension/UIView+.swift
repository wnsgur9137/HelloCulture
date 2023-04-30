//
//  UIView+.swift
//  HelloCulture
//
//  Created by JUNHYEOK LEE on 2023/04/16.
//

import UIKit

extension UIView {
    func configureTopCornerRadius(radius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerCurve = .continuous
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
}
