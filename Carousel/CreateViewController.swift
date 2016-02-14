//
//  CreateViewController.swift
//  Carousel
//
//  Created by Grace Qi on 2/11/16.
//  Copyright © 2016 Grace Qi. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController, UIScrollViewDelegate {

    
    @IBOutlet weak var createTextImageView: UIImageView!
    @IBOutlet weak var formView: UIView!
    @IBOutlet weak var termsView: UIView!
    @IBOutlet weak var createView: UIView!
    
    @IBOutlet weak var checkBoxButton: UIButton!
    
    @IBOutlet weak var createScrollView: UIScrollView!
    
    var initialY_createTextImageView: CGFloat!
    var initialY_formView: CGFloat!
    var initialY_termsView: CGFloat!
    var initialY_createView: CGFloat!
    
    var offset_createTextImageView: CGFloat!
    var offset_formView: CGFloat!
    var offset_termsView: CGFloat!
    var offset_createView: CGFloat!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createScrollView.delegate = self
        createScrollView.contentSize = CGSize(width: 320, height: 580)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        initialY_createTextImageView = createTextImageView.frame.origin.y
        initialY_formView = formView.frame.origin.y
        initialY_termsView = termsView.frame.origin.y
        initialY_createView = createView.frame.origin.y
        
        offset_createTextImageView = -100
        offset_formView = -90
        offset_termsView = -90
        offset_createView = -175

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func pressBackButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onTapDismissKeyboard(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        
        createTextImageView.frame.origin.y = initialY_createTextImageView  + offset_createTextImageView
        formView.frame.origin.y = initialY_formView + offset_formView
        termsView.frame.origin.y = initialY_termsView + offset_termsView
        createView.frame.origin.y = initialY_createView + offset_createView
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        
        createTextImageView.frame.origin.y = initialY_createTextImageView
        formView.frame.origin.y = initialY_formView
        termsView.frame.origin.y = initialY_termsView
        createView.frame.origin.y = initialY_createView

        
    }
    
    @IBAction func pressCheckBox(sender: AnyObject) {
        checkBoxButton.selected = !checkBoxButton.selected
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if createScrollView.contentOffset.y <= -50 {
            view.endEditing(true)
        }
    }
    
    @IBAction func pressCreateButton(sender: AnyObject) {
        self.performSegueWithIdentifier("createToTutorialSegue", sender: self)
    }
    
    @IBAction func pressTermsHyperlinkButton(sender: AnyObject) {
        self.performSegueWithIdentifier("termsSegue", sender: self)
    }
    
    
    
    
    //

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
