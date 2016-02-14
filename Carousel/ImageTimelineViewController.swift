//
//  ImageTimelineViewController.swift
//  Carousel
//
//  Created by Grace Qi on 2/10/16.
//  Copyright © 2016 Grace Qi. All rights reserved.
//

import UIKit

class ImageTimelineViewController: UIViewController {

    @IBOutlet weak var imageTimelineScrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    
    @IBOutlet weak var learnMoreBannerImageView: UIImageView!
    @IBOutlet weak var learnMoreButton: UIButton!
    @IBOutlet weak var dismissButton: UIButton!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    
    override func viewWillAppear(animated: Bool) {
        if defaults.boolForKey("banner_dismissed") == true {
            hideTutorial()
            defaults.setBool(true, forKey: "banner_dismissed")
            defaults.synchronize()
            print("1st")
        } else {
            if defaults.boolForKey("has_viewPhoto") == true && defaults.boolForKey("has_useTimewheel") == true && defaults.boolForKey("has_sharePhoto") == true {
                hideTutorial()
                defaults.setBool(true, forKey: "banner_dismissed")
                defaults.synchronize()
                print("2nd")
            } else {
                showTutorial()
                print("3rd")
            }
        
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageTimelineScrollView.contentSize = feedImageView.frame.size

        // Reset the banner_dismissed bool so the banner will show up again
        defaults.setBool(false, forKey: "banner_dismissed")
        defaults.setBool(false, forKey: "has_viewPhoto")
        defaults.setBool(false, forKey: "has_useTimewheel")
        defaults.setBool(false, forKey: "has_sharePhoto")
        defaults.synchronize()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressLearnMoreButton(sender: AnyObject) {
        performSegueWithIdentifier("getStartedSegue", sender: self)
    }
    
    @IBAction func pressDismissButton(sender: AnyObject) {
        UIView.animateWithDuration(0.3) { () -> Void in
            self.hideTutorial()
        }
        defaults.setBool(true, forKey: "banner_dismissed")
        defaults.synchronize()
    }
    
    func showTutorial() {
        imageTimelineScrollView.frame.size.height = 425
        imageTimelineScrollView.frame.origin.y = 107
        learnMoreBannerImageView.alpha = 1
        learnMoreButton.alpha = 1
        dismissButton.alpha = 1
        learnMoreButton.enabled = true
        dismissButton.enabled = true
    }
    
    func hideTutorial() {
        imageTimelineScrollView.frame.size.height = 469
        imageTimelineScrollView.frame.origin.y = 63
        learnMoreBannerImageView.alpha = 0
        learnMoreButton.alpha = 0
        dismissButton.alpha = 0
        learnMoreButton.enabled = false
        dismissButton.enabled = false
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
