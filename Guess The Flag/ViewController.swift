//
//  ViewController.swift
//  Guess The Flag
//
//  Created by Smit Patel on 11/11/24.
//

import UIKit

class ViewController: UIViewController {

    // Create buttons using a helper function
    let button1 = createButton(withImage: "us" , tag : 0)
    let button2 = createButton(withImage: "us" , tag : 1)
    let button3 = createButton(withImage: "us" , tag : 2)
    
    var countries = ["estonia" , "france" , "germany" , "ireland" , "italy" , "monaco" , "nigeria" , "poland" , "russia" , "uk" , "us" , "spain"]
    var score = 0
    var correctAns = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
        view.backgroundColor = .white
        askQuestions()
    }
    

    // Helper function to create buttons
    static func createButton(withImage imageName: String , tag : Int) -> UIButton {
        let button = UIButton()
        button.setImage(UIImage(named: imageName), for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = .scaleAspectFit
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.clipsToBounds = true // Ensures the image stays within the rounded corners
        //button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.tag = tag
        return button
    }
    
    func askQuestions(action : UIAlertAction! = nil){
        
        countries.shuffle()
        correctAns = Int.random(in: 0...2)
        
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        navigationItem.title = countries[correctAns].uppercased()
       
    

        
    }
    
    func setupButtons() {
        [button1, button2, button3].forEach {
            view.addSubview($0)
            $0.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            
        }
        
        NSLayoutConstraint.activate([
            button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button1.widthAnchor.constraint(equalToConstant: 200),
            button1.heightAnchor.constraint(equalToConstant: 100),
            button1.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            
            button2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button2.widthAnchor.constraint(equalToConstant: 200),
            button2.heightAnchor.constraint(equalToConstant: 100),
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 50),
            
            button3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button3.widthAnchor.constraint(equalToConstant: 200),
            button3.heightAnchor.constraint(equalToConstant: 100),
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 50)
        ])
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        var title : String
        
        if sender.tag == correctAns {
            title = "Correct"
            score += 1
        }
        else
        {
            title = "Wrong"
            score -= 1
        }
        
        // setting up alert view
        
        let ac = UIAlertController(title: title, message: "Your Score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default , handler: askQuestions ))
        
        present(ac , animated: true)
    }
}
