//
//  MovieCellTableViewCell.swift
//  Flixter
//
//  Created by Nikki Tran on 6/6/23.
//

import UIKit
import CoreGraphics

class MovieCell: UITableViewCell {
    
    var posterView = UIImageView()
    var titleLabel = UILabel()
    //var synopsisLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        posterView.clipsToBounds = true
        titleLabel.numberOfLines = 0
        //synopsisLabel.numberOfLines = 0
        
        addSubview(titleLabel)
        //addSubview(synopsisLabel)
        addSubview(posterView)
        
        configurePosterView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configurePosterView() {
        posterView.frame = CGRect(x: 10, y: 10, width: 20, height: 100)
        titleLabel.font = UIFont.systemFont(ofSize: 12)
        titleLabel.frame = CGRect(x: 10, y: 10, width: 300, height: 40)
        //synopsisLabel.frame = CGRect(x: posterView.frame.width + 10, y: 15, width: 20, height: 100)
        layoutIfNeeded()
    }
}
