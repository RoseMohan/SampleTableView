//
//  WebService.swift
//  SampleTableView
//
//  Created by Rose on 7/6/18.
//  Copyright © 2018 User. All rights reserved.
//

import Foundation
typealias JSONDictionary = [String:Any]

class WebService {
     let sourceURL = URL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json")!
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
        }

    }
    
}
