

import UIKit

class LoginViewController: UIViewController {
    var gradient: CAGradientLayer?
    var bgImage: UIImageView?
    let rect = CGRect(x: 100, y: 250, width: 180, height: 180)
        override func viewDidLoad() {
            navigationItem.title = "Flix"
            super.viewDidLoad()
            addGradient()
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
            guard let username = self.UserField.text,
            let pwd = self.PasswordField.text  else {
                    return
            }
            let token = connect.token
            
            ConnexionService.default.connect(token: token,username: username, pwd: pwd) { (session) in
                if session.account_id != 0 {
                    MovieService.default.getMovies { (movies) in
                        let next = NewMoviesListViewController.newInstance(movies: movies, session: session)
                        self.navigationController?.pushViewController(next, animated: true)
                    }
                }
                if (session.account_id == 0){
                    let alert = UIAlertController(title: "Errorr", message: "Le nom d'utilisateur ou le mot de passe est incorrect", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true)
                }
                return session
                
            }
            
            
           
        }
    }
    
    
    
    
    override func viewDidLayoutSubviews() {
        gradient?.frame = view.bounds
        let mainImage = UIImage(named:"logo")
        let mainImageView = UIImageView(image:mainImage)
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



