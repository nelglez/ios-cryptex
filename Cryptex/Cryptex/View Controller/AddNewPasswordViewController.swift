//
//  AddNewPasswordViewController.swift
//  Cryptex
//
//  Created by Nelson Gonzalez on 5/1/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

class AddNewPasswordViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var hintTextField: UITextField!
    
    
    var cryptexController: CryptexController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    private func clearTextFields() {
        passwordTextField.text = ""
        hintTextField.text = ""
    }
   
    @IBAction func addButtonPressed(_ sender: UIButton) {
        
        guard let word = passwordTextField.text, !word.isEmpty, let hint = hintTextField.text, !hint.isEmpty else { return }
        
        cryptexController?.addNewCryptex(word: word, hint: hint)
        
        clearTextFields()
        
    }
    

}
