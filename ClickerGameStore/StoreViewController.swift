//
//  StoreViewController.swift
//  ClickerGameStore
//
//  Created by CHRISTIAN BOURQUIN on 10/3/22.
//

import UIKit

class StoreViewController: UIViewController {

    var inPoints : Int!
    
    @IBOutlet weak var storePoints: UILabel!
    
    @IBOutlet weak var StoreBackground: UIImageView!
    
    @IBOutlet weak var buyBackgroundImage: UIImageView!{didSet{
        buyBackgroundImage.isUserInteractionEnabled = true
    }
    }
    
    @IBOutlet weak var buyExraTime: UIImageView!{didSet{
        buyExraTime.isUserInteractionEnabled = true
    }
    }
    
    @IBOutlet weak var buyNewClick: UIImageView!{didSet{
        buyNewClick.isUserInteractionEnabled = true
    }
    }
    
    var backgroundCheck = false
    
    var tapCheck = false
    
    var timeCheck = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        StoreBackground.image = UIImage(named: "woodenWall")
        buyBackgroundImage.image = UIImage(named: "unicornBackground")
        buyNewClick.image = UIImage(named: "UnicornTransparent")
        buyExraTime.image = UIImage(named: "clockTransparent")
        
        
    }
    
    @IBAction func buyingBackgroundTouch(_ sender: UITapGestureRecognizer) {
        let cost = 10
        if cost <= inPoints && backgroundCheck == true{
            backgroundCheck = false
            inPoints = inPoints - cost
            storePoints.text = "\(inPoints!)"
            buyBackgroundImage.image = UIImage(named: "xCross")

        }
    }
    
    @IBAction func buyExtraTimeClick(_ sender: UITapGestureRecognizer) {
        let cost = 20
        if cost <= inPoints && timeCheck == true{
            timeCheck = false
            inPoints -= cost
            storePoints.text = "\(inPoints!)"
            buyExraTime.image = UIImage(named: "xCross")
        }
    }
    
    @IBAction func buyClickImage(_ sender: UIGestureRecognizer) {
        let cost = 10
        if cost <= inPoints && tapCheck == true{
            tapCheck = false
            inPoints -= cost
            storePoints.text = "\(inPoints!)"
            buyNewClick.image = UIImage(named: "xCross")
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        
        
        performSegue(withIdentifier: "unwindBackButton", sender: nil)
        
    }
    
}

