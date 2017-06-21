//
//  MainMenuController.swift
//  GHM
//
//  Created by Luis Morales on 26/4/17.
//  Copyright © 2017 Luis Morales. All rights reserved.
//

//Imports

import Foundation
import UIKit

class MainMenuController: UIViewController {
    
    //Variables
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var incomeView: UIView!

    @IBOutlet weak var infoView: UIView!
    
    @IBOutlet weak var insuranceView: UIView!
    
    @IBOutlet weak var newsView: UIView!
    
    //Loading the view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Giving actions to main menu views to navigate into them
        
        let gestureIncome = UITapGestureRecognizer(target: self, action:  #selector (self.incomeAction (_:)))
        
        let gestureInfo = UITapGestureRecognizer(target: self, action:  #selector (self.infoAction (_:)))
        
        let gestureInsurance = UITapGestureRecognizer(target: self, action:  #selector (self.insuranceAction (_:)))
        
         let gestureUser = UITapGestureRecognizer(target: self, action:  #selector (self.userAction (_:)))
        
        self.incomeView.addGestureRecognizer(gestureIncome)
        self.infoView.addGestureRecognizer(gestureInfo)
        self.insuranceView.addGestureRecognizer(gestureInsurance)
        self.newsView.addGestureRecognizer(gestureUser)
        }
    
    //View functions
    
    func incomeAction(_ sender:UITapGestureRecognizer){
        
        performSegue(withIdentifier: "IncomeNavigation", sender: self)
    }
    
    func infoAction(_ sender:UITapGestureRecognizer){
        
        //We need to set up an action for info view, if we clicked it without data
        
        let alertController = UIAlertController(title: "Ejemplo estadísticas", message: "Esto es un ejemplo de gráfica. Para ver tus datos, introducelos en 'Gestor de datos'", preferredStyle: .alert)
        
        // Create the actions
        let okAction = UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default) {
            UIAlertAction in
            
            self.performSegue(withIdentifier: "InfoNavigation", sender: self)
        }
        
        // Add the actions
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
        
        
    }
    
    func insuranceAction(_ sender:UITapGestureRecognizer){
        
        performSegue(withIdentifier: "InsuranceNavigation", sender: self)
    }
    
    func userAction(_ sender:UITapGestureRecognizer){
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    //Function which we will call whenever we want to go back to main menu
    
    @IBAction func unwindToMainMenu(_ segue: UIStoryboardSegue) {
        
    }
    
    }
    
    

    
