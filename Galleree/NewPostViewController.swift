//
//  NewPost.swift
//  Galleree
//
//  Created by Natalie Lim on 7/20/16.
//  Copyright © 2016 Natalie Lim. All rights reserved.
//

import Foundation
import UIKit

class NewPostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imagePicker.delegate = self
        datePicker.addTarget(self, action: #selector(NewPostViewController.datePickerChange(_:)), forControlEvents: UIControlEvents.ValueChanged)
       // datePicker.addTarget(self, action: Selector("dataPickerChanged:"), forControlEvents: UIControlEvents.ValueChanged)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func datePickerChange(datePicker:UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
      //  dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        
        let strDate = dateFormatter.stringFromDate(datePicker.date)
        dateLabel.text = strDate
    }
    
    // MARK: - Capture Image
    
    @IBAction func butLibraryAction(sender: AnyObject) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        
        imagePicker.modalPresentationStyle = UIModalPresentationStyle.Popover
        imagePicker.popoverPresentationController?.sourceView = imageView
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    // Mark: - Update Image View
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            imageView.contentMode = .ScaleAspectFit
            imageView.image = pickedImage
        }
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            if identifier == "Cancel" {
                print("Cancel button tapped")
            } else if identifier == "Save" {
                print("Save button tapped")
            }
        }
    }
}
    