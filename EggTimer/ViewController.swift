import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    
    let eggTimes = [ "Soft": 3 , "Medium": 4 ,"Hard": 7]
    var secondRemaining = 0
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    var player: AVAudioPlayer!
   
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let  hardness = sender.currentTitle!
        timer.invalidate()
        
        progressView.setProgress(0, animated: true)
        secondsPassed = 0
        titleLabel?.text = hardness
        totalTime  =  eggTimes[hardness]!
        // на основе этого опбращаемся по ключу за время  готовки
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter() {
       //example functionality
       if secondsPassed < totalTime  {

           secondsPassed += 1
           progressView.progress = Float(secondsPassed) / Float(totalTime)
           
           
           
       }else if secondRemaining == 0 {
           timer.invalidate()
           let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
           player = try! AVAudioPlayer(contentsOf: url!)
           player.play()
           
           titleLabel.text = "DONE!"
       }
        
        
        
//        func playSound(soundName: String) {
//
//            let url = Bundle.main.url(forResource: soundName , withExtension: "wav")
//            player = try! AVAudioPlayer(contentsOf: url!)
//            player.play()
//
//        }
   }
    
   
    
     
    
    
    
}
