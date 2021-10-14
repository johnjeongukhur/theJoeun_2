//
//  ViewController.swift
//  imageTT
//
//  Created by John Hur on 2021/10/06.
//

import UIKit

class ViewController: UIViewController {
    
    let lamps: [Bool: UIImage] = [
        true: UIImage(named: "c.png")!,
        false: UIImage(named: "b.png")!
    ]
    
    @IBOutlet var myImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //var ii = UIImage(named: "b.png")
        
        //myImage.image = ii
        myImage.image = lamps[true]
        
    }
    
    @IBAction func zoomGo(_ sender: UIButton) {
        print("눌렀다")
    }
    
    @IBAction func onOffGo(_ sender: UISwitch) {
        print(sender.isOn)
        
        myImage.image = lamps[sender.isOn]
        
    }
    

}

