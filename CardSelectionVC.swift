//
//  CardSelectionVC.swift
//  CardWorkoutApp
//
//  Created by apple on 20.01.2023.
//

import UIKit

class CardSelectionVC: UIViewController {

    
    @IBOutlet var cardImageView: UIImageView!
    
    @IBOutlet var buttons: [UIButton]!
    var timer: Timer!
    var deck   = Deck.allValues
    
    override func viewDidLoad() {
        super.viewDidLoad()

        startTimer()
        for button in buttons {
            button.layer.cornerRadius = 8
        }
        
        // Do any additional setup after loading the view.
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
        
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImages()), userInfo: nil, repeats: true)
    }
    
    
     @objc func showRandomImages() {
        cardImageView.image = deck.randomElement() ?? UIImage(named: "AS")
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        timer.invalidate()
    }
    
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
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
