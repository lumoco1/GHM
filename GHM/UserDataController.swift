//
//  UserDataController.swift
//  GHM
//
//  Created by Luis Morales on 26/4/17.
//  Copyright © 2017 Luis Morales. All rights reserved.
//

//Imports
import Foundation
import UIKit

class UserDataController: UIViewController,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    //Variables
    
    @IBOutlet weak var userName: BorderedTextField!
    @IBOutlet weak var ageTF: BorderedTextField!
    @IBOutlet weak var cityTF: BorderedTextField!
    @IBOutlet weak var mailTF: BorderedTextField!
    @IBOutlet weak var familyTF: BorderedTextField!

    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var userImage: UIImageView!
    
    //We need to define a imagePicker to allow user getting images from gallery and camera
    
    var imagePicker = UIImagePickerController()

    @IBOutlet weak var homeTypePW: UIPickerView!
    
    var pickerViewData = ["Piso","Casa","Alquiler","Chalet"]
    
    
    //Loading the view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Delegate methods
        
        imagePicker.delegate = self
        userName.delegate = self
        ageTF.delegate = self
        cityTF.delegate = self
        familyTF.delegate = self
        mailTF.delegate = self
        
        homeTypePW.delegate = self
        homeTypePW.dataSource = self
        
        //Calling the method for preventing non-usable textfields
        
        self.hideKeyboard()
        
        //In this case, we are going to define the size and height of the screen for defining some programatically constraints
        
        let screenSize = UIScreen.main.bounds
        let screenHeight = screenSize.height
        
        if screenHeight <= 480{
            
            
            bottomConstraint.constant = 16
            
        }else if screenHeight >= 480 && screenHeight<640{
            
            
            bottomConstraint.constant = 32
            
        }
            
        else if screenHeight==736{
            
            bottomConstraint.constant = 64
        }
        
        
    
    }
    
    //Function used for dismissing the keyboard by clicking the Intro Button
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //Methods used for giving functions and data to the houses's picker view
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerViewData.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerViewData[row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //We define the action of the button, calling the picker view to show us getting images from gallery
    
    @IBAction func changeImage(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }

        
        
    }
    
    //Picker Image View function
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            userImage.image = image
        }
        else if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            userImage.image = image
        } else{
            print("Something went wrong")
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //Function that shows an alert when we tap the "Confirm" button, avoiding non-wanted actions and securing the data introduced before.
    
    @IBAction func confirmUserData(_ sender: Any) {
        
         // Create the alert controller
         let alertController = UIAlertController(title: "Confirmar datos", message: "¿Estás seguro que deseas guardar?", preferredStyle: .alert)
         
         // Create the actions
         let okAction = UIAlertAction(title: "Confirmar", style: UIAlertActionStyle.default) {
         UIAlertAction in
         NSLog("OK Pressed")
            
            self.performSegue(withIdentifier: "MainNavigation", sender: nil)
            
            
         }
         let cancelAction = UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.cancel) {
         UIAlertAction in
         NSLog("Cancel Pressed")
         }
         
         // Add the actions
         alertController.addAction(okAction)
         alertController.addAction(cancelAction)
         
         self.present(alertController, animated: true, completion: nil)
        
        
        }

    }

//We call this extension outside the class for administrating the keyboard


extension UIViewController
{
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
