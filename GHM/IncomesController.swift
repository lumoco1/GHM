//
//  IncomesController.swift
//  GHM
//
//  Created by Luis Morales on 1/5/17.
//  Copyright © 2017 Luis Morales. All rights reserved.
//

//Imports

import Foundation
import UIKit

class IncomesController: UIViewController,UITextFieldDelegate {
    
//Variables
    
    @IBOutlet weak var mainIncomesTF: UITextField!
    @IBOutlet weak var otherIncomesTF: UITextField!
    @IBOutlet weak var fixedPayments: UITextField!
    @IBOutlet weak var variablePayments: UITextField!
    @IBOutlet weak var specialPayments: UITextField!
    

    @IBOutlet weak var economicBalance: UITextField!
    
    var totalIncomes: Double!
    var totalPayments: Double!
    

    @IBOutlet weak var balanceTop: NSLayoutConstraint!
    @IBOutlet weak var calcularTop: NSLayoutConstraint!
    @IBOutlet weak var economicTop: NSLayoutConstraint!
    
    
    //Loading the view
    
    override func viewDidLoad() {
     super.viewDidLoad()
        
        //Delegate methods
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        mainIncomesTF.delegate = self
        otherIncomesTF.delegate = self
        fixedPayments.delegate = self
        variablePayments.delegate = self
        specialPayments.delegate = self
      
        let screenSize = UIScreen.main.bounds
        let screenHeight = screenSize.height
        
        //In this case, we are going to define the size and height of the screen for defining some programatically constraints

        
        if screenHeight <= 480{
            
            
            balanceTop.constant = 24
            calcularTop.constant = 5
            economicTop.constant = 2
            
        }else if screenHeight >= 480 && screenHeight<640{
            
            
            balanceTop.constant = 55
            calcularTop.constant = 15
            economicTop.constant = 5
        }
            
        else if screenHeight==736{
            
            balanceTop.constant = 85
            calcularTop.constant = 35
            economicTop.constant = 13
        }
        
        
    }
    
   //This function allow us to calculate our economic balance if all the fields are filled.

    @IBAction func calculateBalance(_ sender: Any) {
       
        
        if((Double(mainIncomesTF.text!) == nil) || (Double(otherIncomesTF.text!) == nil) || (Double(fixedPayments.text!) == nil) || (Double(variablePayments.text!) == nil) || (Double(specialPayments.text!) == nil)){
            
            // Create the alert controller
            let alertController = UIAlertController(title: "Valor no introducido", message: "Debes de introducir todos los campos", preferredStyle: .alert)
            
            // Create the actions
            let okAction = UIAlertAction(title: "Confirmar", style: UIAlertActionStyle.default) {
                UIAlertAction in
                NSLog("OK Pressed")
                
            }
            
            // Add the actions
            alertController.addAction(okAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        }else{
            
            totalIncomes = Double((Double(mainIncomesTF.text!)! + Double(otherIncomesTF.text!)!))
            totalPayments = Double((Double(fixedPayments.text!)! + Double(variablePayments.text!)! + Double(specialPayments.text!)!))
            
            economicBalance.text = String(totalIncomes-totalPayments)
            
        

        }
        
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height-60
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height-60
            }
        }
    }


    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
    //Showing info view
    
    @IBAction func showInfo(_ sender: Any) {
        
        performSegue(withIdentifier: "InfoNavigation", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "InfoNavigation"  {
            
            let vc = segue.destination as! UINavigationController
            let targetController = vc.topViewController as! InfoController
            
            targetController.infoBalancePassed = Double(economicBalance.text!)
                
            }
        }
    
    @IBAction func backMain(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func beforeMonth(_ sender: Any) {
        
    }
   
    @IBAction func afterMonth(_ sender: Any) {
        
    }
    
    
 
}
