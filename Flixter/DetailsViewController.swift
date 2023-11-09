import UIKit
import SDWebImage

class DetailsViewController: UIViewController {
    
    private let titleLabel = UILabel()
    private let synopsisLabel = UILabel()
    private var posterView = UIImageView()
    private var horizontalPosterView = UIImageView()
    
    init(title: String, synopsis: String, url: URL) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
        titleLabel.text = title
        synopsisLabel.text = synopsis
        posterView.sd_setImage(with: url)
        horizontalPosterView.sd_setImage(with: url)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = titleLabel.text
        view.backgroundColor = .white
        
        posterView.clipsToBounds = true
        posterView.contentMode = .scaleAspectFill
        
        horizontalPosterView.clipsToBounds = true
        horizontalPosterView.contentMode = .scaleAspectFill
        
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        synopsisLabel.numberOfLines = 0
        synopsisLabel.font = UIFont.systemFont(ofSize: 14)
        
        view.addSubview(titleLabel)
        view.addSubview(synopsisLabel)
        view.addSubview(horizontalPosterView)
        view.addSubview(posterView)
        
    }
    
    override func viewDidLayoutSubviews() {
        horizontalPosterView.frame = CGRect(x: 0, y: 100, width: self.view.bounds.width, height: 250)
        posterView.frame = CGRect(x: 25, y: 300, width: 80, height: 120)
        titleLabel.frame = CGRect(x: CGRectGetMaxX(posterView.frame) + 5, y: CGRectGetMaxY(horizontalPosterView.frame) + 5, width: 250, height: 16)
        synopsisLabel.frame = CGRect(x: CGRectGetMaxX(posterView.frame) + 5, y: CGRectGetMaxY(titleLabel.frame) - 5, width: 259, height: 200)
    }
}
