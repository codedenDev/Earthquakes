//
//  EarthquakeTableViewController.swift
//  Earthquakes
//
//  Created by Richard Kelly on 02/08/2020.
//  Copyright © 2020 Richard Kelly. All rights reserved.
//

import UIKit

class EarthquakeTableViewController: UITableViewController {
    
        private var earthquakeListVM: QuakeListViewModel!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            setup()
        }
        
        private func setup() {
            
            self.title = "Earthquakes"
            self.tableView.backgroundColor = UIColor.Font.sandBrown
            self.navigationController?.navigationBar.prefersLargeTitles = true
            
// MARK: - Webservice Call
            let url = URL(string: "http://api.geonames.org/earthquakesJSON?formatted=true&north=44.1&south=-9.9&east=-22.4&west=55.2&username=mkoppelman")!
            
            Webservice().getEarthquakes(url: url) { earthquakes in
                
                if let earthquakes = earthquakes {
                    
                    self.earthquakeListVM = QuakeListViewModel(earthquakes: earthquakes)
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
            
        }
        
        override func numberOfSections(in tableView: UITableView) -> Int {
            return self.earthquakeListVM == nil ? 0 : self.earthquakeListVM.numberOfSections
        }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.earthquakeListVM.numberOfRowsInSection(section)
        }
    
         override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                  return 75
          }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "QuakeTableViewCell", for: indexPath) as? QuakeTableViewCell else {
                fatalError("QuakeTableViewCell not found")
            }
            
            let earthquakesVM = self.earthquakeListVM.earthquakesAtIndex(indexPath.row)
            
            let myDateString = earthquakesVM.dateTimeLabel
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let myDate = dateFormatter.date(from: myDateString)!
            dateFormatter.dateFormat = "MMM dd, YYYY   HH:mm"
            let somedateString = dateFormatter.string(from: myDate)

            if earthquakesVM.magLabel > 7.9 {
                cell.magLabel?.textColor = UIColor.Font.alertColor
            }
            cell.dateTimeLabel?.text = somedateString
            cell.magLabel?.text = String(describing: earthquakesVM.magLabel)
            cell.depthLabel?.text = String(describing: earthquakesVM.depthLabel)
            cell.regionLabel?.text = earthquakesVM.regionLabel
            return cell
        }
        
    }


