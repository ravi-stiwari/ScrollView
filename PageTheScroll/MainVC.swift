//
//  MainVC.swift
//  PageTheScroll
//
//  Created by Ravi Tiwari on 3/4/17.
//  Copyright © 2017 SelfStudy. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    var images = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for x in 0...2{
            let image = UIImage(named: "icon\(x).png")
            images.append(UIImageView(image: image))
        }
        
        print("Count : \(images.count)")
    }

}

