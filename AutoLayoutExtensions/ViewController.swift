//
//  ViewController.swift
//  AutoLayoutExtensions
//
//  Created by Avesta Barzegar on 2022-04-02.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Hello there yall"
        label.backgroundColor = .blue
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Hello"
        config()
        
    }
    
    func config() {
        [label].forEach { view.addSubview($0) }
    }
    
    func v1() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16.0),
            label.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16.0),
            label.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func v2() {
        let safeArea = view.safeAreaLayoutGuide
        
        label
            .verticallyCenter(in: safeArea)
            .padLeading(in: safeArea, with: 16.0)
            .padTrailing(in: safeArea, with: 16.0)
            .makeHeight(equalTo: 200)
    }


}

