//
//  ContentViewModel.swift
//  SampleTableView
//
//  Created by Rose on 7/6/18.
//  Copyright © 2018 User. All rights reserved.
//

import Foundation
import UIKit

struct TableViewCellData {
    var title = ""
    var description = ""
    var imageHref: URL!
}
class ContetViewModel: NSObject {
    var isDataAvailable = false
    var contentList =  [TableViewCellData]()
    var imageList: [URL: UIImage?] = [URL: UIImage?]()
    var contentHeading = ""
    override init() {
        super.init()
        WebService().getContents() { contents in
            for row in contents.rows {
                var tableViewData = TableViewCellData()
                if let description = row.description as? String {
                    tableViewData.description = description
                }
                if let title = row.title as? String {
                    tableViewData.title = title
                }
                if let imageReference = row.imageHref as? String {
                    if let imgURL = URL(string: imageReference) {
                        tableViewData.imageHref = imgURL
                    }
                }
                self.contentList.append(tableViewData)
            }
            if let tableHeading = contents.title {
                self.contentHeading = tableHeading
           }
        }
        if (self.contentList.count > 0) {
            isDataAvailable = true
        }
    }

    func imageDatafromUrl(imageUrl : URL,fromIndexPath: Int,callback :@escaping (UIImage?) -> ()) {
        //imageList stores the already loaded images from the server
        if let imageData = imageList[imageUrl] {
            callback(imageData)
        } else {
            WebService().imageData(imageReferenceURL: imageUrl) { imgData in
                self.imageList.updateValue(imgData, forKey: imageUrl)
                callback(imgData)
            }
        }

    }
}



