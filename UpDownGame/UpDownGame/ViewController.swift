//
//  ViewController.swift
//  UpDownGame
//
//  Created by Mark Kim on 2022/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    var randomValue: Int = 0
    var tryCount: Int = 0
    
    // Annotations connected with a component
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var tryCountLabel: UILabel!
    @IBOutlet weak var sliderValueLabel: UILabel!
    @IBOutlet weak var minimumValueLabel: UILabel!
    @IBOutlet weak var maximumValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let thumbImage = UIImage(named: "slider_thumb") {
            slider.setThumbImage(thumbImage, for: .normal)
        }
        reset()
    }
    
    // Event -> Action
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print(sender.value)
        let intValue: Int = Int(sender.value)
        sliderValueLabel.text = String(intValue)
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default) { (action) in self.reset() }
        alert.addAction(okAction)
        present(alert, animated: true,
                completion: nil)
    }
    
    @IBAction func touchUpHitButton(_ sender: UIButton) {
        print(slider.value)
        let hitValue: Int = Int(slider.value)
        slider.value = Float(hitValue)
        
        tryCount += 1
        tryCountLabel.text = "\(tryCount) / 5"
        
        if randomValue == hitValue {
            showAlert(message: "YOU HIT!")
            reset()
        }
        else if tryCount >= 5 {
            showAlert(message: "YOU LOSE...")
            reset()
        }
        else if randomValue > hitValue {
            slider.minimumValue = Float(hitValue)
            minimumValueLabel.text = String(hitValue)
        }
        else {
            slider.maximumValue = Float(hitValue)
            maximumValueLabel.text = String(hitValue)
        }
    }
    
    @IBAction func touchUpResetButton(_ sender: UIButton) {
        print("Touch Up Reset Button")
        reset()
    }
    
    func reset() {
        print("RESET")
        randomValue = Int.random(in: 0...30)
        print(randomValue)
        tryCount = 0
        tryCountLabel.text = "0 / 5"
        slider.minimumValue = 0
        minimumValueLabel.text = "0"
        slider.maximumValue = 30
        maximumValueLabel.text = "30"
        slider.value = 15
        sliderValueLabel.text = "15"
    }

}
