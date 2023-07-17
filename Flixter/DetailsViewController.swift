//
//  DetailsViewController.swift
//  Flixter
//
//  Created by Nikki Tran on 7/17/23.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var titleLabel = UILabel()
    var synopsisLabel = UILabel()
    var posterView = UIImageView()
    var horizontalPosterView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = titleLabel.text
        view.backgroundColor = .white
        posterView.clipsToBounds = true
        posterView.contentMode = .scaleAspectFill
        horizontalPosterView.clipsToBounds = true
        horizontalPosterView.contentMode = .scaleAspectFill
        titleLabel.numberOfLines = 0
        synopsisLabel.numberOfLines = 0
        
        view.addSubview(titleLabel)
        view.addSubview(synopsisLabel)
        view.addSubview(horizontalPosterView)
        view.addSubview(posterView)
        
        configureUI()
    }
    
    func configureUI() {
        horizontalPosterView.frame = CGRect(x: 0, y: 100, width: self.view.bounds.width, height: 250)
        posterView.frame = CGRect(x: 25, y: 300, width: 80, height: 120)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.frame = CGRect(x: CGRectGetMaxX(posterView.frame) + 5, y: CGRectGetMaxY(horizontalPosterView.frame) + 5, width: 250, height: 16)
        synopsisLabel.font = UIFont.systemFont(ofSize: 14)
        synopsisLabel.frame = CGRect(x: CGRectGetMaxX(posterView.frame) + 5, y: CGRectGetMaxY(titleLabel.frame) - 5, width: 259, height: 200)
        view.layoutIfNeeded()
    }
}
