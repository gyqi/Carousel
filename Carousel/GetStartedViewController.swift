//
//  GetStartedViewController.swift
//  Carousel
//
//  Created by Grace Qi on 2/12/16.
//  Copyright © 2016 Grace Qi. All rights reserved.
//

import UIKit

class GetStartedViewController: UIViewController {
    
    @IBOutlet weak var viewPhotoButton: UIButton!
    @IBOutlet weak var useTimewheelButton: UIButton!
    @IBOutlet weak var sharePhotoButton: UIButton!

    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewWillAppear(animated: Bool) {
        if defaults.boolForKey("has_viewPhoto") {
            viewPhotoButton.selected = true
        } else {
            viewPhotoButton.selected = false
        }
        
        if defaults.boolForKey("has_useTimewheel") {
            useTimewheelButton.selected = true
        } else {
            useTimewheelButton.selected = false
        }
        
        if defaults.boolForKey("has_sharePhoto") {
            sharePhotoButton.selected = true
        } else {
            sharePhotoButton.selected = false
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressDismissButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func pressViewPhotoButton(sender: AnyObject) {
        viewPhotoButton.selected = !viewPhotoButton.selected
        defaults.setBool(viewPhotoButton.selected, forKey: "has_viewPhoto")
        defaults.synchronize()
    }
    
    @IBAction func pressUseTimelineButton(sender: AnyObject) {
        useTimewheelButton.selected = !useTimewheelButton.selected
        defaults.setBool(useTimewheelButton.selected, forKey: "has_useTimewheel")
        defaults.synchronize()
    }
    
    @IBAction func pressSharePhotoButton(sender: AnyObject) {
        sharePhotoButton.selected = !sharePhotoButton.selected
        defaults.setBool(sharePhotoButton.selected, forKey: "has_sharePhoto")
        defaults.synchronize()
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
