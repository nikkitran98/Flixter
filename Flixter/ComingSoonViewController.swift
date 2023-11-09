import UIKit

private let movieCellReuseIdentifier = "MovieCell"

class ComingSoonViewController: UIViewController {
    
    private let tableView = UITableView()
    private let refreshControl = UIRefreshControl()
    private var movies = [Result]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchMovies()
        
        refreshControl.addTarget(self, action: #selector(fetchMovies), for: .valueChanged)
        
        tableView.register(MovieCell.self, forCellReuseIdentifier: movieCellReuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 100
        tableView.insertSubview(refreshControl, at: 0)

        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        tableView.frame = self.view.bounds
    }
    
    @objc func fetchMovies() {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/upcoming?api_key=67cef2a15373a95690491206f68a2f7d") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
            } else if let data = data {
                var json: NowPlayingResponse?
                do {
                    json = try JSONDecoder().decode(NowPlayingResponse.self, from: data)
                } catch {
                    print(error)
                }
                guard let result = json else { return }
                self.movies = result.results
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.refreshControl.endRefreshing()
                }
            }
        }.resume()
    }
}

extension ComingSoonViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: movieCellReuseIdentifier) as! MovieCell
        let movie = movies[indexPath.row]
        let title = movie.title
        let synopsis = movie.overview
        let baseURLString = "https://image.tmdb.org/t/p/w500"
        let posterURLString = movie.poster_path
        let fullURLString = baseURLString + posterURLString
        let url = URL(string: fullURLString)
        
        cell.titleLabel.text = title
        cell.synopsisLabel.text = synopsis
        cell.posterView.sd_setImage(with: url)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        let title = movie.title
        let synopsis = movie.overview
        let baseURLString = "https://image.tmdb.org/t/p/w500"
        let posterURLString = movie.poster_path
        let fullURLString = baseURLString + posterURLString
        guard let url = URL(string: fullURLString) else { return }
        
        let controller = DetailsViewController(title: title, synopsis: synopsis, url: url)
        navigationController?.pushViewController(controller, animated: true)
    }
}
