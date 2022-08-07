//
//  UserSavedData.swift
//  Reels
//
//  Created by Rana Mustafa on 07/08/2022.
//

import Foundation

class UserSavedData {
    

    private init() {}
    
    static let shared = UserSavedData()

    func getAPIKey()-> String {
        return "AIzaSyB-ExAP9Adt9iavCKhVxakVlYsaUGHbU2U"
    }
    func getClientID()-> String {
     return "56956782821-r4tsee7e80ji8n1bqkeuco8mpavrb643.apps.googleusercontent.com"
    }
 
}

