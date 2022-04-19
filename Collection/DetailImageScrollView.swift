//
//  DetailImageScrollView.swift
//  Collection
//
//  Created by Andrey Krivokhizhin on 19.04.2022.
//

import UIKit

class DetailImageScrollView: UIScrollView {
    
    var imageZoomView: UIImageView!
    var firstTime = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        delegate = self
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        maximumZoomScale = 5
        minimumZoomScale = 0.2
        
        decelerationRate = UIScrollView.DecelerationRate.fast
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        centerImage()
        if firstTime {
            setCurrentZoomScale()
        }
    }
    
    func set(image: UIImage) {
        
        imageZoomView = UIImageView(image: image)
        addSubview(imageZoomView)
    }
    
    private func setCurrentZoomScale() {
        firstTime = !firstTime
        let boundsSize = bounds.size
        let imageSize = imageZoomView.bounds.size
        
        let xScale = boundsSize.width / imageSize.width
        let yScale = boundsSize.height / imageSize.height
        let currentScale = min(xScale, yScale)
        zoomScale = currentScale
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

extension DetailImageScrollView: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        subviews.first
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        centerImage()
    }
}
