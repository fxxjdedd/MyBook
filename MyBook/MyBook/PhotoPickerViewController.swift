//
//  PhotoPickerViewController.swift
//  MyBook
//
//  Created by Apple on 16/5/13.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit

class PhotoPickerViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    var alert : UIAlertController?
    
    var picker : UIImagePickerController?
    
    var delegate : PhotoPickerFunctions?
    init(){
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .OverFullScreen
        self.view.backgroundColor = UIColor.clearColor()
        
        self.picker = UIImagePickerController()
        self.picker?.allowsEditing = false
        self.picker?.delegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(animated: Bool) {
        if(alert == nil){
            self.alert = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
            alert?.addAction(UIAlertAction(title: "已有照片", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
                self.openAlbum()
            }))
            alert?.addAction(UIAlertAction(title: "打开相机", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
                self.openCamera()
            }))
            alert?.addAction(UIAlertAction(title: "取消", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
                self.dismissViewControllerAnimated(true, completion: { () -> Void in
                    
                })
            }))
            self.presentViewController(alert!, animated: true, completion: { () -> Void in
                
            })
        }else{
            
        }
    }
    func openAlbum(){
        self.picker?.sourceType = .SavedPhotosAlbum
        self.presentViewController(self.picker!, animated: true) { () -> Void in
        }
    }
    
    func openCamera(){
        if(UIImagePickerController.isSourceTypeAvailable(.Camera)){
            self.picker?.sourceType = .Camera
            self.presentViewController(self.picker!, animated: true, completion: { () -> Void in
            })
        }else{
            let alertView = UIAlertController(title: nil, message:"此设备没有相机", preferredStyle: UIAlertControllerStyle.Alert)
            alertView.addAction(UIAlertAction(title: "关闭", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
                self.dismissViewControllerAnimated(true, completion: { () -> Void in
                    
                })
            }))
            self.presentViewController(alertView, animated: true, completion: { () -> Void in
                
            })
        }
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.picker?.dismissViewControllerAnimated(true, completion: { () -> Void in
            self.dismissViewControllerAnimated(true, completion: { () -> Void in
                
            })
        })
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.picker?.dismissViewControllerAnimated(true) { () -> Void in
            self.dismissViewControllerAnimated(true, completion: { () -> Void in
                self.delegate?.getImageFromPicker(image)
            })
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
