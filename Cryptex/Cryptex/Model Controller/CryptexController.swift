//
//  CryptexController.swift
//  Cryptex
//
//  Created by Nelson Gonzalez on 5/1/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import Foundation

class CryptexController {
    
    init() {
        randomCryptex()
    }
    
   private(set) var cryptex = [Cryptex(password: "Blue", hint: "The color of the sky"),
                   Cryptex(password: "Green", hint: "The color of the grass")]
    
    
    var currentCryptex: Cryptex?
    
    func randomCryptex() {
        guard let randomCryptex = cryptex.randomElement() else { return }
        
        currentCryptex = randomCryptex
    }
    
    func addNewCryptex(word: String, hint: String) {
        
        let newCryptex = Cryptex(password: word, hint: hint)
        
        cryptex.append(newCryptex)
        
    }
   
    
}
