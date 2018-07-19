//
//  SampleTableViewController.swift
//  SampleTableView
//
//  Created by Rose on 7/4/18.
//  Copyright © 2018 User. All rights reserved.
//

import UIKit

class SampleTableViewController: UIViewController {

    var contentViewModel = ContetViewModel()
    let sampleTableView: UITableView = UITableView()
    var activityIndicator = UIActivityIndicatorView()

    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh(_:)), for: .valueChanged)
        refreshControl.tintColor = UIColor.black
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUPLoadingIndicator()
        if (contentViewModel.isDataAvailable) {
            self.setUpUITableView()
        }
        else {
            DispatchQueue.main.async(execute: { () -> Void in
                self.ShowError()
            })
        }
    }
    
    private func setUPLoadingIndicator() {
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activityIndicator.frame = CGRect(x: self.view.center.x, y: self.view.center.y, width: 46, height: 46)
        activityIndicator.center = self.view.center
        activityIndicator.startAnimating()
        activityIndicator.backgroundColor = UIColor.clear
        self.view.addSubview(activityIndicator)
        self.view.bringSubview(toFront: activityIndicator)
    }
    private func setUpUITableView() {
        self.view.addSubview(sampleTableView)

        sampleTableView.backgroundColor = UIColor.clear

        sampleTableView.translatesAutoresizingMaskIntoConstraints = false

        sampleTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        sampleTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        sampleTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        sampleTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true

        sampleTableView.dataSource = self
        sampleTableView.delegate = self

        sampleTableView.register(SampleTableViewCell.self, forCellReuseIdentifier: "SampleTableViewCell")
        sampleTableView.rowHeight = UITableViewAutomaticDimension
        sampleTableView.sectionHeaderHeight = 70
        sampleTableView.separatorStyle = .none
        if #available(iOS 10.0, *) {
            sampleTableView.refreshControl = refreshControl
        } else {
            // Fallback on earlier versions
            sampleTableView.addSubview(refreshControl)
        }
        activityIndicator.stopAnimating()
    }
    // MARK :- Handles Data Error
    private func ShowError() {
        activityIndicator.stopAnimating()
        let alert = UIAlertController(title: AlertData.ALERTTITLE ,
                                      message: AlertData.ALERTMESSAGE,
                                      preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: AlertData.ALERTOKMESSAGE,
                                      style: UIAlertActionStyle.default))
        
        UIApplication.shared.delegate?.window??.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    // MARK :- Handles refresh
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        contentViewModel = ContetViewModel()
        sampleTableView.dataSource = self
        sampleTableView.delegate = self
        sampleTableView.reloadData()
        refreshControl.endRefreshing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
