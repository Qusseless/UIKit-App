
import UIKit

class LoginViewController: UIViewController {

    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLable = UILabel()
    let greetingLabel = UILabel()
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }
    
    let bankeyLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }


}


extension LoginViewController {
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLable.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLable.textAlignment = .center
        errorMessageLable.textColor = .systemRed
        errorMessageLable.numberOfLines = 0
        errorMessageLable.text = "Error failure"
        errorMessageLable.isHidden = true
        
        bankeyLabel.translatesAutoresizingMaskIntoConstraints = false
        bankeyLabel.text = "Bankey"
        bankeyLabel.font = .boldSystemFont(ofSize: 35)
        bankeyLabel.textColor = .black
        
        greetingLabel.translatesAutoresizingMaskIntoConstraints = false
        greetingLabel.text = "Your premium source for all things banking!"
        greetingLabel.font = .systemFont(ofSize: 18)
        greetingLabel.textColor = .black
        greetingLabel.numberOfLines = 2
        greetingLabel.textAlignment = .center
        
    }
    
    private func layout() {
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLable)
        view.addSubview(bankeyLabel)
        view.addSubview(greetingLabel)
        
        
        //LoginView
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
                        
        ])
        
        //Button
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
            
        ])
        
        //ErrorLable
        NSLayoutConstraint.activate([
            errorMessageLable.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 3),
            errorMessageLable.leadingAnchor.constraint(equalTo: signInButton.leadingAnchor),
            errorMessageLable.trailingAnchor.constraint(equalTo: signInButton.trailingAnchor)
        ])
        
        //BankeyLabel
        NSLayoutConstraint.activate([
            bankeyLabel.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 5),
            bankeyLabel.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 30)
            
        ])
        
        //GreetingLabel
        NSLayoutConstraint.activate([
            greetingLabel.topAnchor.constraint(equalToSystemSpacingBelow: bankeyLabel.bottomAnchor, multiplier: 3),
            greetingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            greetingLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: loginView.leadingAnchor, multiplier: 5),
            loginView.trailingAnchor.constraint(equalToSystemSpacingAfter: greetingLabel.trailingAnchor, multiplier: 5)
        ])
        
    }
}


extension LoginViewController {
    
    @objc func signInTapped(sender: UIButton) {
        errorMessageLable.isHidden = true
        login()
    }
    private func login(){
        guard let username = username, let password = password else {
            assertionFailure("Usernmae / password should never be nil")
            return
        }
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "User / password connot be blank")
            return
        }
        if username == "Ilya" && password == "Welcome"{
            signInButton.configuration?.showsActivityIndicator = true
        } else {
            configureView(withMessage: "Incorrect username / password")
        }
    }
    private func configureView(withMessage message: String) {
        errorMessageLable.isHidden = false
        errorMessageLable.text = message
    }
}


