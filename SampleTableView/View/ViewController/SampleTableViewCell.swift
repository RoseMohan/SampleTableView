//
//  SampleTableViewCell.swift
//  SampleTableView
//
//  Created by Rose on 7/8/18.
//  Copyright © 2018 User. All rights reserved.
//

import UIKit

class SampleTableViewCell: UITableViewCell {

    var titleLabel = UILabel()
    var descriptionLabel = UILabel()
    var sampleImageView = UIImageView()
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:)")
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        let marginGuide = contentView.layoutMarginsGuide

        // configure titleLabel
        contentView.addSubview(titleLabel)
        titleLabel.textColor = UIColor.white
        titleLabel.backgroundColor = UIColor.darkGray
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont (name: "HelveticaNeue-Bold", size: 16)


        // configure stackview
        sampleImageView.contentMode = .scaleAspectFit
        sampleImageView.translatesAutoresizingMaskIntoConstraints = false

        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

        let stackView =  UIStackView()
        contentView.addSubview(stackView)
        stackView.backgroundColor = UIColor.cyan
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(sampleImageView)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo:titleLabel.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
      
    }

}
