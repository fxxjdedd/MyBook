//
//  PencilPushedView.swift
//  MyBook
//
//  Created by Apple on 16/5/13.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit
@objc protocol PencilPushedFunctions{
    func didTouchBookCover()
    
}
class PencilPushedView: UIView,SetBackGroundFunctions {

    var bookCover : UIButton?
    
    var bookCoverTitle : UIButton?
    
    var bookTitle : JVFloatLabeledTextField?
    
    var bookEditor : JVFloatLabeledTextField?
    
    var delegate : PencilPushedFunctions?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setBackGround()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setBackGround() {
        //self.backgroundColor = UIColor.redColor()
        self.bookCover = UIButton(frame: CGRectMake(20,40,114,127))
        self.bookCover?.setImage(UIImage(named: "bookcover"), forState: UIControlState.Normal)
        self.bookCover?.addTarget(self, action: "addCover", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.bookCoverTitle = UIButton(frame: CGRectMake(CGRectGetMinX(bookCover!.frame)+10,CGRectGetMaxY(bookCover!.frame)-10,100,50))
        self.bookCoverTitle?.addTarget(self, action: "addCover", forControlEvents: .TouchUpInside)
        self.bookCoverTitle!.setTitle("点击添加封面", forState: UIControlState.Normal)
        self.bookCoverTitle!.setTitleColor(MAIN_COLOR, forState: UIControlState.Normal)
        self.bookCoverTitle?.titleLabel?.adjustsFontSizeToFitWidth = true
        self.bookCoverTitle?.titleLabel?.font = UIFont(name: MY_FONT, size: 20)
        
        self.bookTitle = JVFloatLabeledTextField(frame: CGRectMake(CGRectGetMaxX(bookCover!.frame)+10,CGRectGetMinY(bookCover!.frame)-10,200,50))
        self.bookTitle?.placeholder = "书名"
        self.bookTitle?.font = UIFont(name: MY_FONT, size: 20)
        self.bookTitle?.floatingLabelFont = UIFont(name: MY_FONT, size: 20)
                
        self.bookEditor = JVFloatLabeledTextField(frame: CGRectMake(CGRectGetMaxX(bookCover!.frame)+10,CGRectGetMaxY(bookCover!.frame)-50,200,50))
        self.bookEditor?.placeholder = "作者"
        self.bookEditor?.font = UIFont(name: MY_FONT, size: 20)
        self.bookEditor?.floatingLabelFont = UIFont(name: MY_FONT, size: 20)
        

        
        self.addSubview(bookCover!)
        self.addSubview(bookTitle!)
        self.addSubview(bookEditor!)
        self.addSubview(bookCoverTitle!)
    }
    func addCover(){
        if((self.delegate) != nil){
            self.delegate?.didTouchBookCover()
        }else{
            print("不存在delegate对象")
        }
        print("点了addCover")
    }
    func setBookCoverImage(image: UIImage){
        self.bookCover?.setImage(image, forState: UIControlState.Normal)
    }
    
}
