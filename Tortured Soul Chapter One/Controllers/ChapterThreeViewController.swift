//
//  ChapterThreeViewController.swift
//  Tortured Soul Chapter One
//
//  Created by Michael Moore on 8/11/18.
//  Copyright © 2018 Bazzy Studios. All rights reserved.
//

import UIKit

class ChapterThreeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var stepList = ["Step 1","Step 2","Step 3","Step 4","Step 5","Step 6","Step 7"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction fileprivate func close() {
        print("presented view dismissed!")
        self.dismiss(animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stepCell", for: indexPath) as! ThreeTableViewCell
        let step = self.stepList[indexPath.row]
        cell.threeStepLabel.text = step
        return cell
    }
    /*func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stepCell", for: indexPath) as! ThreeTableViewCell
        let step = self.stepList[indexPath.row]
        cell.threeStepLabel.text = step
        cell.threeStepLabel.textColor = UIColor(white: 114/255, alpha: 1)
        return cell
    }*/
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stepList.count
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
