//
//  RegisterViewController.swift
//  Flash Chat
//
//  This is the View Controller which registers new users with Firebase
//

import UIKit
import FirebaseAuth
import SVProgressHUD

class RegisterViewController: UIViewController {

    
    //Pre-linked IBOutlets

    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

  
    @IBAction func registerPressed(_ sender: AnyObject) {
        SVProgressHUD.show()
        Auth.auth().createUser(withEmail: self.emailTextfield.text!, password: self.passwordTextfield.text!) {
            (user, error) in
            if error != nil {
                SVProgressHUD.dismiss()
                print (error)
                self.errorLabel.backgroundColor = UIColor.darkGray
                self.errorLabel.text = error?.localizedDescription
            }
            else {
                SVProgressHUD.dismiss()
                print ("Registration successful")
                self.performSegue(withIdentifier:"goToChat", sender: self)
            }
        }
        

        
        
    } 
    
    
}
