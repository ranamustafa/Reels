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
    
//    func parseError(error: UnprocessableErrors) -> String {
//        var str = ""
//
//        if let temp = error.email{
//            if temp.count != 0{
//                str.append(temp[0])
//                str.append("\n")
//
//            }
//        }
//        if let temp = error.customerID{
//            if temp.count != 0{
//                str.append(temp[0])
//                str.append("\n")
//
//            }
//        }
//        return str
//    }
    
    
    //MARK: - read notification
    func readNotifications( messageID: String, completion: @escaping (_ readNotificationStatus: ReadNotification?, _ error: String?) -> Void) {
//        let url = Endpoints.readNotification(messageId: messageID).value
//        let params: [String: String] = ["_method": "PATCH"]
//        let token = UserSavedData.shared.getUserToken()
        let headers: HTTPHeaders = ["Authorization": "Bearer \(token)"]
        print("url in read notifications : \(url)")
        print("parameters in read Notifications:  \(params)")
        print("headers in read Notifications:  \(headers)")

        AF.request(url, method: .post, parameters: params ,encoding: URLEncoding.default, headers: headers).responseDecodable(of: ReadNotification.self) { (response:AFDataResponse) in
            switch(response.result) {
            case .success(let readNotification):
                print(readNotification)
                let temp = response.response?.statusCode ?? 400
                if temp == 200{
                    do {
                        let readNotification = try JSONDecoder().decode(ReadNotification.self, from: response.data!)
                        completion(readNotification, nil)
                    }catch{
                        print(error)
                    }
                }else if temp == 500{
                    do {
                        print("error login temp 500 ")
                        let error = try JSONDecoder().decode(ServerErrorModel.self, from: response.data!)
                        completion(nil, error.errors?.errorCodes?.first)
                    }catch{
                        print(error)
                    }
                    
                }else if temp == 401{
                    print("error 401 ")
                    do {
                        let error = try JSONDecoder().decode(ForbiddenServerError.self, from: response.data!)
                        completion(nil, error.message ?? "")
                    }catch{
                        print(error)
                    }
                }
            case .failure(let error):
                completion(nil, error.localizedDescription)
                break
            }
        }
    }
  
}
//MARK: - End Points
enum Endpoints {
    case playlist(id: Int)
  
    
    var value: String {
        let baseUrl = "https://www.googleapis.com/youtube/v3/"
        switch  self {
        case .playlist(let id):
            return baseUrl + ""
       
        }
    }
}
