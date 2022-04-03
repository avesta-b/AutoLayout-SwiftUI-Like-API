//
//  AutoLayoutViewExtensions.swift
//  AutoLayoutExtensions
//
//  Created by Avesta Barzegar on 2022-04-02.
//

import UIKit

// MARK: - Enum ConstraintType
public extension UIView {
    enum ConstraintType {
        case leading
        case trailing
        case top
        case bottom
        case width
        case height
    }
}

// MARK: - Center Constraints
public extension UIView {
    
    /// Centers the view this function is called on in the view passed
    @discardableResult
    func makeCenter(in view: Anchorable) -> UIView {
        enableAutoLayout(for: [view, self])
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        return self
    }
    
    /// Horizontally the view this function is called on in the view passed with the offset provided
    @discardableResult
    func horizontallyCenter(in view: Anchorable, withOffset offset: CGFloat = 0) -> UIView {
        enableAutoLayout(for: [view, self])
        centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: offset).isActive = true
        return self
    }
    
    /// Vertically the view this function is called on in the view passed with the offset provided
    @discardableResult
    func verticallyCenter(in view: Anchorable, withOffset offset: CGFloat = 0) -> UIView {
        enableAutoLayout(for: [view, self])
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: offset).isActive = true
        return self
    }
    
}

// MARK: - Align to parentView
public extension UIView {
    
    /// Aligns the view this function is called on to the view passed with padding provided
    @discardableResult
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

}

// MARK: - Padding Constraints (Leading, Trailing, Top, Bottom)
public extension UIView {
    
    /// Aligns the view this function is called on's leading to the view passed with offset provided
    @discardableResult
    func alignLeading(to view: Anchorable, withOffset offset: CGFloat = 0) -> UIView {
        enableAutoLayout(for: [view, self])
        leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: offset).isActive = true
        return self
    }
    
    /// Aligns the view this function is called on's trailing to the view passed with offset provided
    @discardableResult
    func alignTrailing(to view: Anchorable, withOffset offset: CGFloat = 0) -> UIView {
        enableAutoLayout(for: [view, self])
        trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: offset).isActive = true
        return self
    }
    
    /// Aligns the view this function is called on's top to the view passed with offset provided
    @discardableResult
    func alignTop(to view: Anchorable, withOffset offset: CGFloat = 0) -> UIView {
        enableAutoLayout(for: [view, self])
        topAnchor.constraint(equalTo: view.topAnchor, constant: offset).isActive = true
        return self
    }
    
    /// Aligns the view this function is called on's bottom to the view passed with offset provided
    @discardableResult
    func alignBottom(to view: Anchorable, withOffset offset: CGFloat = 0) -> UIView {
        enableAutoLayout(for: [view, self])
        bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: offset).isActive = true
        return self
    }
    
}

// MARK: - Size Constraints
public extension UIView {
    
    /// Makes the view this function is called on the specified width
    @discardableResult
    func makeWidth(equalTo width: CGFloat) -> UIView {
        enableAutoLayout()
        widthAnchor.constraint(equalToConstant: width).isActive = true
        return self
    }
    
    /// Makes the view this function is called on the specified height
    @discardableResult
    func makeHeight(equalTo height: CGFloat) -> UIView {
        enableAutoLayout()
        heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }
    
    /// Makes the view this function is called on the specified size
    @discardableResult
    func makeSize(equalTo size: CGSize) -> UIView {
        enableAutoLayout()
        widthAnchor.constraint(equalToConstant: size.width).isActive = true
        heightAnchor.constraint(equalToConstant: size.height).isActive = true
        return self
    }
    
}
    
// MARK: - Match Constraints
public extension UIView {
    
    /// Makes the view this function's called match the constraint for another view for the specified constraint type
    @discardableResult
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
