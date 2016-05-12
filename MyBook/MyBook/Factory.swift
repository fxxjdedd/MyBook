//
//  Factory.swift
//  MyBook
//
//  Created by Apple on 16/5/12.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit
@objc protocol factoryFunctions{
    func didTouchCancelBtn()
    func didTouchDoneBtn()
}
class Factory: UIView {
    static var delegate : factoryFunctions?
    static func createNavBar(target:UIViewController){
        let navBar = UINavigationBar(frame: CGRectMake(0,0,SCREEN_WIDTH,70))
        target.view.addSubview(navBar)
    }
    static func createCancelAndDone(target:UIViewController){
        let cancelBtn = UIButton(frame:CGRectMake(10,30,80,32))
        cancelBtn.setImage(UIImage(named: "cancel1"), forState: UIControlState.Normal)
        cancelBtn.addTarget(self, action: "cancelBtn", forControlEvents: UIControlEvents.TouchUpInside)
        target.view.addSubview(cancelBtn)

        let doneBtn = UIButton(frame: CGRectMake(SCREEN_WIDTH - 80 - 10,30,80,32))
        doneBtn.setImage(UIImage(named: "done1"), forState: UIControlState.Normal)
        doneBtn.addTarget(self, action: "doneBtn", forControlEvents: UIControlEvents.TouchUpInside)
        target.view.addSubview(doneBtn)

    }
    override init(frame: CGRect) {
        super.init(frame:frame)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    static func cancelBtn(){
        delegate?.didTouchDoneBtn()
    }
    
    static func doneBtn(){
        delegate?.didTouchCancelBtn()
    }
    
}
