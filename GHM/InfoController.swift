//
//  InfoController.swift
//  GHM
//
//  Created by Luis Morales on 3/5/17.
//  Copyright © 2017 Luis Morales. All rights reserved.
//

//Imports

import Foundation
import Charts
import UIKit

class InfoController: UIViewController, ChartViewDelegate{
    
    //Variables
    
    @IBOutlet weak var barChartView: BarChartView!
    
    var infoBalancePassed: Double!
    
    var months: [String]!
    
    @IBOutlet weak var conclusionsButton: UIBarButtonItem!
    
    //Loading the view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        barChartView.delegate = self
        
        //Defining some helpers for drawing the chart
        
         months = ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic"]
        
        
        let unitsSold: [Double]
        
        if infoBalancePassed != nil {
            
             unitsSold = [infoBalancePassed, -5.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
            
        }else{
             unitsSold = [20,-5.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
            self.navigationItem.rightBarButtonItem = nil
        
            
        }
        
        
        
        setChart(dataPoints: months, values: unitsSold)
    }

    @IBAction func goToConclusions(_ sender: Any) {
        
        performSegue(withIdentifier: "ConclusionsNavigation", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ConclusionsNavigation"  {
            
            let destinationVC = segue.destination as! ConclusionsController
            
            
            destinationVC.conclPassed = infoBalancePassed
            
        }
    }
    
    //Function needed for drawing the chart
    
    func setChart(dataPoints: [String], values: [Double]) {
        barChartView.noDataText = "You need to provide data for the chart."
        
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y:Double(values[i]) )
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Beneficios mensuales")
        
         chartDataSet.colors = [UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 1)]
        
        let chartData = BarChartData(dataSet: chartDataSet)
       
        barChartView.data = chartData
       
        barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values:months)
        
         barChartView.chartDescription?.text = ""
        
        
        barChartView.xAxis.labelPosition = .bottom
        
        
               barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        
        
        let ll = ChartLimitLine(limit: 10.0, label: "Objetivo mensual")
        barChartView.rightAxis.addLimitLine(ll)
        
    }
    
    //If we choose one chart, It highlightes
    
    func chartValueSelected(chartView: ChartViewBase, entry: ChartDataEntry, dataSetIndex: Int, highlight: Highlight) {
        print("This one")
    }
    
    
    
}
