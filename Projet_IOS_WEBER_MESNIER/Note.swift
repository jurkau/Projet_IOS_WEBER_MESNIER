//
//  Note.swift
//  Projet_IOS_WEBER_MESNIER
//
//  Created by user192476 on 3/11/21.
//

import MapKit
import Foundation

class Note: NSObject {
    
    var titre: String
    var contenu: String
    var date: Date
    var localisation: CLLocation?
    
    init(titre: String, contenu: String, date: Date, localisation: CLLocation?) {
        self.titre = titre
        self.contenu = contenu
        self.date = date
        if let localisation = localisation {
            self.localisation = localisation
        }
    }
    
    
}
