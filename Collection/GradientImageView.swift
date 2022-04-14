//
//  GradientImageView.swift
//  Collection
//
//  Created by Andrey Krivokhizhin on 14.04.2022.
//

import UIKit

class GradientImageView: UIImageView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.65)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
