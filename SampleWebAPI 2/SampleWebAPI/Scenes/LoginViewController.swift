//
//  LoginViewController.swift
//  SampleWebAPI
//
//  Created by Arthur BLANC on 02/02/2019.
//  Copyright © 2019 Digipolitan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
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
                    let next = MovieListViewController.newInstance()
                    self.navigationController?.pushViewController(next, animated: true)
                }
                return false
            }
            
            
            //let next = MovieListViewController.newInstance(movies: movies)//transfer donnée
            //self.navigationController?.pushViewController(next, animated: true)// changement graphique
        }
    }
}


/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


