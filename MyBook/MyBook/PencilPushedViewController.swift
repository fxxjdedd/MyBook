//
//  PencilPushedViewController.swift
//  MyBook
//
//  Created by Apple on 16/5/11.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit

class PencilPushedViewController: UIViewController,factoryFunctions {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        Factory.createNavBar(self)
        Factory.createCancelAndDone(self)
        Factory.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func didTouchDoneBtn() {
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
    func didTouchCancelBtn() {
        self.noticeSuccess("提交成功", autoClear: true, autoClearTime: 1)
        self.dismissViewControllerAnimated(true) { () -> Void in
            print("done")
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
