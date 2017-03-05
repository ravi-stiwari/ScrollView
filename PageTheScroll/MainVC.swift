//
//  MainVC.swift
//  PageTheScroll
//
//  Created by Ravi Tiwari on 3/4/17.
//  Copyright © 2017 SelfStudy. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    var images = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
    }

    override func viewDidAppear(_ animated: Bool) {
        var contentWidth: CGFloat = 0.0
        let scrollViewWidth = scrollView.frame.size.width
        
        for x in 0...2 {
            let image = UIImage(named: "icon\(x).png")
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
            let newX: CGFloat = (scrollViewWidth / 2) + (scrollViewWidth * CGFloat(x))
            
            scrollView.addSubview(imageView)
            imageView.frame = CGRect(x: newX - 75 , y: ((scrollView.frame.size.height / 2) - 75) , width: 150, height: 150)
            contentWidth = scrollViewWidth * CGFloat(x+1)
        }
        scrollView.clipsToBounds = false
        scrollView.contentSize = CGSize(width: contentWidth, height: 150)
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                if((scrollView.contentOffset.x - scrollView.frame.size.width) >= 0){
                    scrollView.setContentOffset(CGPoint(x: scrollView.contentOffset.x - 250, y: scrollView.frame.size.height - 150), animated: true)
                }
                break
            case UISwipeGestureRecognizerDirection.left:
                if((scrollView.contentOffset.x + scrollView.frame.size.width) < scrollView.contentSize.width) {
                    scrollView.setContentOffset(CGPoint(x: scrollView.contentOffset.x + 250, y: scrollView.frame.size.height - 150), animated: true)
                }
                break
            default:
                break
            }
        }
    }
}
