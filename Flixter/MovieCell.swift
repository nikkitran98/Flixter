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
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        synopsisLabel.numberOfLines = 0
        synopsisLabel.font = UIFont.systemFont(ofSize: 16)
        
        addSubview(posterView)
        addSubview(titleLabel)
        addSubview(synopsisLabel)
    }
    
    override func layoutSubviews() {
        posterView.frame = CGRectMake(10, 10, 60, 80)
        titleLabel.frame = CGRectMake(CGRectGetMaxX(posterView.frame) + 5, 10, 300, 16)
        synopsisLabel.frame = CGRectMake(CGRectGetMaxX(posterView.frame) + 5, CGRectGetMaxY(titleLabel.frame) + 5, 300, 75)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
