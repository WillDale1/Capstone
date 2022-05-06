//
//  EqualizerViewController.swift
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

class EqualizerViewController: UIViewController {
    
    //creating the view controller for the equalizer settings
    var audioEngine: AVAudioEngine = AVAudioEngine()
    var equalizer: AVAudioUnitEQ!
    var audioPlayerNode: AVAudioPlayerNode = AVAudioPlayerNode()
    var audioFile: AVAudioFile!
    var filterType: AVAudioUnitEQFilterType = .parametric
    var bypass: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        equalizer = AVAudioUnitEQ(numberOfBands: 10)
        audioEngine.attach(audioPlayerNode)
        audioEngine.attach(equalizer)
        let bands = equalizer.bands
        let freqs = [32, 64, 125, 250, 500, 1000, 2000, 4000, 8000, 16000]
        audioEngine.connect(audioPlayerNode, to: equalizer, format: nil)
        audioEngine.connect(equalizer, to: audioEngine.outputNode, format: nil)
        for i in 0...(bands.count - 1) {
            bands[i].frequency  = Float(freqs[i])
            bands[i].bypass     = false
            bands[i].filterType = .parametric
    }

            bands[0].gain = 10.0
            bands[0].filterType = .lowShelf
            bands[1].gain = 10.0
            bands[1].filterType = .lowShelf
            bands[2].gain = 10.0
            bands[2].filterType = .lowShelf
            bands[3].gain = 10.0
            bands[3].filterType = .lowShelf
            bands[4].gain = 10.0
            bands[4].filterType = .lowShelf
            bands[5].gain = 0.0
            bands[5].filterType = .highShelf
            bands[6].gain = 00.0
            bands[6].filterType = .highShelf
            bands[7].gain = 0.0
            bands[7].filterType = .highShelf
            bands[8].gain = 0.0
            bands[8].filterType = .highShelf
            bands[9].gain = 0.0
            bands[9].filterType = .highShelf

            do {
                if let filepath = Bundle.main.path(forResource: "oye_mi_amor", ofType: "mp3") {
                    let filepathURL = NSURL.fileURL(withPath: filepath)
                    audioFile = try AVAudioFile(forReading: filepathURL)
                    audioEngine.prepare()
                    try audioEngine.start()
                    audioPlayerNode.scheduleFile(audioFile, at: nil, completionHandler: nil)
                    audioPlayerNode.play()
                }
            } catch _ {}
        }
}

