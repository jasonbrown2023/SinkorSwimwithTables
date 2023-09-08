//
//  ViewController.swift
//  UIExample
//
//  Created by jason brown on 12/06/1402 AP.
//

import UIKit

class ViewController: UIViewController , UIScrollViewDelegate{

    lazy var imageModel = {
        return ImageModel.sharedInstance()
    }()
    
    
    lazy private var imageView: UIImageView? = {
        return UIImageView.init(image: imageModel.getImageWithName(displayImageName))
        
    }()
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var  displayImageName = "miadadralphie"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.imageView.image = UIImage.init(named:"lizard")
        //print(self.imageModel.imageNames);
        //self.imageView.image = self.imageModel.getImageWithName(displayImageName
      
        
        
        if let size = self.imageView?.image?.size{
            self.scrollView.addSubview(self.imageView!)
            self.scrollView.contentSize = size
            self.scrollView.minimumZoomScale = 0.1
            self.scrollView.delegate = self
            
        }
            
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }


}

