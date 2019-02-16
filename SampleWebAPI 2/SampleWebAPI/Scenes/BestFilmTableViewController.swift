//
//  BestFilmTableViewController.swift
//  SampleWebAPI
//
//  Created by Maxime ISTIN on 16/01/2019.
//  Copyright © 2019 Digipolitan. All rights reserved.
//

import UIKit

class BestFilmTableViewController: UIViewController {
    
    var movies: [BestMovies]!
    var session: Session!
    
    @IBOutlet var BestMovieTableView: UITableView!
    
    class func newInstance(movies: [BestMovies],session: Session) -> BestFilmTableViewController{
        let mlvc = BestFilmTableViewController()
        mlvc.movies = movies
        mlvc.session = session
        return mlvc
    }
    override func viewDidLoad() {
        
//        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
//        backgroundImage.image = UIImage(named: "Image")
//        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
//        self.view.insertSubview(backgroundImage, at: 0)
        
        super.viewDidLoad()
        self.BestMovieTableView.delegate = self
        self.BestMovieTableView.dataSource = self
        self.BestMovieTableView.register(UINib(nibName: "BestFilmTableViewCell", bundle: nil), forCellReuseIdentifier: BestFilmTableViewController.movieCellId)
        // Do any additional setup after loading the view.
    }
}

extension BestFilmTableViewController: UITableViewDelegate {
    
}

extension BestFilmTableViewController: UITableViewDataSource {
    
    public static let movieCellId = "BEST_CELL_IDENTIFIER"
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(self.movies[indexPath.row].id)
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = BestMovieTableView.dequeueReusableCell(withIdentifier: BestFilmTableViewController.movieCellId, for: indexPath) as! BestFilmTableViewCell
        let movie = self.movies[indexPath.row]
        
        cell.titleLabel.text = movie.title
        //cell.titleLabel.textColor = UIColor(displayP3Red: 255.0, green: 255.0, blue: 255.0, alpha: 1)
        
        cell.descriptionLabel.text =  movie.description
        //cell.descriptionLabel.textColor = UIColor(displayP3Red: 255.0, green: 255.0, blue: 255.0, alpha: 1)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        cell.releasedDateLabel.text = dateFormatter.string(from: movie.releaseDate)
        //cell.releasedDateLabel.textColor = UIColor(displayP3Red: 255.0, green: 255.0, blue: 255.0, alpha: 1)
        
        var url: String = "https://image.tmdb.org/t/p/w185//"
        url.append(movie.image)
        let imageURL = URL(string: url)
        let imageData = try! Data(contentsOf: imageURL!)
        cell.posterImageView.image = UIImage(data: imageData)
        
        return cell
    }
    
}
