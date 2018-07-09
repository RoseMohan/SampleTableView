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
    var title:Any?
    var description:Any?
    var imageHref:Any?
}
class ContetViewModel: NSObject
{
    public var isDataAvailable = false
    var contentList =  [TableViewCellData]()
    var contentHeading = ""
    override init() {
        super.init()
        WebService().getContents() { contents in
            for row in contents.rows {
                var tableViewData = TableViewCellData()
                tableViewData.description = row.description
                tableViewData.title = row.title
                tableViewData.imageHref = row.imageHref
                self.contentList.append(tableViewData)
            }
            self.contentHeading = contents.title!
        }
        if (self.contentList.count > 0)
        {
            isDataAvailable = true
        }
    }
}



// MARK: - UITableViewDataSource

extension ContetViewModel: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contentList.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = SampleTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "SampleTableViewCell")
        let item = self.contentList[indexPath.row]
        cell.titleLabel.text = item.title as? String
        if let imgURLString = (item.imageHref as? String)
        {
            if let imgURL = NSURL(string: imgURLString)
            {
                let request:NSURLRequest =  NSURLRequest(url: imgURL as URL)
                let config = URLSessionConfiguration.default
                let session = URLSession(configuration: config)
                let task = session.dataTask(with: request as URLRequest,    completionHandler: {(data, response, error) in
                    if error == nil {
                        DispatchQueue.main.async(execute: { () -> Void in
                            cell.sampleImageView.image = UIImage(data: data!)
                        })
                    }
                    else {
                        DispatchQueue.main.async(execute: { () -> Void in
                            cell.sampleImageView.isHidden = true
                        })
                    }
                });
                task.resume()
            }
            else{
                cell.sampleImageView.isHidden = true
            }
        }
        else{
             cell.sampleImageView.isHidden = true
        }
        cell.descriptionLabel.text = item.description as? String
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension ContetViewModel: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.contentHeading
    }
    
}


