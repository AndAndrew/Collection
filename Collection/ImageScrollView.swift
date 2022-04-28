//
//  ImageScrollView.swift
//  Collection
//
//  Created by Andrey Krivokhizhin on 19.04.2022.
//

import UIKit

class ImageScrollView: UIScrollView {
    
    var imageZoomView: UIImageView!
    
    lazy var zoomingTap: UITapGestureRecognizer = {
        let zoomingTap = UITapGestureRecognizer(target: self, action: #selector(handleZoomingTap))
        zoomingTap.numberOfTapsRequired = 2
        return zoomingTap
    }()
    
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
        
        self.imageZoomView.addGestureRecognizer(self.zoomingTap)
        self.imageZoomView.isUserInteractionEnabled = true
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
    
    @objc func handleZoomingTap(sender: UITapGestureRecognizer) {
        let location = sender.location(in: sender.view)
        self.zoom(point: location, animated: true)
    }
    
    func zoom(point: CGPoint, animated: Bool) {
        let currectScale = self.zoomScale
        let minScale = self.minimumZoomScale
        let maxScale = self.maximumZoomScale
        
        if (minScale == maxScale && minScale > 1) {
            return
        }
        
        let toScale = maxScale
        let finalScale = (currectScale == minScale) ? toScale : minScale
        let zoomRect = self.zoomRect(scale: finalScale, center: point)
        self.zoom(to: zoomRect, animated: animated)
    }
    
    func zoomRect(scale: CGFloat, center: CGPoint) -> CGRect {
        var zoomRect = CGRect.zero
        let bounds = self.bounds
        
        zoomRect.size.width = bounds.size.width / scale
        zoomRect.size.height = bounds.size.height / scale
        
        zoomRect.origin.x = center.x - (zoomRect.size.width / 2)
        zoomRect.origin.y = center.y - (zoomRect.size.height / 2)
        return zoomRect
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
