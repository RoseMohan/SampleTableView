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
        cell.backgroundColor = UIColor.yellow
        let item = self.contentList[indexPath.row]
//        guard let item = self.contentList[indexPath.row] as? TableViewCellData else {
//            return UITableViewCell()
//        }
      
        cell.titleLabel.text = item.title as? String
        cell.descriptionLabel.text = item.description as? String
        print("item.title  ", item.description ?? String.self)
        return cell
    
    }
    
}

// MARK: - UITableViewDelegate

extension ContetViewModel: UITableViewDelegate {
    
    
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//
//    }
    
}


