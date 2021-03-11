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
    var localisation: Date
    
    init(titre: String, contenu: String, date: DateComponents, localisation: Date) {
        self.titre = titre
        self.contenu = contenu
        self.date = date
        self.localisation = localisation
    }
    
    
}
