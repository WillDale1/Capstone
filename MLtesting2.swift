//
//  MLtesting2.swift
//  Amplifytest
//
//  Created by Jennifer Patino on 3/31/22.
//

import Foundation
import UIKit



func initializeLambda() {

      /*  let credentialsProvider = AWSStaticCredentialsProvider.init(accessKey:Constants.AWS_ACCESS_KEY_ID, secretKey: Constants.AWS_SECRET_ACCESS_KEY_ID)
        let defaultServiceConfiguration = AWSServiceConfiguration(region: Constants.AWS_REGION, credentialsProvider: credentialsProvider)
        AWSServiceManager.defaultServiceManager().defaultServiceConfiguration = defaultServiceConfiguration*/
    }

struct AccountLogIn: Decodable {
    var accountDetails:[AccountInformation]
}

struct AccountInformation: Decodable {
    var id: String
}

struct MusicAudio: Decodable {
    
}

struct MusicInfo: Decodable {
    
}
