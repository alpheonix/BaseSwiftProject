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
