//
//  HomeViewController.swift
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


class HomeViewController: UIViewController, didReceiveMessageDelegate{
    func setMessage(message: String) {
        print(message)
        print("comment")
        self.battery1.image = UIImage(named: "batterylowpic.png")
        self.battery2.image = UIImage(named: "batterylowpic.png")
    }
    
    
    //continue the connectivity of the MQTT
    //let mqttClient = CocoaMQTT(clientID: "iOS Device-Amplify", host: "172.20.10.3", port: 1883)
    let mqttClient = MQTT()
    
    //creating the view controller for the home page
    //running the audio plater in the home screen
    var player:AVAudioPlayer = AVAudioPlayer()

    //play, pause, replay buttons
    @IBAction func play(_ sender: UIButton)
    {
        //mqttClient.connect()
        mqttClient.publish(topic: "rpi/gpio", message: "Play is pressed")
        //player.play()
        print("Play is pressed")
    }
    
    @IBAction func pause(_ sender: AnyObject)
    {
        mqttClient.publish(topic: "rpi/gpio", message: "Pause is pressed")
       // player.pause()
        print("pause is pressed")
        //SS2on2()
    }
    @IBAction func replay(_ sender: UIButton)
    {
        //player.currentTime = 0
        //mqttClient.disconnect()
        mqttClient.publish(topic: "rpi/gpio", message: "Replay is pressed")
        //SS2off2()
        print("replay is pressed")
    }
    
    @IBAction func skip(_ sender: AnyObject)
    {
        //player.currentTime = 0
        //mqttClient.publish("rpi/gpio", withString: "Skip is pressed")
        print("skip is pressed")
        //readMusic()
        skipMusicCall()
        //songProfile()
        print("music is being read")
    }
    
   
    @IBAction func volumeUp(_ sender: AnyObject)
    {
        //player.currentTime = 0
        mqttClient.publish(topic: "rpi/gpio", message: "Volume Up pressed")
        print("volume up is pressed")
        //mqttClient.publish(topic: "rpi/gpio", message: "speaker two set on")
    }
    
    @IBAction func volumeDown(_ sender: AnyObject)
    {
        //player.currentTime = 0
        mqttClient.publish(topic: "rpi/gpio", message: "Volume Down pressed")
        print("volume down is pressed")
        //mqttClient.publish(topic: "rpi/gpio", message: "speaker two set off")
    }
    
    //Album Cover Upload from JSON
        @IBOutlet weak var albumCover: UIImageView!
    var albumName = "1"
    
        @IBOutlet weak var simpleLabel: UILabel!
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    
    func songProfile(){ //songProfile

        if let url = URL(string: "https://7z6smnk9ob.execute-api.us-west-2.amazonaws.com/skip/getsong") {
            URLSession.shared.dataTask(with: url) { [self] data, response, error in
              if let data = data {
                  do {
                     let cisco = try JSONDecoder().decode(MusicInformation.self, from: data)
                      print("JSON FILE INFORMATION:")
                      print(cisco.statusCode)
                      print(cisco.body.id)
                      print(cisco.body.songName)
                      print(cisco.body.like)
                      print(cisco.body.artist)
                      print(cisco.body.albumTest)
                      print ("Json decoding complete :)")
                      albumName = cisco.body.albumTest
                      print(albumName)
                      self.albumCover.image = UIImage(named: cisco.body.albumTest) //parse the json string in here
                      self.albumCover.contentMode = .scaleAspectFit
                      mqttClient.publish(topic: "rpi/gpio", message:cisco.body.id)
                      self.simpleLabel.text = cisco.body.songName + " - " + cisco.body.artist
                  
                  } catch let error {
                     print(error)
                     print ("something NOT good1")
                  }
               }
           }.resume()
        }
        
    }
    
    //{"statusCode": 200, "body": {"id": "2", "songName": "For You", "like": "1",
    //"artist": "Luna Luna", "albumart": "LunaAlbum.jpeg", "albumTest": "LunaAlbum"}}

