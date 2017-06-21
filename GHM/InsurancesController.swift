//
//  InsurancesController.swift
//  GHM
//
//  Created by Luis Morales on 7/5/17.
//  Copyright © 2017 Luis Morales. All rights reserved.
//

//Imports

import Foundation
import UIKit


class InsurancesController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    //Variables
    
    @IBOutlet weak var insurancesTableView: UITableView!
    
    @IBOutlet weak var visitURL: UIButton!
    
    var names = ["AXA","Caser Seguros","Generali","Genesis","MAPFRE","Pelayo"]
    
    var prices = [500,325,480,734,879,613]

    var images = [#imageLiteral(resourceName: "axa"),#imageLiteral(resourceName: "caser"),#imageLiteral(resourceName: "generali"),#imageLiteral(resourceName: "genesis"),#imageLiteral(resourceName: "mapfre"),#imageLiteral(resourceName: "pelayo")]
    
    //Loading the view
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //Delegate methods
        
        insurancesTableView.tableFooterView = UIView()
        insurancesTableView.delegate = self
        insurancesTableView.dataSource = self
        
      
}
    
    //TableView functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 101
    }
    
    //We are defining the same button for each cell but with different URL
    @IBAction func visitURLButton(_ sender: Any) {
      
        switch (sender as AnyObject).tag {
            
        case 0:
            
            let url = URL(string: "https://www.axa.es/seguros-hogar")!
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
            
            
            break
            
        case 1:
            
            let url = URL(string: "https://www.caser.es/seguros-de-hogar")!
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
            
            break
            
        case 2:
            
            let url = URL(string: "https://www.generali.es/hogar")!
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
            
            break
            
        case 3:
            
            let url = URL(string: "https://www.genesis.es/seguros-hogar")!
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
            
            
            
            break
            
        case 4:
            
            let url = URL(string: "https://www.mapfre.es/seguros/particulares/hogar/seguros-de-hogar/")!
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
            
            break
            
        case 5:
            
            let url = URL(string: "http://m.pelayo.com/seguros-hogar")!
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        default:
            
            break
            
        }
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = insurancesTableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomTableCell
        
        cell.namesLabel.text = names[indexPath.row]
        
        cell.insurancesImages.image = images[indexPath.row]
        
        cell.pricesLabel.text = "Precio: " + String(prices[indexPath.row])
        
        cell.urlButton.tag = indexPath.row
        
        cell.urlButton.addTarget(self, action: #selector(InsurancesController.visitURLButton(_:)), for: UIControlEvents.touchUpInside)
        
        return cell
    }
    
   
        
    
    


}
