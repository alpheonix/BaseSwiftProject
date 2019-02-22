

import UIKit
import Alamofire
class NewMoviesListViewController: UIViewController,UISearchBarDelegate {

    var movies: [Movie]!
    var session: Session!
    
    @IBOutlet var searchBar: UISearchBar!
@IBOutlet var seachView: UITableView!
    
    @IBOutlet var movieTableView: UITableView!
    
    class func newInstance(movies: [Movie],session: Session) -> NewMoviesListViewController{
        let mlvc = NewMoviesListViewController()
        mlvc.movies = movies
        mlvc.session = session
        return mlvc
    }
    override func viewDidLoad() {
        navigationItem.title = "Flix"
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Image")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        searchBar.delegate = self
        self.searchBar.becomeFirstResponder()
        let searchBarBackgroundImage = UIImage()
        searchBar.setBackgroundImage(searchBarBackgroundImage, for: .any, barMetrics: .default)
        searchBar.scopeBarBackgroundImage = searchBarBackgroundImage
        super.viewDidLoad()
        self.movieTableView.delegate = self
        self.movieTableView.dataSource = self
        self.movieTableView.register(UINib(nibName: "NewMoviesListTableViewCell", bundle: nil), forCellReuseIdentifier: NewMoviesListViewController.movieCellId)
        self.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(disconnect)),
            UIBarButtonItem(title: "Liste Favoris", style: .plain, target: self, action: #selector(listFav))
        ]
    }
    @objc func disconnect(){
        ConnexionService.default.disconect(session_id: session.session_id) { (success) -> Bool in
            if(success){
                let home = HomeViewController.newInstance()
                self.navigationController?.pushViewController(home, animated: true)
            }
            return true
        }
    }
    
    @objc func listFav(){
        MovieService.default.getFav(session: session) { (movies) in
            let fav = NewMoviesListViewController.newInstance(movies: movies, session: self.session)
            self.navigationController?.pushViewController(fav, animated: true)
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let  text = searchBar.text!
        MovieService.default.search(text: text) { (res) in
                        let movie = NewMoviesListViewController.newInstance(movies: res, session: self.session)
                        self.navigationController?.pushViewController(movie, animated: true)
            
                    }
        
        
    }

}


extension NewMoviesListViewController: UITableViewDelegate {
    
}

extension NewMoviesListViewController: UITableViewDataSource {
    
    public static let movieCellId = "MOVIE_CELL_IDENTIFIER"
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        MovieService.default.getOneMovie(id:self.movies[indexPath.row].id) { (movie) in
                let detail = DetailMovieViewController.newInstance(movie: movie,session: self.session)
                self.navigationController?.pushViewController(detail, animated: true)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieTableView.dequeueReusableCell(withIdentifier: NewMoviesListViewController.movieCellId, for: indexPath) as! NewMoviesListTableViewCell
        let movie = self.movies[indexPath.row]
        cell.titleLabel.text = movie.title
        cell.titleLabel.textColor = UIColor(displayP3Red: 255.0, green: 255.0, blue: 255.0, alpha: 1)

        cell.descriptionLabel.text =  movie.description
        cell.descriptionLabel.textColor = UIColor(displayP3Red: 255.0, green: 255.0, blue: 255.0, alpha: 1)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        cell.releasedDateLabel.text = dateFormatter.string(from: movie.releaseDate)
        cell.releasedDateLabel.textColor = UIColor(displayP3Red: 255.0, green: 255.0, blue: 255.0, alpha: 1)
        
        var url: String = "https://image.tmdb.org/t/p/w185//"
        url.append(movie.image)
        let imageURL = URL(string: url)
        let imageData = try! Data(contentsOf: imageURL!)
        cell.posterImageView.image = UIImage(data: imageData)
        
        return cell
    }
    
}
