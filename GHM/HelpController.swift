//
//  HelpController.swift
//  GHM
//
//  Created by Luis Morales on 30/4/17.
//  Copyright © 2017 Luis Morales. All rights reserved.
//

//Imports

import Foundation
import UIKit

class HelpController:UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    //Variables
    
    @IBOutlet weak var helpTableView: UITableView!

    //Loading the view
    
    override func viewDidLoad() {
        
        //TableView methods
        
        helpTableView.tableFooterView = UIView()
        helpTableView.delegate = self
        helpTableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = helpTableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.font = UIFont(name: "Helvetica Neue", size: 16)
        cell?.textLabel?.numberOfLines = 0
        
        //Adding  some help tips on the TableView
        
        switch indexPath.row {
        case 0:
            
             cell?.textLabel?.text = "· Para poder gestionar tus finanzas, debes introducirlas en la pestaña de Gestión de datos."
            break
            
        case 1:
            
            cell?.textLabel?.text = "· Es imprescindible que introduzcas tus datos despues de realizar el login, sin ellos no podremos realizar ninguna operación!."
            break
        
        case 2:
            
            cell?.textLabel?.text = "·Todos tus datos y finanzas están protegidas y no serán visibles a los demás usuarios bajo ningún concepto."
            
            break
        
        case 3:
            
            cell?.textLabel?.text = "· La navegación por la app es sencilla, simplemente pulsa donde quieres ir."
            
            break
            
        case 4:
            
            cell?.textLabel?.text = "· Ante cualquier problema o fallo de la aplicación, contacta con nuestro soporte técnico (lumoco@campusaula.com)."
            
            break
        default:
            
            break
            
        }
        
        return cell!
    }
}
