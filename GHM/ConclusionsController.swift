//
//  ConclusionsController.swift
//  GHM
//
//  Created by Luis Morales on 16/5/17.
//  Copyright © 2017 Luis Morales. All rights reserved.
//

//Imports

import Foundation
import UIKit

class ConclusionsController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    //Variables
    
    @IBOutlet weak var conclusionsTableView: UITableView!
    
    var conclPassed: Double!
    
    @IBOutlet weak var resultsImage: UIImageView!
    
    @IBOutlet weak var balanceLabel: UILabel!
    
    //Loading the view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Delegate methods
        
        conclusionsTableView.delegate = self
        conclusionsTableView.dataSource = self
        conclusionsTableView.tableFooterView = UIView()
        
        self.navigationItem.title = "Conclusiones"
        
        balanceLabel.text = String(conclPassed) + " euros"
        
        if(conclPassed<=0){
            
            resultsImage.image = #imageLiteral(resourceName: "error")
            
        }else{
            
            
            resultsImage.image = #imageLiteral(resourceName: "blue-tick-icon-1")
        }
        
        
    }
    
    //TableView functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = conclusionsTableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.font = UIFont(name: "Helvetica Neue", size: 16)
        cell?.textLabel?.numberOfLines = 0
        
        //We determinate a number of tips depending on the economic balance
        
        if conclPassed>0 && conclPassed<100{
            
        
        switch indexPath.row {
        case 0:
            
            cell?.textLabel?.text = "· Éste mes has tenido un balance económico aceptable, pero seguro que se puede mejorar."
            break
            
        case 1:
            
            cell?.textLabel?.text = "· Teniendo en cuenta los datos obtenidos, la forma más simple de aumentar el beneficio es reducir gastos."
            break
            
        case 2:
            
            cell?.textLabel?.text = "·En concreto, gastos del tipo luz, agua, de una manera no muy considerable, pero si suficiente."
            
            break
            
        case 3:
            
            cell?.textLabel?.text = "· Por otra parte, los gastos variables son los más faciles de reducir, asi que intenta reducir lo máximo posible."
            
            break
            
        case 4:
            
            cell?.textLabel?.text = "· El objetivo del siguiente mes será aumentar los beneficios en 50%"
            
            break
        default:
            
            break
            
        }
        }else if conclPassed<0{
            
            switch indexPath.row {
            case 0:
                
                cell?.textLabel?.text = "·Éste mes has tenido un balance económico negativo, por lo que es necesario tomar medidas."
                break
                
            case 1:
                
                cell?.textLabel?.text = "· En primer lugar, la forma más sencilla de cambiar ésta dinámica es reducir los gastos variables de éste mes, teniendo en cuenta los gastos por dependencia."
                break
                
            case 2:
                
                cell?.textLabel?.text = "·Estos gastos variables convendría analizarlos y reducirlos o evitarlos en la medida de lo posible, con el objetivo de que no se conviertan en gastos fijos."
                
                break
                
            case 3:
                
                cell?.textLabel?.text = "· Por otra parte, seria recomendable buscar alguna fuente de ingresos alternativa y controlar las facturas y los gastos en casa"
                
                break
                
            case 4:
                
                cell?.textLabel?.text = "· Por último, revise la lista de seguros de su hogar Tiene una lista de alternativas desde el menu principal"
                
                break
            default:
                
                break
                
            }}else{
                
                switch indexPath.row {
                case 0:
                    
                    cell?.textLabel?.text = "· ¡Enhorabuena! Éste mes ha conseguido un balance económico fantástico! Siga así"
                    break
                    
                case 1:
                    
                    cell?.textLabel?.text = "· Asegurese de revisar tanto ingresos como gastos, y de conocer el porqué ha conseguido este resultado ."
                    break
                    
                case 2:
                    
                    cell?.textLabel?.text = "· Si conoce el porqué o cuando lo conozca, intente mantenerlo de forma regular y verá como su economia familiar irá viento en popa!"
                    
                    break
                    
                case 3:
                    
                    cell?.textLabel?.text = "· Para que podamos seguir mejorando, no olvide hacernos feedback y seguirnos en las redes sociales."
                    
                    break
                    
                case 4:
                    
                    cell?.textLabel?.text = "· Puntúe la aplicación en el iOS Store, esperemos que le haya servido."
                    
                    break
                    
                default:
                    
                    break
                    
                }
            
        }
        
        return cell!
    }
}

