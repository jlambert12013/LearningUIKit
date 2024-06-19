//
//  ViewController.swift
//  TheParkBand
//
//  Created by Jim Lambert on 6/19/24.
//

import UIKit

class FirstScreen: UIViewController {
  
  let nextButton = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupButton()
  }
  
  func setupButton() {
    view.addSubview(nextButton)
    
    nextButton.configuration = .filled()
    nextButton.configuration?.baseBackgroundColor = .cyan
    nextButton.configuration?.title = "Next"
    nextButton.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      nextButton.widthAnchor.constraint(equalToConstant: 200 ),
      nextButton.heightAnchor.constraint(equalToConstant: 50)
    ])
  }
  
  
}

