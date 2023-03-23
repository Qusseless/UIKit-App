

import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    let bankeyLabel = UILabel()
    let greetingBankey = UILabel()
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    
    var password: String? {
        return loginView.passwortdTextField.text
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }


}

extension LoginViewController {
    
    private func style(){
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
        
        bankeyLabel.translatesAutoresizingMaskIntoConstraints = false
        bankeyLabel.text = "Bankey"
        bankeyLabel.font = .boldSystemFont(ofSize: 40)
        bankeyLabel.textAlignment = .center
        bankeyLabel.textColor = .black
        
        greetingBankey.translatesAutoresizingMaskIntoConstraints = false
        greetingBankey.text = "Your premium source for all things banking!"
        greetingBankey.font = .systemFont(ofSize: 22)
        greetingBankey.textColor = .black
        greetingBankey.textAlignment = .center
        greetingBankey.numberOfLines = 2
    }
    
    private func layout(){
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        view.addSubview(bankeyLabel)
        view.addSubview(greetingBankey)
        
        //LoginView
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
        ])
        //SignInButton
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalToSystemSpacingAfter: loginView.leadingAnchor, multiplier: 2),
            loginView.trailingAnchor.constraint(equalToSystemSpacingAfter: signInButton.trailingAnchor, multiplier: 2)
        ])
        //ErrorMessageLabel
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: errorMessageLabel.trailingAnchor)
        ])
        //BankeyLable
        NSLayoutConstraint.activate([
            bankeyLabel.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 20),
            bankeyLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: loginView.leadingAnchor, multiplier: 1),
            loginView.trailingAnchor.constraint(equalToSystemSpacingAfter: bankeyLabel.trailingAnchor, multiplier: 1)
        ])
        //greetingBankey
        NSLayoutConstraint.activate([
            greetingBankey.topAnchor.constraint(equalToSystemSpacingBelow: bankeyLabel.bottomAnchor, multiplier: 6),
            greetingBankey.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: greetingBankey.trailingAnchor)
        ])
        
    }
    
    
}

extension LoginViewController{
    
    @objc func signInTapped(){
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("Username / password should never be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username / password cannot be blank")
            return
        }
        
        if username == "Kevin" && password == "Welcome"{
            signInButton.configuration?.showsActivityIndicator = true
        } else  {
            configureView(withMessage: "Incorrect username or password")
        }
        
    }
    private func configureView(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}
