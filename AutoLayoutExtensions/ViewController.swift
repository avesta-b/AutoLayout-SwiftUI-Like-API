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

}

