//
//  IntroViewController.swift
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


class IntroViewController: UIViewController{
    
    //creating the view controller for the MQTT and Spotify Connection
    //SPOTIFY all of them
   /* var auth = SPTAuth.defaultInstance()!
    var session: SPTSession!
    var player: SPTAudioStreamingController?
    var loginURL: URL?
    */
  /*
    @IBAction func SpotifyButtonTapped(_ sender: Any) {
    }
    
    //MQTT old IP: 10.237.131.76
    let mqttClient = CocoaMQTT(clientID: "iOS Device", host: "172.20.10.3", port: 1883)
    //ip address was from tqamu visitor and the number was recorded from the monitor at FEDC (Alex knows which one)
    
    
   @IBAction func connectButtonMQTT(_ sender: UIButton) {
        mqttClient.connect()
    }
    
    @IBAction func disconnectButtonMQTT(_ sender: UIButton) {
        mqttClient.disconnect()
    }
    
    @IBAction func gpio40SW(_ sender: UISwitch) {
        if sender.isOn {
            mqttClient.publish("rpi/gpio", withString: "on")
        }
        else {
            mqttClient.publish("rpi/gpio", withString: "off")
        }
    }
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        
            }
        }
        
//pause
//play
//skip (next track for alex written in python)

//BACK SKIP AND REWIND are the same button on the app, but jenny will have an if statement that decides what message to throw back at alex for the following two scenarios
//back skip (back track for alex written in python, jenny has code that says that if under 5 seconds then it goes back to the previous song)
//rewind (jenny will send alex a request if the song has played over 5 seconds and alex will have to catch the message (msg) and he will use the rewind command)

//NO SONG SELECTION AT TIME BUTTON (move around in the song)
//set volume (make it into buttons - down and up)


//alert is set if the microcontroller battery is low (if loop in arduino IDE) - alex will send jenny a message once the battery percentage falls below 20% (alex will only send one message to jenny, he will be the one checking this value - "health")
//i dont need to actually play the song, i just need to be able to display the album/title/artist/time -- maybe for demo i would
//keep as .wav in python playlist. Match position of .wav song to the ID given to by running HomeMainSDcode to see what order it outputs the songs in) if confused please look at the photo taken on the ipad
