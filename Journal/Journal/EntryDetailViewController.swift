//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Daniel Jin on 12/26/17.
//  Copyright © 2017 Daniel Jin. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - Properties
    var entry: Entry?

    
    // MARK: - IBOutlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    // MARK: - IBActions
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        // Check if there is text in the title and body fields
        guard let titleText = titleTextField.text,
            let bodyText = bodyTextView.text else { return }
        
        // If entry exists, just update the information
        if let entry = entry {
            
            EntryController.shared.update(entry: entry, title: titleText, text: bodyText)
            
        } else {
            
            // This is a new entry, so create new
            EntryController.shared.addEntryWith(title: titleText, text: bodyText)
        }
        
        
        // Dismiss current view
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        
        titleTextField.text = "Title"
        bodyTextView.text = "Body"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        updateViews()
        
    }
    
    func updateViews() {
        // Check if the optional entry property is nil
        if let entry = entry {
            
            // Update views
            
            titleTextField.text = entry.title
            bodyTextView.text = entry.text
            
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }

}
