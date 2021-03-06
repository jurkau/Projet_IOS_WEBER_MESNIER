//
//  NoteTableViewController.swift
//  Projet_IOS_WEBER_MESNIER
//
//  Created by user193287 on 3/11/21.
//

import UIKit

class NoteTableViewController: UITableViewController {

    var notes: [Note] = []
    //    Note(titre: "Test", contenu: "Ceci est une note!", date: Date()),
    //    Note(titre: "Test 2", contenu: "Ceci est encore une note!", date: Date())
    //]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return notes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath)

        // Configure the cell...
        let note = notes[indexPath.row]
        cell.textLabel?.text = note.titre
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        cell.detailTextLabel?.text = dateFormatter.string(from: note.date)
        return cell
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            notes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedNote = notes.remove(at: fromIndexPath.row)
        notes.insert(movedNote, at: to.row)
    }
    
    
    @IBAction func unwindToEmojiTableView(segue: UIStoryboardSegue){
        if segue.identifier == "SaveNote" {
            let sourceVC = segue.source as! AddEditNoteTableViewController
            
            if let note = sourceVC.note {
                if let selectedIndexPath = tableView.indexPathForSelectedRow {
                    // Editing
                    notes[selectedIndexPath.row] = note
                }
                else {
                    // Adding
                    notes.append(note)
                }
                tableView.reloadData()
            }
        }    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "EditNote", let indexPath = tableView.indexPathForSelectedRow {
            let note = notes[indexPath.row]
            let navigationController = segue.destination as! UINavigationController
            let addEditController = navigationController.topViewController as! AddEditNoteTableViewController
            addEditController.note = note
        }
    }
    

}
