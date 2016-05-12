//
//  PencilViewController.swift
//  MyBook
//
//  Created by Apple on 16/5/10.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit

class PencilViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackGround()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setBackGround(){
        //添加导航栏信息
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "add")?.imageWithRenderingMode(.AlwaysOriginal), style: UIBarButtonItemStyle.Plain, target: self, action: "addBookBtn")
        //self.navigationItem.title = "添加书评"
        //添加自定义title
        self.navigationItem.titleView = UIView(frame: CGRectMake(-80,0,100,40))
        let title = UILabel(frame: self.navigationItem.titleView!.frame)
        title.text = "添加书评"
        title.font = UIFont(name: MY_FONT, size: 18)
        title.textColor = MAIN_COLOR
        self.navigationItem.titleView?.addSubview(title)
        self.view.backgroundColor = UIColor.whiteColor()
        //添加没有书评时的图片
        let view = UIView(frame: CGRectMake(0,0,300,300))
        view.center = self.view.center
        let image = UIImage(named: "pencilBG")
        let imageView = UIImageView(image: image)
        imageView.center = self.view.center
        self.view.addSubview(imageView)

        
    }
    func addBookBtn(){
        let VC = PencilPushedViewController()
        self.presentViewController(VC, animated: true) { () -> Void in
            print("启动了")
        }
        //self.pushViewController(VC, animated: true)
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
