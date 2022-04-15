//
//  StoryContentVCCell.swift
//  Collection
//
//  Created by Andrey Krivokhizhin on 15.04.2022.
//

import UIKit

class StoryContentVCCell: UICollectionViewCell {
    
    let backgroundTextView : UIView = {
        let backgroundView = UIView()
        backgroundView.layer.borderWidth = 1
        backgroundView.layer.borderColor = UIColor.white.cgColor
        backgroundView.layer.cornerRadius = 8
        
        return backgroundView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        backgroundTextView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(backgroundTextView)
        
        NSLayoutConstraint.activate([
            backgroundTextView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backgroundTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backgroundTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
