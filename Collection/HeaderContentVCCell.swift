//
//  HeaderContentVCCell.swift
//  Collection
//
//  Created by Andrey Krivokhizhin on 14.04.2022.
//

import UIKit

class HeaderContentVCCell: UICollectionViewCell {
    
    let imageView : GradientImageView = {
        let hCellImage = GradientImageView()
        
        hCellImage.contentMode = .scaleAspectFill
        hCellImage.clipsToBounds = true
        hCellImage.layer.cornerRadius = 10
        hCellImage.layer.borderWidth = 1
        hCellImage.layer.borderColor = UIColor.white.cgColor
        return hCellImage
    }()
    
    let contentTypeLabel: UILabel = {
        let typeLabel = UILabel()
        
        typeLabel.layer.borderWidth = 1
        typeLabel.layer.cornerRadius = 8
        typeLabel.font = UIFont(name: "Rockwell", size: 24)
        typeLabel.layer.borderColor = UIColor.white.cgColor
        typeLabel.textColor = .white
        typeLabel.textAlignment = .center
        typeLabel.backgroundColor = .black
        typeLabel.clipsToBounds = true
        return typeLabel
    }()
    
    let lineView: UIView = {
        let line = UIView()
        
        line.backgroundColor = .white
        
        return line
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 10
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 500)
        ])
        
        contentTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(contentTypeLabel)
        
        NSLayoutConstraint.activate([
            contentTypeLabel.heightAnchor.constraint(equalToConstant: 40),
            contentTypeLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -20),
            contentTypeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 116),
            contentTypeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -116)
        ])
        
        lineView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(lineView)
        
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -1),
            lineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 100),
            lineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -100),
            lineView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
