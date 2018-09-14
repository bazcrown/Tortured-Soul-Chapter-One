//
//  TwoViewController.swift
//  Tortured Soul Chapter One
//
//  Created by Michael Moore on 8/5/18.
//  Copyright © 2018 Bazzy Studios. All rights reserved.
//

import UIKit

class TwoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var stepCounts: [String]
    var stepTitles: [String]
    //var stepDescriptions: [String]
    var stepItems: [StepItem]
    @IBOutlet weak var tableView: UITableView!
    required init?(coder aDecoder: NSCoder) {
        self.stepItems = [StepItem]()
        self.stepCounts = ["1.","2.","3.","4.","5."]
        self.stepTitles = ["Melee the Uberschnalle",
                           "Shoot the fish",
                           "Feed the fish",
                           "Find Straub",
                           "Complete the fish and bucket challenge"]
        
        for i in 0...4{
            let tstep = StepItem(count: self.stepCounts[i], title: self.stepTitles[i])
            stepItems.append(tstep)
        }
        super.init(coder: aDecoder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "StepsTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "stepsTableViewCell")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowFishBattery" {
            let destController = segue.destination as! FishBatteryLocationsTableController
            
        }
    }
    @IBAction fileprivate func close() {
        print("presented view dismissed!")
        self.dismiss(animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.stepCounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stepsTableViewCell", for: indexPath) as! StepsTableViewCell
        let item = self.stepItems[indexPath.row]
        cell.stepCountLabel.text = item.count
        cell.stepTitleLabel.text = item.title
        return cell
    }
    
    
    @IBAction func locationButtonClicked(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "ShowFishBattery", sender: self)
        //let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //let navController = storyboard.instantiateViewController(withIdentifier: "LocationsNav")
        //let rootController = UIWindow?.rootViewController as! UINavigationController
        //let appDel = UIApplication.shared.delegate as! AppDelegate
        //appDel.window?.rootViewController = navController
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
