//
//  AutoLayoutViewExtensions.swift
//  AutoLayoutExtensions
//
//  Created by Avesta Barzegar on 2022-04-02.
//

import UIKit

// MARK: - Enum ConstraintType
extension UIView {
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
extension UIView {
    
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
    
}

// MARK: - Align to parentView
extension UIView {
    
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
extension UIView {
    
    func alignLeading(to view: Anchorable, withOffset offset: CGFloat = 0) -> UIView {
        enableAutoLayout(for: [view, self])
        leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: offset).isActive = true
        return self
    }
    
    func alignTrailing(to view: Anchorable, withOffset offset: CGFloat = 0) -> UIView {
        enableAutoLayout(for: [view, self])
        trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: offset).isActive = true
        return self
    }
    
    func alignTop(to view: Anchorable, withOffset offset: CGFloat = 0) -> UIView {
        enableAutoLayout(for: [view, self])
        topAnchor.constraint(equalTo: view.topAnchor, constant: offset).isActive = true
        return self
    }
    
    func alignBottom(to view: Anchorable, withOffset offset: CGFloat = 0) -> UIView {
        enableAutoLayout(for: [view, self])
        bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: offset).isActive = true
        return self
    }
    
}

// MARK: - Size Constraints
extension UIView {
    
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
    
}
    
// MARK: - Match Constraints
extension UIView {
    
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
