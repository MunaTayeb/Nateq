//
//  ViewController.swift
//  Nateq
//
//  Created by Muna Tayeb on 5/24/1438 AH.
//  Copyright © 1438 Muna Tayeb. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate,FrameExtractorDelegate  {

    @IBAction func importImage(_ sender: Any) {
        
        var image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.allowsEditing = false
        self.present(image, animated: false, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        self.dismiss(animated: true, completion: nil)
        print("image picked")
        
        //trigger a text to be read by voiceOver
        UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification,"My important information");
        
        var chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        //------------------------------------------------------------------------------\\
        //here you can use the variable "ChosenImage" to process (send to Google OCR API)
        //-------------------------------------------------------------------------------\\
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image:UIImage!){
   // }
    
    var frameExtractor: FrameExtractor!
    
    @IBAction func CaptureImage(_ sender: Any) {
        
        var image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.camera
        image.allowsEditing = false
        image.modalPresentationStyle = .fullScreen
        image.cameraCaptureMode = .photo
        self.present(image, animated: false, completion: nil)
       // frameExtractor = FrameExtractor()
       // frameExtractor.delegate = self
    }
    
    func captured(image: UIImage) {
        print("frame captured")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

