//
//  LikeJSON.swift
//  Amplifytest
//
//  Created by Jennifer Patino on 4/14/22.
//

import Foundation
import UIKit

class MLtesting1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        readMusic()
    }
}

func readMusic(){

    if let url = URL(string: "https://dpebe7mbvk.execute-api.us-west-2.amazonaws.com/first/test1") {
       URLSession.shared.dataTask(with: url) { data, response, error in
          if let data = data {
              do {
                 let cisco = try JSONDecoder().decode(MusicInformation.self, from: data)
                 print(cisco.statusCode)
                  print(cisco.body.id)
                 print ("something good")
              } catch let error {
                 print(error)
                 print ("something NOT good")
              }
           }
       }.resume()
    }
    
}
    
//{"statusCode": 200, "body": {"id": "2", "songName": "For You", "like": "1", "artist": "Luna Luna", "albumart": "LunaAlbum.jpeg", "albumTest": "LunaAlbum"}}

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
