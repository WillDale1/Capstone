//
//  JSONreading.swift
//  Amplifytest
//
//  Created by Jennifer Patino on 4/11/22.
//

import Foundation
import UIKit


class MLtesting1ViewController3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        read()
    }
}

func read(){

    if let url = URL(string: "https://944pt27lm3.execute-api.us-west-2.amazonaws.com/corsNEW/test1") {
       URLSession.shared.dataTask(with: url) { data, response, error in
          if let data = data {
              do {
                 let cool = try JSONDecoder().decode(BlogPost.self, from: data)
                 print(cool.statusCode)
                 print ("something good")
              } catch let error {
                 print(error)
                 print ("something NOT good")
              }
           }
       }.resume()
    }
    
}
    
    

struct Body: Decodable {
    enum Category: String, Decodable {
        case swift, combine, debugging, xcode
    }

    let temperature: String
    let id: String
}

struct BlogPost: Decodable {
    enum Category: String, Decodable {
        case swift, combine, debugging, xcode
    }

    let statusCode: Int
    let body: Body
}


