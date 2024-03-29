//
//  LogInViewController.swift
//  Flash Chat
//
//  This is the view controller where users login


import UIKit
import Firebase
import SVProgressHUD

class LogInViewController: UIViewController {

    //Textfields pre-linked with IBOutlets
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

   
    @IBAction func logInPressed(_ sender: AnyObject) {
        SVProgressHUD.show()
        
        Auth.auth().signIn(withEmail: emailTextfield.text!  , password: passwordTextfield.text!)
        { (user, error) in
            if error != nil {
                SVProgressHUD.dismiss()
                print (error)
                self.errorLabel.backgroundColor = UIColor.darkGray
                self.errorLabel.text = error?.localizedDescription
            }
            else{
                print("login successful")
                SVProgressHUD.dismiss()
                self.performSegue(withIdentifier:"goToChat", sender: self)
            }
        }
        //TODO: Log in the user
        
        
    }
    


    
}  
