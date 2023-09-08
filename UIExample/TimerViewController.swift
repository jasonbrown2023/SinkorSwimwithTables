//
//  TimerViewController.swift
//  UIExample
//
//  Created by jason brown on 13/06/1402 AP.
//

import UIKit

class TimerViewController: UIViewController {
    var seconds = 10
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //timerAction()
        timer.invalidate()
    

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var sliderOutlet: UISlider!
    
    @IBAction func time_slider(_ sender: UISlider) {
        seconds = Int(sender.value)
        label.text = String(seconds)
        
    }
    @IBOutlet weak var label: UILabel!
    
    
    @IBAction func startButton(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerViewController.counter), userInfo: nil, repeats: true)
        
        sliderOutlet.isHidden = true
        view.backgroundColor = .lightGray
        startOutlet.isHidden = true
        
    }
    
    @IBOutlet weak var startOutlet: UIButton!
    
    @IBOutlet weak var stopOutlet: UIButton!
    

    @IBAction func stopButton(_ sender: UIButton) {
        timer.invalidate()
        view.backgroundColor = .red
        seconds = 10
        sliderOutlet.setValue(10, animated: true)
        label.text = "10 seconds"
        sliderOutlet.isHidden = false
        startOutlet.isHidden = false
        view.backgroundColor = .darkGray
    }
    
    @objc func counter()
    {
        seconds -= 1
        label.text = String(seconds) + "seconds"
        if (seconds == 0)
        {
            view.backgroundColor = .yellow
            timer.invalidate()
            label.text = "Times up!"
            //sliderOutlet.isHidden = false
            startOutlet.isHidden = false
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerViewController.counter), userInfo: nil, repeats: true)
            seconds = 10
            
            startOutlet.isHidden = true
        }
    }
    
    
   
     
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
