//
//  ViewController.swift
//  photoTestJames
//
//  Created by CdxN on 2017/7/21.
//  Copyright © 2017年 CdxN. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var imageView: UIImageView!

    
    @IBOutlet var PickImageBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.PickImageBtn.titleLabel!.font = UIFont(name: "SF-UI-Text-Heavy", size: 30)
    
        PickImageBtn.layer.shadowColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        PickImageBtn.layer.shadowOpacity = 0.25
        PickImageBtn.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        PickImageBtn.layer.shadowRadius = 4.0
        
        PickImageBtn.layer.cornerRadius = 2.0

        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 6.0
        
//        let tapGestureRecognizer = UITapGestureRecognizer( target:self, action: "loadImage:")
//        tapGestureRecognizer.numberOfTapsRequired = 1
//        imageView.addGestureRecognizer(tapGestureRecognizer)
        
        
    }
    //recognizer: UITapGestureRecognizer
    func loadImage () {
     
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
//        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = image
        } else{
            print("Something went wrong")
        }

        self.dismiss(animated: true, completion: nil)
    }


    @IBAction func addImage(_ sender: Any) {
        loadImage()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
     return self.imageView
    }
}

