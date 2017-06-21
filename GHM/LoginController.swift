//
//  ViewController.swift
//  GHM
//
//  Created by Luis Morales on 4/4/17.
//  Copyright © 2017 Luis Morales. All rights reserved.
//

//Imports

import UIKit
import FirebaseAuth

class LoginController: UIViewController,UITextFieldDelegate{

    //Variables
    
    @IBOutlet weak var loginTextField: BorderedTextField!
    @IBOutlet weak var registerTextField: BorderedTextField!
    
    @IBOutlet weak var enterButton: BorderedButton!
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    //Variables that we need to login
    var isSignIn: Bool = true
    var email: String!
    var password: String!
    
    //Loading the view
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        //Function used for giving a view the capacity of receiving taps from the user
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        //Delegathe methods
        loginTextField.delegate = self
        registerTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //Function used for dismissing the keyboard by clicking the Intro Button
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        loginTextField.resignFirstResponder()
        registerTextField.resignFirstResponder()
        
        return true
        
    }
    
    
    //Function used to select between Enter in the app or Register a new user to log in
    @IBAction func signInSelectorChanged(_ sender: Any) {
        
        //Boolean value to choose herarchy
        
        isSignIn = !isSignIn
        
        if isSignIn {
            
            enterButton.setTitle("ENTRAR", for: .normal)
            loginTextField.text = ""
            registerTextField.text = ""
            passwordLabel.text = ""
            
        }else{
            
            enterButton.setTitle("REGISTRARSE", for: .normal)
            passwordLabel.text = "(La contraseña debe de tener minimo 5 caracteres, una mayuscula y un número)"
            loginTextField.text = ""
            registerTextField.text = ""
        }
    }
    
    //Function added to "Enter Button", where we control the login of the app
    @IBAction func userLogin(_ sender: Any) {
            
        let email = loginTextField.text!
        let password = registerTextField.text!
        
        if isSignIn {
            
            //Firebase sign in function, where we need an email and password whose will be created and checked on Database
            
            Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                
                if user != nil{
                    
                    print("Usuario logueado")
                    
                    // Create the alert controller
                    let alertController = UIAlertController(title: "Log-In Satisfactorio", message: "Te has logueado con éxito, bienvenido", preferredStyle: .alert)
                    
                    // Create the actions
                    let okAction = UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default) {
                        UIAlertAction in
                        
                        self.performSegue(withIdentifier: "UserDataNavigation", sender: self)
                    }
                    
                    // Add the actions
                    alertController.addAction(okAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                    
                    
                    
                }else{
                    
                    // Create the alert controller
                    let alertController = UIAlertController(title: "Usuario no encontrado", message: "Campos introducidos erróneos", preferredStyle: .alert)
                    
                    // Create the actions
                    let okAction = UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default) {
                        UIAlertAction in
                        self.loginTextField.text = ""
                        self.registerTextField.text = ""
                    }
                    
                    // Add the actions
                    alertController.addAction(okAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                    
                    
                    print("Usuario no logueado")
                }
            })
            
        }else{
            
                //Firebase creating user function, where we need to check if all the data is correct
            
                Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                    if user != nil{
                        
                        print("Usuario creado")
                        
                        // Create the alert controller
                        let alertController = UIAlertController(title: "Creación de usuario", message: "Has creado un nuevo usuario, bienvenido", preferredStyle: .alert)
                        
                        // Create the actions
                        let okAction = UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default) {
                            UIAlertAction in
                            
                            self.performSegue(withIdentifier: "UserDataNavigation", sender: self)
                            
                        }
                        
                        // Add the actions
                        alertController.addAction(okAction)
                        
                        self.present(alertController, animated: true, completion: nil)
                        
                        
                        
                    }else{
                        
                        // Create the alert controller
                        let alertController = UIAlertController(title: "Creación de usuario", message: "Error creando usuario, vuelve a intentarlo", preferredStyle: .alert)
                        
                        // Create the actions
                        let okAction = UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default) {
                            UIAlertAction in
                            
                            self.loginTextField.text = ""
                            self.registerTextField.text = ""
                        }
                        
                        // Add the actions
                        alertController.addAction(okAction)
                        
                        self.present(alertController, animated: true, completion: nil)
                        print("Usuario no creado")
                    }
                })
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

    
    override func dismissKeyboard() {
        
        view.endEditing(true)
    }

        
    
    

}

