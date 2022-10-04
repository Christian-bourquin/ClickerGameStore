//
//  ViewController.swift
//  ClickerGameStore
//
//  Created by CHRISTIAN BOURQUIN on 10/3/22.
//

import UIKit

class ViewController: UIViewController {
    var time = 1.0
    
    @IBOutlet weak var startButtonOutlet: UIButton!
    
    @IBOutlet weak var stopButtonOutlet: UIButton!
    
    @IBOutlet weak var imageViewOutlet: UIImageView!{ didSet {
        imageViewOutlet.isUserInteractionEnabled = true
    }
        
    }
    
    @IBOutlet weak var backgroundImageOutlet: UIImageView!
    
    @IBOutlet weak var scoreOutlet: UILabel!
    
    var points = 0
    var stop = true
    var startBackgroundCheck = true
    var startTimeCheck = true
    var startTouchCheck = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageViewOutlet.image = UIImage(named: "coffeeBean")
        backgroundImageOutlet.image = UIImage(named: "tanBackgroundPlain")
    }
    func timing(){
        var temp = 0
        let timer = Timer.scheduledTimer(withTimeInterval: time , repeats: true) {
            
            timer in
            
            let x = Int.random(in: 50 ... 380)
            let y = Int.random(in: 185 ... 820)
            self.imageViewOutlet.center = CGPoint(x: x,y: y)
            if self.stop == false{
                timer.invalidate()
            }
        temp = temp + 1
            print(temp)
        }
            
    }
    func update(bool1: Bool)
    {
        stop = bool1
    }
    @IBAction func startButtonAction(_ sender: Any){
        imageViewOutlet.isUserInteractionEnabled = true
   update(bool1: true)
       timing()
        }
        
        
    
    
    @IBAction func stopButtonAction(_ sender: UIButton) {
        
      update(bool1: false)
        imageViewOutlet.isUserInteractionEnabled = false
        performSegue(withIdentifier: "toStoreSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nvc = segue.destination as! StoreViewController
        nvc.inPoints = points
        nvc.timeCheck = startTimeCheck
        nvc.tapCheck = startTouchCheck
        nvc.backgroundCheck = startBackgroundCheck
        
    }
    
    @IBAction func tapImageAction(_ sender: UITapGestureRecognizer) {
        points += 1
        scoreOutlet.text = "\(points)"
    }
    
    
    @IBAction func unwind(_ seg: UIStoryboardSegue){
        let svc = seg.source as! StoreViewController
        points = svc.inPoints
        scoreOutlet.text = "\(points)"
        
        if svc.timeCheck == false{
            time = 2.0
            startTimeCheck = svc.timeCheck
        }
        if svc.backgroundCheck == false{
            backgroundImageOutlet.image = UIImage(named: "unicornBackground")
            startBackgroundCheck = svc.backgroundCheck
        }
        if svc.tapCheck == false{
            imageViewOutlet.image = UIImage(named: "UnicornTransparent")
            startTouchCheck = svc.tapCheck
        }
        
    }
    
    
  
    
}

