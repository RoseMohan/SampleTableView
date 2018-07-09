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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUPLoadingIndicator()
        self.setUpUITableView()

    }
    private func setUPLoadingIndicator()
    {
        var activityIndicator = UIActivityIndicatorView()
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activityIndicator.frame = CGRect(x: self.view.center.x, y: self.view.center.y, width: 46, height: 46)
        activityIndicator.center = self.view.center
        activityIndicator.startAnimating()
        activityIndicator.backgroundColor = UIColor.gray
        self.view.addSubview(activityIndicator)
        self.view.bringSubview(toFront: activityIndicator)
    }
    private func setUpUITableView()
    {
        let sampleTableView: UITableView = UITableView()
        sampleTableView.backgroundColor = UIColor.clear
        sampleTableView.frame = CGRect(x: 10, y: 10, width: UIScreen.main.bounds.width-20, height: UIScreen.main.bounds.height-20)
        sampleTableView.dataSource = contentViewModel
        sampleTableView.delegate = contentViewModel
        sampleTableView.register(SampleTableViewCell.self, forCellReuseIdentifier: "SampleTableViewCell")
        sampleTableView.estimatedRowHeight = 100
        sampleTableView.rowHeight = UITableViewAutomaticDimension
        sampleTableView.sectionHeaderHeight = 70
        sampleTableView.separatorStyle = .none
        self.view.addSubview(sampleTableView)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
