//
//  Content.swift
//  SampleTableView
//
//  Created by Rose on 7/6/18.
//  Copyright © 2018 User. All rights reserved.
//

import Foundation

class Content: NSObject {
    struct Row {
        var title:Any?
        var description:Any?
        var imageHref:Any?
    }
    var title:String?
    var rows:[Row] = [Row]()
    init?(dictionary :JSONDictionary)
    {
        if let title = dictionary["title"] as? String
        {
            self.title = title;
        }
        for row in dictionary["rows"] as! [AnyObject]
        {
           rows.append(Row(title: row["title"]!, description: row["description"]!, imageHref: row["imageHref"]!))
        }

    }
}


