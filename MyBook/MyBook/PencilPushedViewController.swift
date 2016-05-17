//
//  PencilPushedViewController.swift
//  MyBook
//
//  Created by Apple on 16/5/11.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit

class PencilPushedViewController: UIViewController,FactoryFunctions,SetBackGroundFunctions,PencilPushedFunctions,PhotoPickerFunctions,VPImageCropperDelegate{

    var pencilPushedView : PencilPushedView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        Factory.createNavBar(self)
        Factory.createCancelAndDone(self)
        Factory.delegate = self
        
        self.setBackGround()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setBackGround(){
        //70为了不挡住NavBar
        pencilPushedView = PencilPushedView(frame: CGRectMake(0,70,SCREEN_WIDTH,SCREEN_HEIGHT))
        //view也要单独设置代理对象
        pencilPushedView!.delegate = self
        print("asd")
        self.view.addSubview(pencilPushedView!)
        
    }
    
    func didTouchDoneBtn() {
        self.noticeSuccess("提交成功", autoClear: true, autoClearTime: 1)
        let time = dispatch_time(DISPATCH_TIME_NOW,Int64(500)*Int64(NSEC_PER_MSEC))
        dispatch_after(time, dispatch_get_main_queue()) { () -> Void in
            self.dismissViewControllerAnimated(true) { () -> Void in
                print("done")
            }
        }
       
        
    }
    func didTouchCancelBtn() {
        
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }

    }
    
    func didTouchBookCover() {
        print("此处摁了")
        let vc = PhotoPickerViewController()
        vc.delegate = self
        self.presentViewController(vc, animated: true) { () -> Void in
            //print("此处应该有界面出现")
        }
    }
    
    func getImageFromPicker(image: UIImage) {
        let vc = VPImageCropperViewController(image: image, cropFrame: CGRectMake(0,(SCREEN_HEIGHT-SCREEN_WIDTH*(114/127))/2,SCREEN_WIDTH,SCREEN_WIDTH*(114/127)), limitScaleRatio: 8)
        vc.delegate = self
        self.presentViewController(vc, animated: true) { () -> Void in
            
        }
    }
    func imageCropperDidCancel(cropperViewController: VPImageCropperViewController!) {
        cropperViewController.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
    func imageCropper(cropperViewController: VPImageCropperViewController!, didFinished editedImage: UIImage!) {
        cropperViewController.dismissViewControllerAnimated(true) { () -> Void in
            self.pencilPushedView?.setBookCoverImage(editedImage)

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
