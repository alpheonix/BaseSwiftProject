//
//  LoginViewController.swift
//  SampleWebAPI
//
//  Created by Arthur BLANC on 02/02/2019.
//  Copyright © 2019 Digipolitan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var gradient: CAGradientLayer?
    var bgImage: UIImageView?
    let rect = CGRect(x: 100, y: 250, width: 180, height: 180)
        override func viewDidLoad() {
            super.viewDidLoad()
            addGradient()
    
    
        }

   
        
        // Do any additional setup after loading the view.
    
    
  
    
    class func newInstance() -> LoginViewController {
        let mlvc = LoginViewController()
        return mlvc
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // Do any additional setup after loading the view.
    @IBOutlet weak var UserField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    
    @IBAction func ConnectButton(_ sender: UIButton) {
        ConnexionService.default.getToken { (connect) in
            print(connect.token)
            guard let username = self.UserField.text,
            let pwd = self.PasswordField.text  else {
                    return
            }
            let token = connect.token
            
            ConnexionService.default.connect(token: token,username: username, pwd: pwd){ (result) in
                print(result)
                if result {
                    MovieService.default.getMovies { (movies) in
            let next = NewMoviesListViewController.newInstance(movies: movies)
            self.navigationController?.pushViewController(next, animated: true)
                    }
                    //let next = MovieListViewController.newInstance()
                    //self.navigationController?.pushViewController(next, animated: true)
                }
                return false
            }
            
            
           
        }
    }
    override func viewDidLayoutSubviews() {
        gradient?.frame = view.bounds
    }
    func addGradient() {
        gradient = CAGradientLayer()
        let startColor = UIColor(red: 220.0/255, green: 6.0/255, blue: 190.0/255, alpha: 1)
        let endColor = UIColor(red: 0, green: 0, blue: 1, alpha: 1)
        gradient?.colors = [startColor.cgColor,endColor.cgColor]
        gradient?.startPoint = CGPoint(x: 0, y: 0)
        gradient?.endPoint = CGPoint(x: 0, y:1)
        gradient?.frame = view.bounds
        self.view.layer.insertSublayer(gradient!, at: 0)
    }
}



