import UIKit
import SDWebImage

private let movieCellReuseIdentifier = "MovieCell"

class MovieViewController: UIViewController {
    
    private let tableView = UITableView()
    private let refreshControl = UIRefreshControl()
    private var movies = [Result]()

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchMovies()
        
        tableView.rowHeight = 100
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MovieCell.self, forCellReuseIdentifier: movieCellReuseIdentifier)
        tableView.insertSubview(refreshControl, at: 0)
        
        refreshControl.addTarget(self, action: #selector(fetchMovies), for: .valueChanged)
        
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        tableView.frame = self.view.bounds
    }
    
    // MARK: - Helpers
    @objc func fetchMovies() {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=67cef2a15373a95690491206f68a2f7d") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                var json: NowPlayingResponse?
                do {
                    json = try JSONDecoder().decode(NowPlayingResponse.self, from: data)
                } catch {
                    print(error)
                }
                
                guard let result = json else { return }
                
                //let dataDictionary = try! JSONSerialization.jsonObject(with: data) as! [String: Any]
                //self.movies = dataDictionary["results"] as! [[String: Any]]
                
                self.movies = result.results
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.refreshControl.endRefreshing()
                }
            }
        }.resume()
    }
}

extension MovieViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: movieCellReuseIdentifier) as! MovieCell
        let movie = movies[indexPath.row]
        let title = movie.title
        let overview = movie.overview
        let baseURLString = "https://image.tmdb.org/t/p/w500"
        let posterURLString = movie.poster_path
        let fullPosterString = baseURLString + posterURLString
        let url = URL(string: fullPosterString)
//        let movie = movies[indexPath.row]
//        let title = movie["title"] as! String
//        let overview = movie["overview"] as! String
//        let baseURLString = "https://image.tmdb.org/t/p/w500"
//        let posterURLString = movie["poster_path"] as! String
//        let fullPosterString = baseURLString + posterURLString
//        let url = URL(string: fullPosterString)
//
        cell.titleLabel.text = title
        cell.synopsisLabel.text = overview
        cell.posterView.sd_setImage(with: url)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        let title = movie.title
        let overview = movie.overview
        let baseURLString = "https://image.tmdb.org/t/p/w500"
        let posterURLString = movie.poster_path
        let fullPosterString = baseURLString + posterURLString
//        let movie = movies[indexPath.row]
//        let title = movie["title"] as! String
//        let overview = movie["overview"] as! String
//        let baseURLString = "https://image.tmdb.org/t/p/w500"
//        let posterURLString = movie["poster_path"] as! String
//        let fullPosterString = baseURLString + posterURLString
        guard let url = URL(string: fullPosterString) else { return }
        let controller = DetailsViewController(title: title, synopsis: overview, url: url)
//
        navigationController?.pushViewController(controller, animated: true)
    }
}
