//
//  LoginViewController.swift
//  Instagram
//
//  Created by Hanna Guest on 12/27/20.
//

import UIKit
import SafariServices

class LoginViewController: UIViewController {
    
    struct Constants {
        static let cornerRadius: CGFloat = 8.0
    }

    private let usernameEmailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Username or Email..."
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0)) // buffer on the left side of the text field so that the text doesn't flush with the actual frame
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true //sublayers are clipped to the layer’s bounds
        field.layer.cornerRadius = Constants.cornerRadius // corner radious
        field.backgroundColor = .secondarySystemBackground
//        field.layer.borderWidth = 1.0
//        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.placeholder = "Password..."
        field.isSecureTextEntry = true
        field.returnKeyType = .continue
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
//        field.layer.borderWidth = 1.0
//        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal) // .label color is adapt to light/dark mode
        button.setTitle("New User? Create an Account", for: .normal)
        return button
    }()
        
    private let termsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Term of Services", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    private let privacyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Privacy Policy", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    private let headerView: UIView = {
        let header = UIView()
        header.clipsToBounds = true
        let backgroundImageView = UIImageView(image: UIImage(named: "gradient"))
        header.addSubview(backgroundImageView)
        return header
    }()
    
    // Connect UI/Buttons to functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        addSubviews()
        
        usernameEmailField.delegate = self
        passwordField.delegate = self
        
        loginButton.addTarget(
            self,
            action: #selector(didTapLoginButton),
            for: .touchUpInside // .touchUpInside = basic tap
        )
        createAccountButton.addTarget(
            self,
            action: #selector(didTapCreateAccountButton),
            for: .touchUpInside
        )
        termsButton.addTarget(
            self,
            action: #selector(didTapTermsButton),
            for: .touchUpInside
        )
        privacyButton.addTarget(
            self,
            action: #selector(didTapPrivacyButton),
            for: .touchUpInside
        )
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Assign frames
        headerView.frame = CGRect(x: 0,
                                  y: 0,
                                  width: view.width,
                                  height: view.height / 3.0)
        
        usernameEmailField.frame = CGRect(x: 25,
                                          y: headerView.bottom + 10,
                                          width: view.width - 50,
                                          height: 52.0)
        
        passwordField.frame = CGRect(x: 25,
                                     y: usernameEmailField.bottom + 10,
                                     width: view.width - 50,
                                     height: 52.0)
        
        loginButton.frame = CGRect(x: 25,
                                   y: passwordField.bottom + 10,
                                   width: view.width - 50,
                                   height: 52.0)
        
        createAccountButton.frame = CGRect(x: 25,
                                           y: loginButton.bottom + 10,
                                           width: view.width - 50,
                                           height: 52.0)
        
        termsButton.frame = CGRect(
            x: 10,
            y: view.height - view.safeAreaInsets.bottom - 100,
            width: view.width - 20,
            height: 50
        )
        privacyButton.frame = CGRect(
            x: 10,
            y: view.height - view.safeAreaInsets.bottom - 50,
            width: view.width - 20,
            height: 50
        )
        configureHeaderView()
    }
    
    private func addSubviews() {
        view.addSubview(usernameEmailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(createAccountButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(headerView)
    }
    
    private func configureHeaderView() {
        guard headerView.subviews.count == 1 else {
            return
        }
        
        guard let backgroundView = headerView.subviews.first else {
            return
        }
        
        backgroundView.frame = headerView.bounds
        
        // Add Instagram logo
        let imageView = UIImageView(image: UIImage(named: "logo_text_white"))
        headerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: headerView.width/4.0,
                                 y: view.safeAreaInsets.top,
                                 width: headerView.width/2.0,
                                 height: headerView.height - view.safeAreaInsets.top)
    }
    
    @objc private func didTapLoginButton() {
        usernameEmailField.resignFirstResponder() // dismiss keyboard
        passwordField.resignFirstResponder()
        
        // Check that we have text
//        guard let usernameEmail == usernameEmailField.text, !usernameEmail.isEmpty, let password == passwordField.text, !password.isEmpty, password.count >= 8 else {
//            return
//        }
        
        // Log in functionality
        
        
    }
    
    @objc private func didTapTermsButton() {
        guard let url = URL(string: "https://www.facebook.com/help/instagram/termsofuse") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    @objc private func didTapPrivacyButton() {
        guard let url = URL(string: "https://help.instagram.com/519522125107875") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    @objc private func didTapCreateAccountButton() {
        let vc = RegistrationViewController()
        present(vc, animated: true)
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameEmailField {
            passwordField.becomeFirstResponder() // when user hits return from usernameEmailField, we want password field to be focused - keyboard pops up
            
        }
        else if textField == passwordField {
            didTapLoginButton()
        }
        return true
    }
}