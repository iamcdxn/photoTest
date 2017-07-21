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
    @IBOutlet var pickImageBtn: UIButton!
    var btnSubView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Init ImageView
        imageView.image = UIImage(named: "icon_photo")
        imageView.contentMode = .center

        // Setting BtnStyle
        self.pickImageBtn.titleLabel!.font = UIFont(name: "SFUIText-Heavy", size: 20)
        pickImageBtn.layer.shadowColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        pickImageBtn.layer.shadowOpacity = 0.25
        pickImageBtn.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        pickImageBtn.layer.shadowRadius = 4.0
        pickImageBtn.layer.cornerRadius = 2.0
        
        // Create btnSubView
        btnSubView.frame = CGRect(x: 0.0, y: 0.0, width: pickImageBtn.frame.width * 2, height: pickImageBtn.frame.height / 2)
        btnSubView.backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.05)
        btnSubView.isUserInteractionEnabled = false
        btnSubView.isExclusiveTouch = false

        // Add SubView to Btn
        pickImageBtn.addSubview(btnSubView)
        pickImageBtn.clipsToBounds = true
        
        // Setting ScrollView ZoomScale
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 6.0
    }

    // Load Image Function
    func loadImage() {

        let imagePicker = UIImagePickerController()

        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    // Set Picked Image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = image
        } else{
            print("Something went wrong")
        }

        imageView.contentMode = .scaleAspectFit
        self.dismiss(animated: true, completion: nil)
    }

    // Press Btn
    @IBAction func loadImage(_ sender: Any) {
    loadImage()
    }

    // Setting Zoom
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
     return self.imageView
    }
    
    // Print Font Name If Needed
    func printFontNames() {
        for family: String in UIFont.familyNames
        {
            print("\(family)")
            for names: String in UIFont.fontNames(forFamilyName: family)
            {
                print("== \(names)")
            }
        }
    }
}

