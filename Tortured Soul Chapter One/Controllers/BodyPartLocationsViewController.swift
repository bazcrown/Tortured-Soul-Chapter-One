//
//  BodyPartLocationsViewController.swift
//  Tortured Soul Chapter One
//
//  Created by Michael Moore on 8/4/18.
//  Copyright © 2018 Bazzy Studios. All rights reserved.
//

import UIKit

class BodyPartLocationsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var selectedBodyPart: BodyPartListItem?
    let armLocations: [String]
    let legLocations: [String]
    let headLocations: [String]
    let torsoLocations: [String]
    var partsDic: [String: [String]]//Dictionary<String, Array<String>>
    
    
    @IBOutlet weak var tableView: UITableView!
    
    required init?(coder aDecoder: NSCoder) {
        //selectedBodyPart = BodyPartListItem(text: "Head", checked: false)
        
        armLocations = ["In a flower box out the front of destroyed house",
                        "To the right of the fireplace in destroyed house",
                        "In the fire place of destroyed house",
                        "On woodstack behind destroyed house",
                        "On rations behind windmill",
                        "Behind stamin-up machine in windmill",
                        "In fence near lost n found",
                        "In front of fireplace in SMG wallbuy room",
                        "Underneath basement stairs",
                        "Attatched to a bowl on the top floor of main house"]
        legLocations = ["Hanging flower bowl out front of destroyed house",
                        "Above entrance to destroyed house",
                        "Hanging flower bowl behind destroyed house",
                        "On ground to the left of double tap machine",
                        "On fence pole behind windmill",
                        "Underneath drawing board top the left of pack a punch",
                        "Opposite SMG wallbuy in a hole in the staircase",
                        "Opposite SMG wall buy at the base of the staircase",
                        "On the front left wheel of the blue truck",
                        "On the wine rack in the basement"]
        headLocations = ["Quick Revive Truck",
                         "SMG wall buy room (back left corner on shelf)",
                         "Fence pole behind wind mill",
                         "Sink on top floor of main house",
                         "0n top of shelf in destroyed house"]
        torsoLocations = ["In fireplace on the top floor of main house",
                          "In box outside the front of destroyed house",
                          "Above the pack-a-punch machine",
                          "In wheelbarrow behind the destroyed house",
                          "0n a cart outside the front of the wind mill"]
        
        partsDic = ["Head":headLocations, "Torso":torsoLocations, "Left Arm":armLocations, "Right Arm":armLocations, "Left Leg":legLocations, "Right Leg":legLocations]
        super.init(coder: aDecoder)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = self.selectedBodyPart?.text
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        /*if let selectedPart = self.selectedBodyPart {
            return partsDic[selectedPart].count
        }*/
        if self.selectedBodyPart?.text == "Head"{
            return self.partsDic["Head"]!.count
        }else if self.selectedBodyPart?.text == "Torso" {
            return self.partsDic["Torso"]!.count
        }else if self.selectedBodyPart?.text == "Left Arm" || self.selectedBodyPart?.text == "Right Arm"{
            return self.partsDic["Left Arm"]!.count
        }else if self.selectedBodyPart?.text == "Left Leg" || self.selectedBodyPart?.text == "Right Leg" {
            return self.partsDic["Left Leg"]!.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bodyPartLocationCell", for: indexPath) as! BodyPartLocationCell
        if self.selectedBodyPart?.text == "Head" || self.selectedBodyPart?.text == "Torso" || self.selectedBodyPart?.text == "Left Arm" || self.selectedBodyPart?.text == "Right Arm" || self.selectedBodyPart?.text == "Left Leg" || self.selectedBodyPart?.text == "Right Leg"{
            cell.locationTextView?.text = self.partsDic[(self.selectedBodyPart?.text)!]![indexPath.row]
        }
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
