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
    
    let textLabel: UILabel = {
        let text = UILabel()
        text.textColor = .white
        text.font = UIFont(name: "Rockwell", size: 24)
        text.numberOfLines = 0
        text.lineBreakMode = .byWordWrapping
        return text
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
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(textLabel)
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: backgroundTextView.topAnchor, constant: 20),
            textLabel.leadingAnchor.constraint(equalTo: backgroundTextView.leadingAnchor, constant: 20),
            textLabel.trailingAnchor.constraint(equalTo: backgroundTextView.trailingAnchor, constant: -20),
            textLabel.bottomAnchor.constraint(equalTo: backgroundTextView.bottomAnchor, constant: -20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
