import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let tab1 = MovieViewController()
        tab1.title = "Now Playing"
        
        let tab2 = ComingSoonViewController()
        tab2.title = "Coming Soon"
        
        let nav1 = UINavigationController(rootViewController: tab1)
        let nav2 = UINavigationController(rootViewController: tab2)
        
        nav1.tabBarItem = UITabBarItem(title: "Now Playing", image: UIImage(systemName: "play"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Coming Soon", image: UIImage(systemName: "eyes"), tag: 2)
        
        self.setViewControllers([nav1, nav2], animated: true)
    }

}
