//
//  SampleTableViewController.swift
//  SampleTableView
//
//  Created by Rose on 7/4/18.
//  Copyright © 2018 User. All rights reserved.
//

import UIKit

class SampleTableViewController: UIViewController {

    private var contentViewModel = ContetViewModel()
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
        if (contentViewModel.isDataAvailable)
        {
            self.setUpUITableView()
        }
        else
        {
            DispatchQueue.main.async(execute: { () -> Void in
                self.ShowError()
            })
        }

    }
    private func setUPLoadingIndicator()
    {
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activityIndicator.frame = CGRect(x: self.view.center.x, y: self.view.center.y, width: 46, height: 46)
        activityIndicator.center = self.view.center
        activityIndicator.startAnimating()
        activityIndicator.backgroundColor = UIColor.clear
        self.view.addSubview(activityIndicator)
        self.view.bringSubview(toFront: activityIndicator)
    }
    private func setUpUITableView()
    {
        sampleTableView.backgroundColor = UIColor.clear
        sampleTableView.frame = CGRect(x: 10, y: 10, width: UIScreen.main.bounds.width-20, height: UIScreen.main.bounds.height-20)
        sampleTableView.dataSource = contentViewModel
        sampleTableView.delegate = contentViewModel
        sampleTableView.register(SampleTableViewCell.self, forCellReuseIdentifier: "SampleTableViewCell")
        sampleTableView.estimatedRowHeight = 100
        sampleTableView.rowHeight = UITableViewAutomaticDimension
        sampleTableView.sectionHeaderHeight = 70
        sampleTableView.separatorStyle = .none
        sampleTableView.refreshControl = refreshControl
        self.view.addSubview(sampleTableView)
        activityIndicator.stopAnimating()

    }
    private func ShowError()
    {
        activityIndicator.stopAnimating()
        let alert = UIAlertController(title: "Title",
                                      message: "No Data ",
                                      preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Ok",
                                      style: UIAlertActionStyle.default))
        
        UIApplication.shared.delegate?.window??.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    // MARK :- Handles refresh
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        contentViewModel = ContetViewModel()
        sampleTableView.dataSource = contentViewModel
        sampleTableView.delegate = contentViewModel
        sampleTableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
