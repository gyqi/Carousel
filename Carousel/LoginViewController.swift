//
//  LoginViewController.swift
//  Carousel
//
//  Created by Grace Qi on 2/9/16.
//  Copyright © 2016 Grace Qi. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var loginScrollView: UIScrollView!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var loginNavImageView: UIImageView!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    
    var initialY_parent: CGFloat!
    var initialY_button: CGFloat!
    var offset_parent: CGFloat!
    var offset_button: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginScrollView.delegate = self
        loginScrollView.contentSize = loginScrollView.frame.size
        loginScrollView.contentInset.bottom = 100
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        initialY_parent = fieldParentView.frame.origin.y
        initialY_button = buttonParentView.frame.origin.y
        offset_parent = -150
        offset_button = -215
        // You must place a colon in selector names for functions with a parameter, i.e "keyboardWillShow:"
        
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(animated: Bool) {
        // Set initial transform values 20% of original size
        let transform = CGAffineTransformMakeScale(0.2, 0.2)
        
        // Apply the transform properties of the views
        loginNavImageView.transform = transform
        fieldParentView.transform = transform
        
        // Set the alpha properties of the views to transparent
        loginNavImageView.alpha = 0
        fieldParentView.alpha = 0
        
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.3) { () -> Void in
            // Return the views transform properties to their default states.
            self.fieldParentView.transform = CGAffineTransformIdentity
            self.loginNavImageView.transform = CGAffineTransformIdentity
            
            // Set the alpha properties of the views to fully opaque
            self.fieldParentView.alpha = 1
            self.loginNavImageView.alpha = 1
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressLoginBackButton(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    @IBAction func onTapDismissKeyboard(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        
        fieldParentView.frame.origin.y = initialY_parent + offset_parent
        buttonParentView.frame.origin.y = initialY_button + offset_button
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        fieldParentView.frame.origin.y = initialY_parent
        buttonParentView.frame.origin.y = initialY_button
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if loginScrollView.contentOffset.y <= -50 {
            view.endEditing(true)
        }
    }
    
    @IBAction func pressSignInButton(sender: AnyObject) {
        if(emailField.text!.isEmpty || passwordField.text!.isEmpty) {
            let alertController = UIAlertController(title: "Fields Required", message: "Please enter your Email and Password.", preferredStyle: .Alert)
            let OKAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(OKAction)
            presentViewController(alertController, animated: true, completion: nil)
        } else {
            self.activityIndicatorView.startAnimating()
            delay(2, closure: { () -> () in
                if(self.emailField.text! == "kingsley" && self.passwordField.text! == "password") {
                    self.performSegueWithIdentifier("login_tutorial_modalSegue", sender: self)
                }
                else {
                    let alertController = UIAlertController(title: "Invalid Email or Password", message: "Please enter a valid Email and Password.", preferredStyle: .Alert)
                    let OKAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                    alertController.addAction(OKAction)
                    self.presentViewController(alertController, animated: true, completion: nil)
                }
                self.activityIndicatorView.stopAnimating()
            })
            
        }
    }
    
    
    // helper functions
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
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
