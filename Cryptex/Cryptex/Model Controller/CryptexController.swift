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
    
    var cryptex = [Cryptex(password: "Foo", hint: "A common placeholder word in programming"),
                   Cryptex(password: "Cryptex", hint: "The thing you are trying to solve right now")]
    
    
    var currentCryptex: Cryptex?
    
    func randomCryptex() {
        guard let randomCryptex = cryptex.randomElement() else { return }
        
        currentCryptex = randomCryptex
    }
   
    
}
