//
//  DetailPieViewController.swift
//  MyMortgage
//
//  Created by Gladymir Philippe on 6/16/20.
//  Copyright © 2020 Gladymir Philippe. All rights reserved.
//

import UIKit
import Charts

class DetailPieViewController: UIViewController, ChartViewDelegate {
    
    var pieChart = PieChartView()
    
    var numberOfDownloadsDataEntries = [PieChartDataEntry]()

    override func viewDidLoad() {
        super.viewDidLoad()
        pieChart.delegate = self
        // Do any additional setup after loading the view.
        pieChart.chartDescription?.text = ""
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        pieChart.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width)
        pieChart.center = view.center
        
        view.addSubview(pieChart)
        
        var entries = [ChartDataEntry]()
        
        for x in 0..<10 {
            entries.append(ChartDataEntry(x: Double(x), y: Double(x)))
        }
        
        let set = PieChartDataSet(entries: entries)
        
        set.colors = ChartColorTemplates.material()
        
        let data = PieChartData(dataSet: set)
        
        pieChart.data = data
    }
    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
