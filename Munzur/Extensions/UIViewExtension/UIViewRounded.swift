//
//  UIViewRounded.swift
//  Munzur
//
//  Created by Gaurav Tiwari on 07/10/18.
//  Copyright © 2018 CBIS Technologies. All rights reserved.
//

import UIKit

// MARK : - Corner Radius
extension UIView {
    enum Corners {
        case topLeft, topRight, bottomLeft, bottomRight, all
        
        var value: CACornerMask? {
            switch self {
            case .topLeft: return .layerMinXMinYCorner
            case .topRight: return .layerMaxXMinYCorner
            case .bottomLeft: return .layerMinXMaxYCorner
            case .bottomRight: return .layerMaxXMaxYCorner
            case .all: return nil
            }
        }
        
        var valueBelow11: UIRectCorner? {
            switch self {
            case .topLeft: return UIRectCorner.topLeft
            case .topRight: return UIRectCorner.topRight
            case .bottomLeft: return UIRectCorner.bottomLeft
            case .bottomRight: return UIRectCorner.bottomRight
            case .all: return nil
            }
        }
    }
    
    @available(iOS 11.0, *)
    private func setCornersForiOS11(_ corners: [Corners]) {
        let cornerSet = Set(corners)
        let cornersToBeMasked = Array(cornerSet).compactMap { $0.value }
        var cornerMask = CACornerMask()
        cornersToBeMasked.forEach { cornerMask.insert($0) }
        layer.maskedCorners = cornerMask
    }
    
    private func setCornersForBelowiOS11(_ corners: [Corners], _ radius: CGFloat) {
        let cornerSet = Set(corners)
        let cornersToBeMasked = Array(cornerSet).compactMap { $0.valueBelow11 }
        var final = UIRectCorner()
        cornersToBeMasked.forEach { final.insert($0) }
        
        let path = UIBezierPath(roundedRect: self.bounds,
                                byRoundingCorners: final,
                                cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func round(radius: CGFloat, corners: Corners...) {
        layer.cornerRadius = radius
        clipsToBounds = true
        if !corners.contains(.all) {
            if #available(iOS 11.0, *) {
                setCornersForiOS11(corners)
            } else {
                setCornersForBelowiOS11(corners, radius)
            }
        }
    }
}
