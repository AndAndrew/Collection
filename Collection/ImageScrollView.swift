//
//  ImageScrollView.swift
//  Collection
//
//  Created by Andrey Krivokhizhin on 19.04.2022.
//

import UIKit

class ImageScrollView: UIScrollView {
    
    var imageZoomView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        delegate = self
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        decelerationRate = UIScrollView.DecelerationRate.fast
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        centerImage()
    }
    
    func set(image: UIImage) {
        
        imageZoomView = UIImageView(image: image)
        addSubview(imageZoomView)
        
        configurateFor(imageSize: image.size)
    }
    
    func configurateFor(imageSize: CGSize) {
        contentSize = imageSize
        
        setCurrentMaxAndMinZoomScale()
        zoomScale = minimumZoomScale
    }
    
    private func setCurrentMaxAndMinZoomScale() {
        let boundsSize = bounds.size
        let imageSize = imageZoomView.bounds.size
        
        let xScale = boundsSize.width / imageSize.width
        let yScale = boundsSize.height / imageSize.height
        let minScale = min(xScale, yScale)
        
        var maxScale: CGFloat = 1.0
        if minScale < 0.1 {
            maxScale = 0.3
        }
        if minScale >= 0.1 && minScale < 0.5 {
            maxScale = 0.7
        }
        if minScale >= 0.5 {
            maxScale = max(1.0, minScale)
        }
        
        minimumZoomScale = minScale
        maximumZoomScale = maxScale
    }
    
    private func centerImage() {
        let boundsSize = self.bounds.size
        var frameToCenter = imageZoomView.frame
        
        if frameToCenter.size.width < boundsSize.width {
            frameToCenter.origin.x = (boundsSize.width - frameToCenter.size.width) / 2
        } else {
            frameToCenter.origin.x = 0
        }
        
        if frameToCenter.size.height < boundsSize.height {
            frameToCenter.origin.y = (boundsSize.height - frameToCenter.size.height) / 2
        } else {
            frameToCenter.origin.y = 0
        }
        
        imageZoomView.frame = frameToCenter
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ImageScrollView: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imageZoomView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        centerImage()
    }
}
