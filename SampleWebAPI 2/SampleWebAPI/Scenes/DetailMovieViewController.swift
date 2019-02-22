//
//  DetailMovieViewController.swift
//  SampleWebAPI
//
//  Created by Arthur BLANC on 06/02/2019.
//  Copyright © 2019 Digipolitan. All rights reserved.
//

import UIKit

class DetailMovieViewController: UIViewController {
    
    @IBOutlet weak var movieTittleLabel: UILabel!
    @IBOutlet weak var ImageMovieDetail: UIImageView!
    
    @IBOutlet weak var RateMovie: UILabel!
    
    @IBOutlet weak var descriptionMovieDetail: UITextView!
    @IBOutlet weak var movieDateLabel: UILabel!
    
    public var movie: DetailMovie!
    var session: Session!
    
    
    @objc func addFavourite() {
        MovieService.default.addAsFavourite(id: movie.id,session: session) { (res) in
            if res {
                let alert = UIAlertController(title: "Favoris", message: "Le film a été ajouté a la liste des favoris", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
            print("fin")
        }
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
    override func viewDidLoad() {
        navigationItem.title = "Flix"
        descriptionMovieDetail.backgroundColor = UIColor.clear
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Image")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        self.descriptionMovieDetail.text = self.movie.description
        self.descriptionMovieDetail.textColor = UIColor(displayP3Red: 255.0, green: 255.0, blue: 255.0, alpha: 1)
        print(self.movie.titre)
        self.movieDateLabel.text = self.movie.release_date
        self.movieDateLabel.textColor = UIColor(displayP3Red: 255.0, green: 255.0, blue: 255.0, alpha: 1)
        self.movieTittleLabel.text = self.movie.titre
        self.movieTittleLabel.textColor = UIColor(displayP3Red: 255.0, green: 255.0, blue: 255.0, alpha: 1)
        let imageURL = URL(string: self.movie.poster)
        let imageData = try! Data(contentsOf: imageURL!)
        self.ImageMovieDetail.image = UIImage(data: imageData)
        self.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(disconnect)),
            UIBarButtonItem(title: "Favoris", style: .plain, target: self, action: #selector(addFavourite))
        ]
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }
    class func newInstance(movie: DetailMovie,session: Session) -> DetailMovieViewController {
        let detail = DetailMovieViewController()
        detail.movie = movie
        detail.session = session
        return detail
        
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
}