    //SongProfile
    struct Body_Music: Decodable {
        enum Category: String, Decodable {
            case swift, combine, debugging, xcode
        }

        let id: String
        let songName: String
        let like: String
        let artist: String
        let albumart: String
        let albumTest: String
    }

    struct MusicInformation: Decodable {
        enum Category: String, Decodable {
            case swift, combine, debugging, xcode
        }

        let statusCode: Int
        let body: Body_Music
    }
    
    
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    func skipMusicCall(){

        if let url = URL(string: "https://mflocereb8.execute-api.us-west-2.amazonaws.com/first/skipSong") {
            URLSession.shared.dataTask(with: url) { [self] data, response, error in
              if let data = data {
                  do {
                     let cisco2 = try JSONDecoder().decode(MusicInformation2.self, from: data)
                      print("JSON FILE INFORMATION:")
                      print(cisco2.body)
                      print(cisco2.body.id)
                      print(cisco2.body.songName)
                      print(cisco2.body.like)
                      print(cisco2.body.artist)
                      print(cisco2.body.albumTest)
                      print ("Json decoding complete :)")
                      albumName = cisco2.body.albumTest
                      print(albumName)
                      self.albumCover.image = UIImage(named: cisco2.body.albumTest) //parse the json string in here
                      self.albumCover.contentMode = .scaleAspectFit
                      mqttClient.publish(topic: "rpi/gpio", message:cisco2.body.id)
                      self.simpleLabel.text = cisco2.body.songName + " - " + cisco2.body.artist
                  
                  } catch let error {
                     print(error)
                     print ("something NOT good2")
                  }
               }
           }.resume()
        }
        
    }

    struct Body_Music2: Decodable {
        enum Category: String, Decodable {
            case swift, combine, debugging, xcode
        }

        let id: String
        let songName: String
        let like: String
        let artist: String
        let albumart: String
        let albumTest: String
    }

    struct MusicInformation2: Decodable {
        enum Category: String, Decodable {
            case swift, combine, debugging, xcode
        }

        let statusCode: Int
        let body: Body_Music2
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    func dislikeAPI(){

        if let url = URL(string: "https://qi2j52cid2.execute-api.us-west-2.amazonaws.com/first/dislike") {
            URLSession.shared.dataTask(with: url) { [self] data, response, error in
              if let data = data {
                  do {
                     let cisco3 = try JSONDecoder().decode(MusicInformation3.self, from: data)
                      print("Dislike FILE INFORMATION:")
                      print(cisco3.body.id)
                      print(cisco3.body.songName)
                      print(cisco3.body.dislike)
                      print ("Dislike Json decoding complete :)")
                  
                  } catch let error {
                     print(error)
                     print ("something NOT good3")
                  }
               }
           }.resume()
        }
        
    }

    struct Body_Music3: Decodable {
        enum Category: String, Decodable {
            case swift, combine, debugging, xcode
        }

        let id: String
        let songName: String
        let dislike: String
        let artist: String
        let albumart: String
        let albumTest: String
    }

    struct MusicInformation3: Decodable {
        enum Category: String, Decodable {
            case swift, combine, debugging, xcode
        }

        let statusCode: Int
        let body: Body_Music3
    }
    
    
    
    
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    func likeAPI(){

        if let url = URL(string: "https://dpebe7mbvk.execute-api.us-west-2.amazonaws.com/first/test1") {
            URLSession.shared.dataTask(with: url) { [self] data, response, error in
              if let data = data {
                  do {
                     let cisco4 = try JSONDecoder().decode(MusicInformation4.self, from: data)
                      print("LIKE FILE INFORMATION:")
                      //
                      print(cisco4.body.id)
                      print(cisco4.body.songName)
                      print(cisco4.body.like)
                      //print(cisco4.body.artist)
                      //print(cisco4.body.albumTest)
                      print ("Like Json decoding complete :)")
                      //albumName = cisco2.body.albumTest
                      //print(albumName)
                      //self.albumCover.image = UIImage(named: cisco2.body.albumTest) //parse the json string in here
                      //self.albumCover.contentMode = .scaleAspectFit
                      //mqttClient.publish(topic: "rpi/gpio", message:cisco2.body.id)
                      //self.simpleLabel.text = cisco2.body.songName + " - " + cisco2.body.artist
                  
                  } catch let error {
                     print(error)
                     print ("something NOT good4")
                  }
               }
           }.resume()
        }
        
    }

