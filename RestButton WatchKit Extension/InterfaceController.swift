//
//  InterfaceController.swift
//  RestButton WatchKit Extension
//
//  Created by Sammy Yousif on 11/30/16.
//  Copyright © 2016 Sammy Yousif. All rights reserved.
//

import WatchKit
import Foundation
import UserNotifications
import Alamofire


class InterfaceController: WKInterfaceController {

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func handleAction(withIdentifier identifier: String?, for notification: UNNotification) {
        guard let identifier = identifier else {
            return
        }
        switch identifier {
        case "yesButtonAction":
            makeResponseGetRequest(choice: "yes")
        case "noButtonAction":
            makeResponseGetRequest(choice: "no")
        default:
            return
        }
    }
    
    func makeResponseGetRequest(choice: String) {
        let parameters: Parameters = ["choice": choice]
        Alamofire.request("https://requestb.in/1g3hk831", parameters: parameters).validate().responseData { response in
            switch response.result {
            case .success:
                print("Validation Successful")
            case .failure(let error):
                print(error)
            }
        }
    }

}
