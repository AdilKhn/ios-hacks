import UIKit
import QuartzCore

class ViewController: UIViewController {
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        updateLabels()
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider?.setThumbImage(thumbImageNormal, forState: .Normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider?.setThumbImage(thumbImageHighlighted, forState: .Highlighted)

        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        if let trackLeftImage = UIImage(named: "SliderTrackLeft"){
        
            let trackLeftResizeable = trackLeftImage.resizableImageWithCapInsets(insets)
            slider?.setMinimumTrackImage(trackLeftResizeable, forState: .Normal)
        }
        
        
        if let trackRightImage = UIImage(named: "SliderTrackRight"){
        
            let trackRightResizable = trackRightImage.resizableImageWithCapInsets(insets)
            slider?.setMaximumTrackImage(trackRightResizable, forState: .Normal)
        
        }
        
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
      
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert(){
        let difference = abs(currentValue - targetValue)
        var points = 100 - difference
       
        
        
        let title: String
        
        
        if difference == 0 {
            title = "Perfect!"
            points += 100
        }else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        }else if difference < 10 {
            title = "Pretty good!"
        }else{
            title = "Not even close..."
        }

        score += points
        let message = "You scored \(points) points"
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK",
                                   style: .Default,
                                   handler: { action in
                                               self.startNewRound()
                                               self.updateLabels()
                                            })
        
        alert.addAction(action)
                
        presentViewController(alert, animated: true, completion: nil)

    }
    
    @IBAction func startNewGame(){
        score = 0
        round = 0
        startNewRound()
        updateLabels()
        
        let transition = CATransition()
        transition.type = kCATransitionFade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        view.layer.addAnimation(transition, forKey: nil)
        
    }
    
    func startNewRound(){
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider?.value = Float(currentValue)
    }
    
    func updateLabels(){
        targetLabel?.text = String(targetValue)
        scoreLabel?.text = String(score)
        roundLabel?.text = String(round)
    }
    
    @IBAction func sliderMoved(slider: UISlider){
        currentValue = lroundf(slider.value)
        
    }

}
