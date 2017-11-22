//
//  ViewController.swift
//  CropQuest
//
//  Created by Joshua Kidd on 11/20/17.
//  Copyright © 2017 Joshua Kidd. All rights reserved.
//

import UIKit
import OAuth2
import Alamofire

class ViewController: UIViewController {
    
    var loader: OAuth2DataLoader?
    fileprivate var alamofireManager: SessionManager?
    
    @IBOutlet weak var signInBtn: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    // Setup OAuth configuration.
//    let oauth2 = OAuth2CodeGrant(settings: [
//        "client_id": "4bc0217f8c16c52f3eb59d9ff2393508aa060e3cc8adb9367908e7d4038f9478",
//        "client_secret": "ed9193161aebd1d0377d48f89f32ae635a6893dd09b474426c1c6446e1e02a27",
//        "authorize_uri": "https://reports.cropquest.net/oauth/authorize",
//        "token_uri": "https://reports.cropquest.net/oauth/token",
//        "redirect_uris": ["reportsoauth://connect/reports/callback"],
//        "secret_in_body": true,
//        "keychain": false,
//    ] as OAuth2JSON)
    
    // Action for authenticating with SafariView and getting user information.
    @IBAction func authenticate(_ sender: UIButton!) {
        
        ApiManager.shared.authenticate()
        
//        // Don't want it firing twice.
//        if oauth2.isAuthorizing {
//            oauth2.abortAuthorization()
//            return
//        }
//        
//        // URL to fetch user profile information and initial request for OAuth.
//        let reqUrl = URL(string: "https://reports.cropquest.net/api/v1/users/profile.json")!
//        let req = oauth2.request(forURL: reqUrl)
//        
//        // Setup the loader.
//        self.loader = OAuth2DataLoader(oauth2: oauth2)
//        
//        oauth2.logger = OAuth2DebugLogger(.debug)
//        // Configure authConfig settings.
//        oauth2.authConfig.authorizeEmbedded = true
//        oauth2.authConfig.authorizeContext = self
//        
//        sender?.setTitle("Authenticating...", for: UIControlState.normal)
//        
//        self.loader?.perform(request: req) { response in
//            do {
//                if self.oauth2.accessToken != nil {
//                    print("we got the token")
//                }
//            }
//        }
        
        
    }
    
//    func didGetUserData(dict: [String: Any], loader: OAuth2DataLoader?) {
//        DispatchQueue.main.async {
//            print(dict)
//            self.signInBtn?.isHidden = true
//        }
//    }
//    
//    func didCancelOrFail(_ error: Error?) {
//        DispatchQueue.main.async {
//            if let error = error {
//                print("Authorization went wrong: \(error)")
//            } else {
//                print("Dont forget to reset buttons")
//            }
//        }
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

