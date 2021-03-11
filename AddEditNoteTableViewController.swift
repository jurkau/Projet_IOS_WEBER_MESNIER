//
//  AddEditNoteTableViewController.swift
//  Projet_IOS_WEBER_MESNIER
//
//  Created by user193287 on 3/11/21.
//

import UIKit

class AddEditNoteTableViewController: UITableViewController {
    
    var note: Note?
    
    @IBOutlet weak var titreTF: UITextField!
    @IBOutlet weak var contenuTF: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let note = note {
            titreTF.text = note.titre
            contenuTF.text = note.contenu
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SaveNote" {
            let titre = titreTF.text ?? ""
            let contenu = contenuTF.text ?? ""
            let date = Date()
            
            note = Note(titre: titre, contenu: contenu, date: date)
        }
    }
    

}
