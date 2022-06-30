//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTimes = [ "Soft": 3 , "Medium": 4 ,"Hard": 7]
    var secondRemaining = 0
    var timer = Timer()
   
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let  hardness = sender.currentTitle!
        timer.invalidate()
        
        //получаем силу варки яйца
        
        secondRemaining  =  eggTimes[hardness]!
        // на основе этого опбращаемся по ключу за время  готовки
        
       timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter() {
       //example functionality
       if secondRemaining > 0  {
           print("\(secondRemaining)")
           secondRemaining -= 1
       }else if secondRemaining == 0 {
           timer.invalidate()
           titleLabel.text = "DONE!"
       }
   }
    
   
    
     
    
    
    
}
