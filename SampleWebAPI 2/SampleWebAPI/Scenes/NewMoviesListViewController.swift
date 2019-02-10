//
//  NewMoviesListViewController.swift
//  SampleWebAPI
//
//  Created by Maxime ISTIN on 16/01/2019.
//  Copyright © 2019 Digipolitan. All rights reserved.
//

import UIKit

class NewMoviesListViewController: UIViewController {

    var movies: [Movie]!
    
    @IBOutlet var movieTableView: UITableView!
    
    class func newInstance(movies: [Movie]) -> NewMoviesListViewController{
        let mlvc = NewMoviesListViewController()
        mlvc.movies = movies
        return mlvc
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.movieTableView.delegate = self
        self.movieTableView.dataSource = self
        self.movieTableView.register(UINib(nibName: "NewMoviesListTableViewCell", bundle: nil), forCellReuseIdentifier: NewMoviesListViewController.movieCellId)
        // Do any additional setup after loading the view.
    }
}

extension NewMoviesListViewController: UITableViewDelegate {
    
}

extension NewMoviesListViewController: UITableViewDataSource {
    
    public static let movieCellId = "MOVIE_CELL_IDENTIFIER"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieTableView.dequeueReusableCell(withIdentifier: NewMoviesListViewController.movieCellId, for: indexPath) as! NewMoviesListTableViewCell
        let movie = self.movies[indexPath.row]
        cell.titleLabel.text = movie.title
        cell.descriptionLabel.text =  movie.description
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        cell.releasedDateLabel.text = dateFormatter.string(from: movie.releaseDate)
        
        var url: String = "https://image.tmdb.org/t/p/w185//"
        url.append(movie.image)
        let imageURL = URL(string: url)
        let imageData = try! Data(contentsOf: imageURL!)
        cell.posterImageView.image = UIImage(data: imageData)
        
        return cell
    }
    
}
