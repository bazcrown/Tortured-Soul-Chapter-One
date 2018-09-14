//
//  StepsViewController.swift
//  Tortured Soul Chapter One
//
//  Created by Michael Moore on 8/5/18.
//  Copyright © 2018 Bazzy Studios. All rights reserved.
//

import UIKit

class StepsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var stepCounts: [String]
    var stepTitles: [String]
    //var stepDescriptions: [String]
    var stepItems: [StepItem]
    @IBOutlet weak var tableView: UITableView!
    required init?(coder aDecoder: NSCoder) {
        self.stepItems = [StepItem]()
        self.stepCounts = ["1.","2.","3.","4.","5.","6."]
        self.stepTitles = ["Collect the body parts",
                           "Find the rope",
                           "Find the metal rods",
                           "Winch the zombie up the windmill",
                           "Charge the zombie",
                           "Collect the Hilt"]
        /*self.stepDescriptions = ["There are six body parts that players can collect in the village map: 2 x arm, 2 x leg, a body and a head. The spawn locations for these parts are random every game",
                                 "Collect the rope from behind the windmill in the creek area. It's dandling from a tree, just outside of the map near the river (see image above). Shoot the rope with any weapon and it'll fall into the water and float away, wait a few minutes and collect the rope a little downstream. Hold down the controller button when you do this to make the tree rise and the rope appear.",
                                 "Once you have all the zombie parts a drop pod appears in spawn. Collect two metal rods from it.",
                                 "Now collect a Wustling arm (by killing that particular zombie) and place it into the windmill cogs to stop the windmill from turning. The key is to stop the windmill when the larger blade is at the bottom.",
                                 "This fallen zombie acts as a soul box now so simply kill zombies nearby to charge it. Eventually the zombie awakens and walks around the map before falling into a small hole. Wait another round and the zombie reappears with a battery in his hand, walking towards the cellar.",
                                 "Eventually when the zombie is charged enough he drops the battery. Pick it up and use it to open the nearby door. The Hilt reward is inside. You now have the first piece of Barbarossa's sword!"]*/
        for i in 0...5{
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
    @IBAction fileprivate func close() {
        print("presented view dismissed!")
        self.dismiss(animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowBodyParts" {
            let destinationController = segue.destination as! BodyPartsViewController
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showPartsList(_ sender: UIBarButtonItem) {
        //let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //let navController = storyboard.instantiateViewController(withIdentifier: "BodyPartsNav")
        
        //let appDel = UIApplication.shared.delegate as! AppDelegate
        //appDel.window?.rootViewController = navController
        performSegue(withIdentifier: "ShowBodyParts", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stepsTableViewCell") as! StepsTableViewCell
        let item = self.stepItems[indexPath.row]
        cell.stepCountLabel.text = item.count
        cell.stepTitleLabel.text = item.title
        //cell.stepDescriptionTextView.text = item.instruction
        return cell
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
