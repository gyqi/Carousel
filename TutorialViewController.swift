//
//  TutorialViewController.swift
//  Carousel
//
//  Created by Grace Qi on 2/9/16.
//  Copyright © 2016 Grace Qi. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var tutorialScrollView: UIScrollView!
    @IBOutlet weak var tutorialPageControl: UIPageControl!
    
    @IBOutlet weak var carouselSpinImageView: UIImageView!
    @IBOutlet weak var carouselSpinButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tutorialScrollView.contentSize = CGSize(width: 1280, height: 568)
        tutorialScrollView.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        
        // Get the current page based on the scroll offset
        let page : Int = Int(round(scrollView.contentOffset.x / 320))
       
        // Set the current page, so the dots will update
        tutorialPageControl.currentPage = page

        if(page == 3)  {
            tutorialPageControl.hidden = true
            carouselSpinImageView.alpha = 1
            
        }
        else {
            tutorialPageControl.hidden = false
            carouselSpinImageView.alpha = 0
        }
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
