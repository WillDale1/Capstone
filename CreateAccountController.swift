//
//  CreateAccountController.swift
//  Amplifytest
//
//  Created by Jennifer Patino on 3/24/22.
//

import UIKit
import StoreKit
import Foundation
import AVFoundation
import MediaPlayer
import CoreBluetooth
import CocoaMQTT
import SafariServices

class CreateAccountController: UIViewController {
    
    //creating the view controller for the bluetooth settings
   
    @IBOutlet weak var CreateUserTextField: UITextField!
    
    @IBOutlet weak var CreatePassTextField: UITextField!
    
    @IBOutlet weak var CreateRePassTextField: UITextField!
    
    @IBAction func CreateAccountButtonTapped(_ sender: Any) {
        
        //Will validate all fields to make sure they are not empty
        if (CreateUserTextField.text?.isEmpty)! || (CreatePassTextField.text?.isEmpty)!
        {
            //Display Alert Message and return
            displayMessage(userMessage: "All fields are required.")
            return
        }
        
        //Will validate passwords
        if ((CreatePassTextField.text?.elementsEqual(CreateRePassTextField.text!))! != true)
        {
            //Display Alert Message and return
            displayMessage(userMessage: "Please make sure that passwords match.")
            return
        }
    }
    //an UIActivity Indication can be added to the screen if I want the user to see that data is being retreived - look at video 10/15 on youtube minute 6
    
    //JSON request
  
    //function that displays the message when an error occurs
    func displayMessage(userMessage:String) -> Void
    {
        DispatchQueue.main.async
        {
            let alertController = UIAlertController(title: "Alert", message: userMessage, preferredStyle: .alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .default)
            {
                (action:UIAlertAction!)in
                //Code in this block will trigger when OK button is tapped
                DispatchQueue.main.async
                    {
                        self.dismiss(animated: true, completion: nil)
                    }
                }
                alertController.addAction(OKAction)
                self.present(alertController, animated: true, completion:nil)
            }
        }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}