    struct Body_Music4: Decodable {
        enum Category: String, Decodable {
            case swift, combine, debugging, xcode
        }

        let id: String
        let songName: String
        let like: String
        let artist: String
        let albumart: String
        let albumTest: String
    }

    struct MusicInformation4: Decodable {
        enum Category: String, Decodable {
            case swift, combine, debugging, xcode
        }

        let statusCode: Int
        let body: Body_Music4
    }
    
    
    
    
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    /*func loadAlbumCoverImage(){
        print (albumName)
        albumCover.image = UIImage(named: albumName) //parse the json string in here
        albumCover.contentMode = .scaleAspectFit
        
    }*/
    
  /*  private var mqtt:CocoaMQTT?
    private var identifier:String!
    private var host:String!
    private var topic:String!
    private var message:String!
    
    func publish(with message:String){
            mqtt?.publish(topic, withString: message, qos: .qos1)
        }*/
    
    
// BATTERY LEVELS
    @IBOutlet weak var battery1: UIImageView!
    @IBOutlet weak var battery2: UIImageView!
    
    
  /*  func batteryCheck(_ mqtt: CocoaMQTT, didReceiveMessage message: CocoaMQTTMessage, id: UInt16){
        let messageDecoded = String(bytes: message.payload, encoding: .utf8)
        print("Did receive a message: \(messageDecoded!)")
        
        //self.mqttClient.subscribe("topic/dronetest")
        //self.mqttClient.didReceiveMessage = { mqtt, message, id in
            //print("Message received in topic \(message.topic) with payload \(message.string!)")
    }*/
    
//LIKE AND DISLIKE BUTTONS
    //buttonCounters
    var likeButtonCount: Float = 0.0
    var dislikeButtonCount: Float = 0.0
    var dislikeString: String = " "
    var likeString: String = " "
    
    
    //Dislike button
    @IBAction func dislike(_ sender: AnyObject)
    {
        minClickCount()
        dislikeAPI()
    }
    
    //Like button
    @IBAction func like(_ sender: AnyObject)
    {
        posClickCount()
        likeAPI()
    }
    
    func minClickCount() {
        dislikeButtonCount = dislikeButtonCount + 1.0
        dislikeString = "Dislikes:" + dislikeButtonCount.description
        print(dislikeString)
    }
    
    func posClickCount() {
        likeButtonCount = likeButtonCount + 1.0
        likeString = "Likes:" + likeButtonCount.description
        print(likeString)
    }
    
  /*  func subscrive(){
        mqttClient.subscribe("rpi/gpio")
    }*/
    
