//
//  SampleTableViewCell.swift
//  SampleTableView
//
//  Created by Rose on 7/8/18.
//  Copyright © 2018 User. All rights reserved.
//

import UIKit

class SampleTableViewCell: UITableViewCell {

    var titleLabel: UILabel!
    var descriptionLabel: UILabel!
    var sampleImageView : UIImageView!
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:)")
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let marginGuide = contentView.layoutMarginsGuide
        
        
        // configure titleLabel
        titleLabel = UILabel()
        contentView.addSubview(titleLabel)
        titleLabel.textColor = UIColor.black
        titleLabel.backgroundColor = UIColor.red
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        titleLabel.numberOfLines = 0

        // configure descriptionLabel
        descriptionLabel = UILabel()
        contentView.addSubview(descriptionLabel)
        descriptionLabel.backgroundColor = UIColor.gray
        descriptionLabel.textColor = UIColor.black
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont(name: "Avenir-Book", size: 12)
        descriptionLabel.textColor = UIColor.lightGray

        
        sampleImageView = UIImageView()
//        sampleImageView.frame = CGRect(x: bounds.width-imageSize - gap, y: gap, width: imageSize, height: imageSize)
        sampleImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(sampleImageView)
       
    }

}
