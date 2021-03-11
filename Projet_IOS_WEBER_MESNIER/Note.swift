//
//  Note.swift
//  Projet_IOS_WEBER_MESNIER
//
//  Created by user192476 on 3/11/21.
//

import Foundation

class Note {
    
    var titre: String
    var contenu: String
    var date: DateComponents
    var localisation: String
    
    init(titre: String, contenu: String, date: DateComponents, localisation: String) {
        self.titre = titre
        self.contenu = contenu
        self.date = date
        self.localisation = localisation
    }
    
    
}
