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
    
    
    @IBOutlet weak var descriptionMovieDetail: UITextView!
    @IBOutlet weak var movieDateLabel: UILabel!
    
    public var movie: DetailMovie!
    
    
    override func viewDidLoad() {
        self.descriptionMovieDetail.text = self.movie.description
        print(self.movie.titre)
        self.movieDateLabel.text = self.movie.release_date
        self.movieTittleLabel.text = self.movie.titre
        let imageURL = URL(string: self.movie.poster)
        let imageData = try! Data(contentsOf: imageURL!)
        self.ImageMovieDetail.image = UIImage(data: imageData)
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }
    class func newInstance(movie: DetailMovie) -> DetailMovieViewController {
        let detail = DetailMovieViewController()
        detail.movie = movie
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
