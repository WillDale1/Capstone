//
//  MLtesting1.swift
//  Amplifytest
//
//  Created by Jennifer Patino on 3/30/22.
//

import Foundation
import UIKit

/*class MLtesting1ViewController: UIViewController {
    
    //creating the view controller for the bluetooth settings
   //  @IBOutlet var tableView: UITableView!
    //let mqttClient = CocoaMQTT(clientID: "iOS Device", host: "192.168.0.X", port: 1883)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = "https://storage.googleapis.com/automotive-media/music.json"
        print(getMusicData(from: url))
    }
    
    private func getMusicData(from url: String)
    {
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler:{data, response, error in
            guard let data = data, error == nil else{
                print("something went wrong")
                return
            }
            
            var result:Response?
            do {
                result = try JSONDecoder().decode(Response.self, from: data)
            }
            catch {
                print("failed to convert json file \(error.localizedDescription)")
            }
            
            guard let json = result else {
                return
            }
            
            print (json.status) //might not work because the json file does not have the status
            print (json.audio.title)
            print (json.audio.album)
            print (json.audio.artist)
            print (json.audio.genre)
        })
        task.resume()
    }
}

struct Response: Codable{
    let audio: MyPlaylist
    let status: String
}

struct MyPlaylist: Codable{
    let title: String
    let album: String
    let artist: String
    let genre: String
    let source: String
    let image: String
    let trackNumber: Int
    let totalTrackCount: Int
    let duration: Int
    let site: String
    
}

/* link ->http://storage.googleapis.com/automotive-media/music.json
 
 {"music" : [
     { "title" : "Jazz in Paris",
       "album" : "Jazz & Blues",
       "artist" : "Media Right Productions",
       "genre" : "Jazz & Blues",
       "source" : "Jazz_In_Paris.mp3",
       "image" : "album_art.jpg",
       "trackNumber" : 1,
       "totalTrackCount" : 6,
       "duration" : 103,
       "site" : "https://www.youtube.com/audiolibrary/music"
     },
     { "title" : "The Messenger",
       "album" : "Jazz & Blues",
       "artist" : "Silent Partner",
       "genre" : "Jazz & Blues",
       "source" : "The_Messenger.mp3",
       "image" : "album_art.jpg",
       "trackNumber" : 2,
       "totalTrackCount" : 6,
       "duration" : 132,
       "site" : "https://www.youtube.com/audiolibrary/music"
     },
     { "title" : "Talkies",
       "album" : "Jazz & Blues",
       "artist" : "Huma-Huma",
       "genre" : "Jazz & Blues",
       "source" : "Talkies.mp3",
       "image" : "album_art.jpg",
       "trackNumber" : 3,
       "totalTrackCount" : 6,
       "duration" : 162,
       "site" : "https://www.youtube.com/audiolibrary/music"
     },
 */

*/
