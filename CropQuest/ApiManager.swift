//
//  ApiManager.swift
//  CropQuest
//
//  Created by Joshua Kidd on 11/21/17.
//  Copyright © 2017 Joshua Kidd. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

class ApiManager {
    
    static let shared = ApiManager()
    
    var clientId: String = "4bc0217f8c16c52f3eb59d9ff2393508aa060e3cc8adb9367908e7d4038f9478"
    var clientSecret: String = "ed9193161aebd1d0377d48f89f32ae635a6893dd09b474426c1c6446e1e02a27"
    var redirectUri: String = "reportsoauth://connect/reports/callback"
    var authorizeUri: String = "https://reports.cropquest.net/oauth/authorize"
    var tokenUri: String = "https://reports.cropquest.net/oauth/token"
    
    func hasAccessToken() -> Bool {
        return false
    }
    
    func sessionManager() -> SessionManager {
        let sessionManager = SessionManager.default
        return sessionManager
    }
    
    func authenticate() {
        let path = "\(authorizeUri)?client_id=\(clientId)&response_type=code&redirect_uri=\(redirectUri)"
        let url = URL(string: path)!
        let defaults = UserDefaults.standard
        defaults.set(true, forKey: "loadingOAuthToken")
        UIApplication.shared.open(url)
    }
    
    func handleRedirect(url: URL) {
        let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        var code: String!
        
        if let queryItems = components?.queryItems {
            for queryItem in queryItems {
                if (queryItem.name.lowercased() == "code") {
                    code = queryItem.value
                    break
                }
            }
        }
        
        let params: Parameters = [
            "client_id": clientId,
            "client_secret": clientSecret,
            "code": code,
            "grant_type": "authorization_code",
            "redirect_uri": redirectUri
        ]
        
        // TODO: update to use SwiftyJSON when mac is updated and Xcode is updated and swift is updated to 4.0 on the Mini.
        Alamofire.request(tokenUri, method: .post, parameters: params, encoding: URLEncoding(destination: .queryString)).responseJSON { response in
            if let result = response.result.value {
                let json = result as! NSDictionary
                let token = json.value(forKey: "access_token")
                print(json)
                print(token!)
            }
        }
    }
    
}
