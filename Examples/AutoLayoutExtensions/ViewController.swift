//
//  ViewController.swift
//  AutoLayoutExtensions
//
//  Created by Avesta Barzegar on 2022-04-02.
//

import UIKit
import AutoLayoutUI

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
        v2()
    }
    
    func config() {
        [label].forEach { view.addSubview($0) }
    }
    
    // Standard Autolayout
    func v1() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16.0),
            label.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16.0),
            label.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    // Inspired by: https://github.com/Wattpad/Schematic and SwiftUI's modifier pattern
    func v2() {
        let safeArea = view.safeAreaLayoutGuide
        
        label
            .verticallyCenter(in: safeArea)
            .alignLeading(to: safeArea, withOffset: 16.0)
            .alignTrailing(to: safeArea, withOffset: -16.0)
            .makeHeight(equalTo: 200)
        
        
    }


}

