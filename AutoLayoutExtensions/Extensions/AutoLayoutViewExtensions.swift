//
//  AutoLayoutViewExtensions.swift
//  AutoLayoutExtensions
//
//  Created by Avesta Barzegar on 2022-04-02.
//

import UIKit

// Protocol that bridges UILayoutGuide and UIView
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


extension UIView {
    
    enum ConstraintType {
        case leading
        case trailing
        case top
        case bottom
        case width
        case height
    }
    
    // MARK: - Center Constraints
    func makeCenter(in view: Anchorable) -> UIView {
        enableAutoLayout(for: [view, self])
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        return self
    }
    
    func horizontallyCenter(in view: Anchorable, with offset: CGFloat = 0) -> UIView {
        enableAutoLayout(for: [view, self])
        centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: offset).isActive = true
        return self
    }
    
    func verticallyCenter(in view: Anchorable, with offset: CGFloat = 0) -> UIView {
        enableAutoLayout(for: [view, self])
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: offset).isActive = true
        return self
    }
    
    // MARK: - Align to parentView
    func alignToEdges(of view: Anchorable, with padding: CGFloat = 0) -> UIView {
        enableAutoLayout(for: [view, self])
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding)
        ])
        
        return self
    }
    
    // MARK: - Padding Constraints (Leading, Trailing, Top, Bottom)
    func padLeading(in view: Anchorable, with padding: CGFloat = 0) -> UIView {
        enableAutoLayout(for: [view, self])
        leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding).isActive = true
        return self
    }
    
    func padTrailing(in view: Anchorable, with padding: CGFloat = 0) -> UIView {
        enableAutoLayout(for: [view, self])
        trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding).isActive = true
        return self
    }
    
    func padTop(in view: Anchorable, with padding: CGFloat = 0) -> UIView {
        enableAutoLayout(for: [view, self])
        topAnchor.constraint(equalTo: view.topAnchor, constant: padding).isActive = true
        return self
    }
    
    func padBottom(in view: Anchorable, with padding: CGFloat = 0) -> UIView {
        enableAutoLayout(for: [view, self])
        bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding).isActive = true
        return self
    }
    
    // MARK: - Size Constraints
    func makeWidth(equalTo width: CGFloat) -> UIView {
        enableAutoLayout()
        widthAnchor.constraint(equalToConstant: width).isActive = true
        return self
    }
    
    func makeHeight(equalTo height: CGFloat) -> UIView {
        enableAutoLayout()
        heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }
    
    func makeSize(equalTo size: CGSize) -> UIView {
        enableAutoLayout()
        widthAnchor.constraint(equalToConstant: size.width).isActive = true
        heightAnchor.constraint(equalToConstant: size.height).isActive = true
        return self
    }
    
    // MARK: - Match Constraints
    func match(constraint: ConstraintType, to view: Anchorable) -> UIView {
        enableAutoLayout(for: [view, self])
        switch constraint {
        case .leading:
            leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        case .trailing:
            trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        case .top:
            topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        case .bottom:
            bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        case .width:
            widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        case .height:
            heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        }
        
        return self
    }
}

extension UIView {
    
    fileprivate func enableAutoLayout(for views: [Anchorable] = [] ) {
        if views.count == 0 {
            self.translatesAutoresizingMaskIntoConstraints = false
            return
        }
        
        views
            .compactMap { $0 as? UIView }
            .forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
}
