//
//  IntroViewController.swift
//  Carousel
//
//  Created by Grace Qi on 2/7/16.
//  Copyright © 2016 Grace Qi. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var introScrollView: UIScrollView!
    @IBOutlet weak var introImageView: UIImageView!
    
    @IBOutlet weak var tile1ImageView: UIImageView!
    @IBOutlet weak var tile2ImageView: UIImageView!
    @IBOutlet weak var tile3ImageView: UIImageView!
    @IBOutlet weak var tile4ImageView: UIImageView!
    @IBOutlet weak var tile5ImageView: UIImageView!
    @IBOutlet weak var tile6ImageView: UIImageView!

    var xOffsets : [CGFloat] = [-50, 55, 36, 95, -100, -65]
    var yOffsets : [CGFloat] = [-290, -240, -430, -408, -515, -515]
    var scales : [CGFloat] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [CGFloat] = [-10, -10, 10, 10, 10, -10]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        introScrollView.contentSize = introImageView.image!.size
        introScrollView.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // This method is called as the user scrolls
        let scroll_offset = CGFloat(introScrollView.contentOffset.y)
        
        
        
       // let tx_1 = convertValue(scroll_offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[0], r2Max: 0)
       // let ty_1 = convertValue(scroll_offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[0], r2Max: 0)
       // let scale_1 = convertValue(scroll_offset, r1Min: 0, r1Max: 568, r2Min: scales[0], r2Max: 1)
       // let rotation_1 = convertValue(scroll_offset, r1Min: 0, r1Max: 568, r2Min: rotations[0], r2Max: 0)
        
        let tile1_convert = imageConvertValue(1, scroll_offset: scroll_offset)
        let tile2_convert = imageConvertValue(2, scroll_offset: scroll_offset)
        let tile3_convert = imageConvertValue(3, scroll_offset: scroll_offset)
        let tile4_convert = imageConvertValue(4, scroll_offset: scroll_offset)
        let tile5_convert = imageConvertValue(5, scroll_offset: scroll_offset)
        let tile6_convert = imageConvertValue(6, scroll_offset: scroll_offset)
        
        imageTransform(tile1ImageView, x: tile1_convert.tx, y: tile1_convert.ty, scale: tile1_convert.scale, rotation: tile1_convert.rotation)
        imageTransform(tile2ImageView, x: tile2_convert.tx, y: tile2_convert.ty, scale: tile2_convert.scale, rotation: tile2_convert.rotation)
        imageTransform(tile3ImageView, x: tile3_convert.tx, y: tile3_convert.ty, scale: tile3_convert.scale, rotation: tile3_convert.rotation)
        imageTransform(tile4ImageView, x: tile4_convert.tx, y: tile4_convert.ty, scale: tile4_convert.scale, rotation: tile4_convert.rotation)
        imageTransform(tile5ImageView, x: tile5_convert.tx, y: tile5_convert.ty, scale: tile5_convert.scale, rotation: tile5_convert.rotation)
        imageTransform(tile6ImageView, x: tile6_convert.tx, y: tile6_convert.ty, scale: tile6_convert.scale, rotation: tile6_convert.rotation)
        
    }
    
    @IBAction func pressCreateButton(sender: AnyObject) {
        performSegueWithIdentifier("createSegue", sender: self)
    }

    // helper methods
    func imageTransform(image: UIView, x: CGFloat, y: CGFloat, scale: CGFloat, rotation: CGFloat) {
        image.transform = CGAffineTransformMakeTranslation(x, y)
        image.transform = CGAffineTransformScale(image.transform, scale, scale)
        image.transform = CGAffineTransformRotate(image.transform, CGFloat(Double(rotation) * M_PI / 180))
    }
    
    func imageConvertValue(image_num: Int, scroll_offset: CGFloat) -> (tx: CGFloat, ty: CGFloat, scale: CGFloat, rotation: CGFloat) {
        let tx = convertValue(scroll_offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[image_num-1], r2Max: 0)
        let ty = convertValue(scroll_offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[image_num-1], r2Max: 0)
        let scale = convertValue(scroll_offset, r1Min: 0, r1Max: 568, r2Min: scales[image_num-1], r2Max: 1)
        let rotation = convertValue(scroll_offset, r1Min: 0, r1Max: 568, r2Min: rotations[image_num-1], r2Max: 0)
        return (tx, ty, scale, rotation)
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
