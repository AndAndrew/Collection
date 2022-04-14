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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
