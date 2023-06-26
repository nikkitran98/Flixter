//
//  ViewController.swift
//  Flixter
//
//  Created by Nikki Tran on 6/6/23.
//

import UIKit

class MovieViewController: UIViewController {
    
    var tableView = UITableView()
    var movies = [[String: Any]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchMovies()
        configureTableView()
    }
    
    func fetchMovies() {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=67cef2a15373a95690491206f68a2f7d") else { return }
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                self.movies = dataDictionary["results"] as! [[String: Any]]
                self.tableView.reloadData()
            }
        }
        task.resume()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.rowHeight = 100
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.register(MovieCell.self, forCellReuseIdentifier: "MovieCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    


}

extension MovieViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        let movie = movies[indexPath.row]
        let title = movie["title"] as! String
        //let synopsis = movie["overview"] as! String
        
        cell.titleLabel.text = title
        //cell.synopsisLabel.text = synopsis
        
        
        return cell
    }
    
    
}

