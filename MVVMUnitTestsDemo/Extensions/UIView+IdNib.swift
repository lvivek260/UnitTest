//
//  UIView+IdNib.swift
//  LoginMVVMUnitText
//
//  Created by PHN MAC 1 on 27/05/24.
//

import UIKit

protocol IdNibProtocol{
    static var id: String { get }
    static var nib: UINib { get }
}

extension IdNibProtocol{
    static var id: String{
        return String(String(describing: self))
    }
    
    static var nib: UINib {
        return UINib(nibName: id, bundle: nil)
    }
}

extension UIView: IdNibProtocol {}
extension UIViewController : IdNibProtocol {}
