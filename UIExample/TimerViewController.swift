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
    var seg_label = "Repeat"
    
    @IBAction func segCtrl(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            view.backgroundColor = .black
            seg_label = "Repeat!"
            
            
            
        } else if sender.selectedSegmentIndex == 1 {
            view.backgroundColor = .orange
            seg_label = "Times Up!"
            
            
        }
    }
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
        label.text = String(seconds) + " seconds"
        if (seconds == 0)
        {
            
            timer.invalidate()
            //label.text = "Times up!"
            label.text = seg_label
            startOutlet.isHidden = false
            seconds = 10
            startOutlet.isHidden = true
            
            if (seg_label == "Times Up!"){
                timer.invalidate()
            }else{
                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerViewController.counter), userInfo: nil, repeats: true)
                
            }
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
