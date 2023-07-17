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
    var synopsisLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        posterView.clipsToBounds = true
        posterView.contentMode = .scaleAspectFill
        titleLabel.numberOfLines = 0
        synopsisLabel.numberOfLines = 0
        
        addSubview(titleLabel)
        addSubview(synopsisLabel)
        addSubview(posterView)
        
        configurePosterView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configurePosterView() {
        posterView.frame = CGRect(x: 10, y: 10, width: 60, height: 80)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        titleLabel.frame = CGRect(x: CGRectGetMaxX(posterView.frame) + 5, y: 10, width: 300, height: 15)
        synopsisLabel.font = UIFont.systemFont(ofSize: 12)
        synopsisLabel.frame = CGRect(x: CGRectGetMaxX(posterView.frame) + 5, y: CGRectGetMaxY(titleLabel.frame) , width: 300, height: 75)
        layoutIfNeeded()
    }
}
