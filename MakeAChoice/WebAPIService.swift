//
//  WebAPIService.swift
//  MakeAChoice
//
//  Created by Simranjit Kaur on 24/06/2016.
//  Copyright © 2016 Simranjit Kaur. All rights reserved.
//

import Foundation


enum APIServiceType {
    
    case GETRChoices
    case POSTUChoice
    case POSTFeedback
}

protocol APIServiceDelegate {
   // This method can be implemented by every view controller , where data is required to have access to response of webservice whether its error or json .As both are optional.
   // For WebAPI we can make direct call NSURLConnection or using Alamofire
   // func apiResponse(serviceType: APIServiceType , error:String? , json:JSON?)
}

class WebAPIService {

    var delegate:APIServiceDelegate?
    
    let endpoint = "https://api"
    
   
    
//    func recommendedChoices(){
//    
//        // GET request using
//        Alamofire.request(.GET,endpoint)
//            .validate()
//            .responseData { response in
//                
//                var error = response.result.error?.localizedDescription
//                if error != nil {
//                    if let data = response.data {
//                        error = String(data: data, encoding: NSUTF8StringEncoding)
//                    }
//                }
//                
//                var result: JSON?
//                if let value = response.result.value {
//                    result = JSON(data: value)
//                }
//                
//                if let delegate = self.delegate {
//                    //This can  be used by Viewcontroller or RCService to add data to Core data
//                    delegate.apiServiceResponse(.GETRChoices, error: error, json: result)
//                }
//        
//                
//    }
//    
//    
//    }


}