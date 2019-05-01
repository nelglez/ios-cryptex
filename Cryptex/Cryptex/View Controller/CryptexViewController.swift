//
//  ViewController.swift
//  Cryptex
//
//  Created by Nelson Gonzalez on 5/1/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

class CryptexViewController: UIViewController {
    @IBOutlet weak var hintLabel: UILabel!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    var cryptexController = CryptexController()
    
    var letters = ["A", "B", "C", "D",
                   "E", "F", "G", "H",
                   "I", "J", "K", "L",
                   "M", "N", "O", "P",
                   "Q", "R", "S", "T",
                   "U", "V", "W", "X",
                   "Y", "Z"]
    
    var countdownTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        updateViews()
    }

    private func updateViews() {
    
        guard let cryptexHint = cryptexController.currentCryptex else { return }
        
        hintLabel.text = cryptexHint.hint
        
        pickerView.reloadAllComponents()
    
    }
    
    private func hasMatchingPassword() -> Bool {
        
       // Get the title of each row (which should be a single letter) in the picker view (try using a for-in loop) and store each one in an array.
        
        guard let currentPassword = cryptexController.currentCryptex else { return false }
        
        var characters: [String] = []
        
        for i in 0..<currentPassword.password.count {
            
            let row = pickerView.selectedRow(inComponent: i)
            
            guard let title = pickerView(pickerView, titleForRow: row, forComponent: i) else { continue }
            
            characters.append(title)
        }
        
        //Take the array of letters and combine them into a single string.
  
        let word = characters.joined().lowercased()
        
        //Check if the string matches the model controller's currentCryptex's password, and return a Bool based on their equality.
        return word == currentPassword.password.lowercased()
    }
    
    
    private func reset() {
        guard let currentPassword = cryptexController.currentCryptex else { return }
        
        updateViews()
        
        //Optionally, you can also reset the picker view's components back to "A" using the pickerView.selectRow method. You will have to loop through each character in the password to reset each component. This is not required, but it's a nice feature to add.
        for i in 0..<currentPassword.password.count {
            pickerView.selectRow(0, inComponent: i, animated: true)
        }
        
        //Invalidate the old timer if there is one to ensure you don't present an alert saying the user ran out of time when they actually haven't. (This will make more sense later on)
        
        if let timer = countdownTimer {
            timer.invalidate()
        }
        
      //  Create a new timer and set the value of countdownTimer to it. Use the Timer.scheduledTimer(withTimeInterval: convenience method to do this. Make the time interval 60 seconds. For now, add a print statement in the handler of the timer that says the timer is finished. We'll come back and add some real code to it later on.
        countdownTimer = Timer.scheduledTimer(withTimeInterval: 60, repeats: false, block: { (_) in
            self.presentNoTimeRemainingAlert()
        })
    }
    
    private func presentNoTimeRemainingAlert() {
        
    }
    
    private func newCryptexAndReset() {
        cryptexController.randomCryptex()
        updateViews()
        reset()
    }
    
    @IBAction func unlockButtonPressed(_ sender: UIButton) {
        
        
    }
    
}

extension CryptexViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // For the number of components, think about how you can figure out how many characters are in the `currentCryptex`'s password.
        
        return cryptexController.currentCryptex?.password.count ?? 0
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // For the number of rows, we want to show as many rows as there are letters.
        return letters.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // For the title of each row, we want to show the letter that corresponds to the row. i.e. row 0 should show "A", row 1 should show "B", etc.
        
        return letters[row]
    }
    
    
}
