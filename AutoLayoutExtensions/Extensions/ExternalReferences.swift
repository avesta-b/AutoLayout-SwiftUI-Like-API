//
//  ExternalReferences.swift
//  AutoLayoutExtensions
//
//  Created by Avesta Barzegar on 2022-04-02.
//

import UIKit

// Protocol that bridges UILayoutGuide and UIView
// Taken From: https://github.com/Wattpad/Schematic/blob/master/Schematic/Classes/Protocols/Anchorable.swift
public protocol Anchorable {
    var leadingAnchor: NSLayoutXAxisAnchor { get }
    var trailingAnchor: NSLayoutXAxisAnchor { get }
    var leftAnchor: NSLayoutXAxisAnchor { get }
    var rightAnchor: NSLayoutXAxisAnchor { get }
    var topAnchor: NSLayoutYAxisAnchor { get }
    var bottomAnchor: NSLayoutYAxisAnchor { get }
    var widthAnchor: NSLayoutDimension { get }
    var heightAnchor: NSLayoutDimension { get }
    var centerXAnchor: NSLayoutXAxisAnchor { get }
    var centerYAnchor: NSLayoutYAxisAnchor { get }
}

extension UIView: Anchorable {}
extension UILayoutGuide: Anchorable {}
