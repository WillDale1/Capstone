//
//  NotificationSettingsViewController.swift
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


class NotificationSettingsViewController: UIViewController {
    
    @IBOutlet weak var mcBatterySwitch: UISwitch!
   
    
    @IBOutlet weak var AlertSwitch: UISwitch!
    @IBAction func Alerts(_ sender: Any) {
        //permission
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
        }
        
        // notification content
        let content = UNMutableNotificationContent()
        content.title = "Alerts On"
        content.body = "Alert will appear if needed"
        
        // notificatio trigger
        let date = Date().addingTimeInterval(5) //seconds after notification is on
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        // request
        
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        // register request
        center.add(request) { (error) in}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting up notification settings

    }
}