   /* func SS1on2 (){
        mqttClient.publish(topic: "rpi/gpio", message: "speaker one set on")
        //mqttClient.publish(topic: "rpi/gpio", message: "Play is pressed")
        print("238964923 speaker one set on")
    }
    
    func SS1off2 (){
        mqttClient.publish(topic: "rpi/gpio", message: "speaker one set off")
        print("238964923 speaker one set on")
    }
    
    func SS2on2 (){
        mqttClient.publish(topic: "rpi/gpio", message: "speaker two set on")
        print("238964923 speaker one set on")
    }
    
    func SS2off2 (){
        mqttClient.publish(topic: "rpi/gpio", message: "speaker two set off")
        print("238964923 speaker one set on")
    }
    
    func SS3on2 (){
        mqttClient.publish(topic: "rpi/gpio", message: "speaker three set on")
        print("238964923 speaker one set on")
    }
    
    func SS3off2 (){
        mqttClient.publish(topic: "rpi/gpio", message: "speaker three set off")
    }
    
    func S1lefton2 (){
        mqttClient.publish(topic: "rpi/gpio", message: "left speaker one on ")
    }
    
    func S1leftoff2(){
        mqttClient.publish(topic: "rpi/gpio", message: "left speaker one off")
    }
    
    func S1righton2 (){
        mqttClient.publish(topic: "rpi/gpio", message: "right speaker one on")
    }
    
    func S1rightoff2(){
        mqttClient.publish(topic: "rpi/gpio", message: "right speaker one off")
    }
    
    func S2lefton2 (){
        mqttClient.publish(topic: "rpi/gpio", message: "left speaker two on")
    }
    
    func S2leftoff2(){
        mqttClient.publish(topic: "rpi/gpio", message: "left speaker two off")
    }
    
    func S2righton2 (){
        mqttClient.publish(topic: "rpi/gpio", message: "right speaker two on")
    }
    
    func S2rightoff2(){
        mqttClient.publish(topic: "rpi/gpio", message: "right speaker two off")
    }
    
    func S3lefton2 (){
        mqttClient.publish(topic: "rpi/gpio", message: "left speaker three on")
    }
    
    func S3leftoff2(){
        mqttClient.publish(topic: "rpi/gpio", message: "left speaker three off")
    }
    
    func S3righton2 (){
        mqttClient.publish(topic: "rpi/gpio", message: "right speaker three on")
    }
    
    func S3rightoff2(){
        mqttClient.publish(topic: "rpi/gpio", message: "right speaker three off")
    }
    */
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) // No need for semicolon
        mqttClient.connect()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mqttClient.delegate = self
        mqttClient.connect()
        songProfile()
       // subscrive()
       // mqttClient.subscribe("battery/power")
       // print (mqttClient.didReceiveMessage)
        
        
        //self.mqttClient.delegate = self //testing MQTT receive message
        //batteryCheck(client, )
        
       // publish(with: String)
        //print("pause time")
       // loadAlbumCoverImage()
        // Do any additional setup after loading the view.
        
       /* do{
            let audioPath = Bundle.main.path(forResource: "oye_mi_amor", ofType: "mp3")
           // try player = AVAudioPlayer(contentsOf: NSURL (fileURLWithPath: audioPath!) as URL)
        }
        catch{
            //ERROR
        }*/
    }
}


/*extension HomeViewController: CocoaMQTTDelegate {
    
    func mqtt(_ mqtt: CocoaMQTT, didSubscribeTopics success: NSDictionary, failed: [String]) {
        
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didConnect host: String, port: Int) {
            mqttClient.subscribe("rpi/gpio")
        print ("subscribes")
    }
        
    func mqtt(_ mqtt: CocoaMQTT, didReceiveMessage message: CocoaMQTTMessage, id: UInt16 ) {
        if let msgString = message.string {
            //mqttLabel.text = msgString
            print(msgString)
            self.battery1.image = UIImage(named: "batterylowpic.png")
            self.battery2.image = UIImage(named: "batterylowpic.png")
            
        }
    }
        
        // Other required methods for CocoaMQTTDelegate
    func mqtt(_ mqtt: CocoaMQTT, didReceive trust: SecTrust, completionHandler: @escaping (Bool) -> Void) {
            completionHandler(true)
    }
        
    func mqtt(_ mqtt: CocoaMQTT, didConnectAck ack: CocoaMQTTConnAck) {
    }
        
    func mqtt(_ mqtt: CocoaMQTT, didPublishMessage message: CocoaMQTTMessage, id: UInt16) {
    }
        
    func mqtt(_ mqtt: CocoaMQTT, didPublishAck id: UInt16) {
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didSubscribeTopics topic: [String]) {
    }
        
    func mqtt(_ mqtt: CocoaMQTT, didUnsubscribeTopics topic: [String]) {
    }
    
    func mqttDidPing(_ mqtt: CocoaMQTT) {
    }
    
    func mqttDidReceivePong(_ mqtt: CocoaMQTT) {
    }
    
    func mqttDidDisconnect(_ mqtt: CocoaMQTT, withError err: Error?) {
    }
    
    func _console(_ info: String) {
    }
}*/

