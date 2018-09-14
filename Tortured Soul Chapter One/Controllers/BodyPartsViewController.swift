//
//  BodyPartsViewController.swift
//  Tortured Soul Chapter One
//
//  Created by Michael Moore on 8/3/18.
//  Copyright © 2018 Bazzy Studios. All rights reserved.
//

import UIKit

class BodyPartsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let partsList = ["Head", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg"]
    var partsFound = Array(repeating: false, count: 6)
    var partItems: [BodyPartListItem] = []
    @IBOutlet weak var tableView: UITableView!
    
    required init?(coder aDecoder: NSCoder) {
        partItems = [BodyPartListItem]()
        
        for part in partsList {
            partItems.append(BodyPartListItem(text: part, checked: false))
        }
        super.init(coder: aDecoder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Prepared!")
        if segue.identifier == "showLocationDetails" {
            let destinationController = segue.destination as! BodyPartLocationsViewController
            destinationController.selectedBodyPart = partItems[(getIndexPathFor(view: sender as! UIView, tableView: tableView)?.row)!]
            
            //destinationController.selectedBodyPart =
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! BodyPartLocationsViewController
                destinationController.selectedBodyPart = partItems[indexPath.row]
            }
            
        }
        
    }
    
    func getIndexPathFor(view: UIView, tableView: UITableView) -> IndexPath? {
        
        let point = tableView.convert(view.bounds.origin, from: view)
        let indexPath = tableView.indexPathForRow(at: point)
        return indexPath
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        print("\(String(describing: sender.tag))")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bodyPartCell", for: indexPath) as! BodyPartCell
        cell.bodyPartLabel?.text = partItems[indexPath.row].text
        //cell.accessoryType = .detailDisclosureButton //apartsFound[indexPath.row] ? .checkmark : .none
        cell.checkedLabel.text = ""
        //cell.checkedLabel.text = partsFound[indexPath.row] ? "√" : ""
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell index selected: \(indexPath.row)")
        let cell = tableView.cellForRow(at: indexPath) as! BodyPartCell
        if cell.checkedLabel.text == "" {
            cell.checkedLabel.text = "√"
        }else{
            cell.checkedLabel.text = ""
        }
        self.partsFound[indexPath.row] = true
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
