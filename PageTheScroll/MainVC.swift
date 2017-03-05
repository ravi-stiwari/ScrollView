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
}

