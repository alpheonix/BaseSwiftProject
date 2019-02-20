//
//  AppleViewController.swift
//  SampleWebAPI
//
//  Created by Benoit BRIATTE on 10/12/2018.
//  Copyright © 2018 Digipolitan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
   
 
    var gradient: CAGradientLayer?

    let rect = CGRect(x: 100, y: 250, width: 180, height: 180)
    
    class func newInstance() -> HomeViewController{
        let home = HomeViewController( )
        return home
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGradient()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignInButton(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www.themoviedb.org/account/signup")! as URL, options: [:], completionHandler: nil)
        
    }
    
    @IBAction func connectToMovieAPI(_ sender: UIButton) {
        print("test")
        // TODO
        let next = LoginViewController.newInstance()
        self.navigationController?.pushViewController(next, animated: true)
        
    }
    
        
    
      override func viewDidLayoutSubviews() {
        
        gradient?.frame = view.bounds
        let mainImage = UIImage(named:"logo")
        var mainImageView = UIImageView(image:mainImage)
        mainImageView.center = self.view.center
        mainImageView.contentMode = .scaleAspectFit
        self.view.addSubview(mainImageView)

    }
    
    func addGradient() {
        gradient = CAGradientLayer()
        let startColor = UIColor(red: 0.0/255, green: 0.0/255, blue: 9.0/255, alpha: 1)
        let endColor = UIColor(red: 0, green: 0, blue: 1, alpha: 1)
        gradient?.colors = [startColor.cgColor,endColor.cgColor]
        gradient?.startPoint = CGPoint(x: 0, y: 0)
        gradient?.endPoint = CGPoint(x: 0, y:1)
        gradient?.frame = view.bounds
        self.view.layer.insertSublayer(gradient!, at: 0)
    }
    
}
