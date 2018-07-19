//
//  WebService.swift
//  SampleTableView
//
//  Created by Rose on 7/6/18.
//  Copyright © 2018 User. All rights reserved.
//

import Foundation
import UIKit
typealias JSONDictionary = [String:Any]

class WebService {
    let sourceURL = URL(string: JsonData.URLSTRING)!
    
    func getContents(callback :@escaping (Content) -> ()) {
        
        var details:Content
        do {
            let datastring = try String.init(contentsOf: sourceURL, encoding: String.Encoding.isoLatin1)
            let data =  datastring.data(using: .utf8)
            let deserializedValues = try JSONSerialization.jsonObject(with: data!)
            let detailDictionary = deserializedValues as! JSONDictionary
            details = Content(dictionary: detailDictionary)!
            callback(details)
        }
        catch let error {
            // Error handling
            print(error.localizedDescription)
        }

    }

    func imageData(imageReferenceURL: URL,taskCallback: @escaping (UIImage?) -> ()) {
        let request:NSURLRequest =  NSURLRequest(url: imageReferenceURL)
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request as URLRequest,    completionHandler: {(data, response, error) -> Void  in
            if let responseData = data {
                    taskCallback(UIImage(data: responseData))
            }
        });
        task.resume()
        return;
    }
    
}
