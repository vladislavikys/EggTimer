//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = [ "Soft": 300 , "Medium": 420 ,"Hard": 720]
    var secondRemaining = 60
   
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let  hardness = sender.currentTitle!
        
        //получаем силу варки яйца
        
        secondRemaining  =  eggTimes[hardness]!
        // на основе этого опбращаемся по ключу за время  готовки
        
       Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter() {
       //example functionality
       if secondRemaining > 0  {
           print("\(secondRemaining)")
           secondRemaining -= 1
       }
   }
    
   
    
     
    
    
    
}
