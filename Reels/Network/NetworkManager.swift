//
//  NetworkManager.swift
//  Reels
//
//  Created by Rana Mustafa on 06/08/2022.
//

import Foundation

import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    
    //MARK: - Fetch Playlist
    
    func fetchPlayList(completion: @escaping (_ product: PlaylistModelResponse?, _ error: String?) -> Void) {
        let url = Endpoints.playlist(apiKey: UserSavedData.shared.getAPIKey(), playlistID: "PLKrpEodZXM8iZWTA8C49aQOUS6YWnspcQ").value.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed) ?? ""
        let headers: HTTPHeaders = ["Accept": "application/json"]
        AF.request( url, method: .get, headers: headers).responseDecodable(of: PlaylistModelResponse.self) { response in
            switch response.result {
            case .success(let playlist):
                completion(playlist, nil)
            case .failure(let error):
                print("the error is \(error)")
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    
}
//MARK: - End Points
enum Endpoints {
    case playlist(apiKey: String, playlistID: String)
    
    var value: String {
        
        let baseUrl = "https://www.googleapis.com/youtube/v3/"
        switch  self {
        case .playlist( let APIkey,let playlistID):
            return baseUrl + "playlistItems?part=snippet&playlistId=\(playlistID)&key=\(APIkey)"
            
        }
    }
}
