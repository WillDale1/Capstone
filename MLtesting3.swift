//
//  MLtesting1.swift
//  Amplifytest
//
//  Created by Jennifer Patino on 3/30/22.
//
/*
import Foundation
import UIKit

class MLtesting1ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = "https://944pt27lm3.execute-api.us-west-2.amazonaws.com/corsNEW/test1"
        //let url = "{"statusCode": 200, "body": {"temperature": "24.3", "id": "627005524"}}"
        print(getMusicData(from: url))
    }

    private func getMusicData(from url: String)
    {
        let JSONstring = "{\"statusCode\": 200, \"body\": {\"temperature\": \"24.3\", \"id\": \"627005524\"}}"
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler:{data, response, error in
            guard let data = data, error == nil else{
                print("something went wrong")
                return
            }
        }
       /* var result:Response?
            do {
                //JSONDecoder().keyDecodingStrategy = .convertFromSnakeCase //new line added
                //result = try JSONDecoder().decode(Response.self, from: data)
              // let JSONstring = "{\"statusCode\": 200, \"body\": {\"temperature\": \"24.3\", \"id\": \"627005524\"}}"
               print("nothing")
            }
                                              
            catch {
                print("failed to convert json file")
                print(JSONstring)
                debugPrint(error)
            }*/
            
           // guard let json = result else {
                //return
           // }
            
          /*  print (json.statusCode) //might not work because the json file does not have the status
            print (json.headers.Content_Type)
            print (json.body.Id)*/
        
       // })
        //task.resume()}
            
    }
}

struct Response: Codable{
    let statusCode: Int
    let headers: Headers
    let body: Body1
        
}

struct Headers: Codable{
    let Content_Type: String
    
    enum CodingKeys: String, CodingKey {
        case Content_Type = "Content-Type"
        
        
    }
}

struct Body1: Codable{
    let Id: Int
    let username: String
    let karma: Int
    let date_created: String
    
    enum CodingKeys: String, CodingKey {
        case Id = "id"
        case username = "username"
        case karma = "karma"
        case date_created = "date-created"
        
    }
    
}

/* link ->https://944pt27lm3.execute-api.us-west-2.amazonaws.com/corsNEW/test1
 
 {"statusCode": 200,
 "headers": {"Content-Type": "application/json"},
 "body": "{\"id\": 23, \"username\": \"geekbob123\", \"karma\": 15369, \"date-created\": \"04/21/2014\"}"}
 */
*/
