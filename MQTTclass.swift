//
//  MQTT.swift
//  Amplifytest
//
//  Created by Jennifer Patino on 4/24/22.
//

import Foundation
import CocoaMQTT


protocol didReceiveMessageDelegate {
    func setMessage(message: String)
}

class MQTT: CocoaMQTTDelegate {
    func mqtt(_ mqtt: CocoaMQTT, didSubscribeTopics success: NSDictionary, failed: [String]) {
        
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didUnsubscribeTopics topics: [String]) {
    
    }
    
    var delegate: didReceiveMessageDelegate?
    //let mqttClient = CocoaMQTT(clientID: "iOS Device Amplify", host: "172.20.10.3", port: 1883)
    let mqttClient = CocoaMQTT(clientID: "iOS Device Amplify", host: "172.20.10.2", port: 1883)
    
    func connect() {
        mqttClient.delegate = self
        mqttClient.connect()
        print("Connecting...")
    }
    
    func disconnect() {
        mqttClient.disconnect()
        print("Disconnected")
    }
    
    func publish(topic: String, message: String) {
        mqttClient.publish(topic, withString: message)
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didConnectAck ack: CocoaMQTTConnAck) {
        print("Connected")
        mqttClient.subscribe("test_channel") //if i write rpi/gpio i can read - "test_channel"
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didPublishMessage message: CocoaMQTTMessage, id: UInt16) {
        
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didPublishAck id: UInt16) {
        
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didReceiveMessage message: CocoaMQTTMessage, id: UInt16) {
        let messageDecoded = String(bytes: message.payload, encoding: .utf8)
        print("Did receive a message: \(messageDecoded!)")
        delegate?.setMessage(message: "\(messageDecoded!)")
        
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didSubscribeTopic topic: String) {
        print("Did subscribe to \(topic)")
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didUnsubscribeTopic topic: String) {
        
    }
    
    func mqttDidPing(_ mqtt: CocoaMQTT) {
        
    }
    
    func mqttDidReceivePong(_ mqtt: CocoaMQTT) {

    }
    
    func mqttDidDisconnect(_ mqtt: CocoaMQTT, withError err: Error?) {
        
    }
}
