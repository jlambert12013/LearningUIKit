//
//  ViewController.swift
//  TheParkBand
//
//  Created by Jim Lambert on 6/19/24.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

class TopViewController: UIViewController {
  let button = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    makeButton()
    view.backgroundColor = .systemBackground
    title = "First Screen"
    navigationController?.navigationBar.prefersLargeTitles = true
  }
  
  func makeButton() {
    view.addSubview(button)
    
    button.configuration = .filled()
    button.configuration?.baseBackgroundColor = .gray
    button.configuration?.title = "Sign In"

    button.addTarget(self, action: #selector(signIn), for: .touchUpInside)
    
    button.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      button.widthAnchor.constraint(equalToConstant: 200 ),
      button.heightAnchor.constraint(equalToConstant: 50)
    ])
  }
  
  @objc func goToNextScreen() {
    let nextScreen = SecondViewController()
    nextScreen.title = "Second Screen"
    navigationController?.pushViewController(nextScreen, animated: true)
  }
  
  @objc func signIn() {
    guard let clientID = FirebaseApp.app()?.options.clientID else { return }

    // Create Google Sign In configuration object.
    let config = GIDConfiguration(clientID: clientID)
    GIDSignIn.sharedInstance.configuration = config

    // Start the sign in flow!
    GIDSignIn.sharedInstance.signIn(withPresenting: self) { result, error in
      guard error == nil else {
       return
      }

      guard let user = result?.user,
        let idToken = user.idToken?.tokenString
      else {
        return
      }

      let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                     accessToken: user.accessToken.tokenString)

      print(credential)
    }
  }
}

