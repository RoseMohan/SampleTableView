//
//  UITableViewController+SampleTableViewController.swift
//  SampleTableView
//
//  Created by Rose on 7/19/18.
//  Copyright © 2018 User. All rights reserved.
//

import UIKit

extension SampleTableViewController: UITableViewDelegate,UITableViewDataSource {
    // MARK :- UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentViewModel.contentList.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = SampleTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "SampleTableViewCell")
        let item = contentViewModel.contentList[indexPath.row]
        cell.titleLabel.text = item.title
        if (item.imageHref != nil) {
            contentViewModel.imageDatafromUrl(imageUrl: item.imageHref, fromIndexPath: indexPath.row) { imageData in
                if (imageData != nil) {
                    DispatchQueue.main.async(execute: { () -> Void in
                        cell.sampleImageView.image = imageData
                    });
                } else {
                    DispatchQueue.main.async(execute: { () -> Void in
                        cell.sampleImageView.isHidden = true
                    });
                }
            }
        } else {
            cell.sampleImageView.isHidden = true
        }
        cell.descriptionLabel.text = item.description
        return cell
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return contentViewModel.contentHeading
    }

}



