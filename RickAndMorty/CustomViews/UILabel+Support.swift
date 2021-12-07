//
//  UILabel+Support.swift
//  RickAndMorty
//
//  Created by ignacio on 07-12-21.
//

import UIKit

extension UILabel {
    static func boldLabel(text: String, ofSize size: CGFloat) -> UILabel {
        let l = UILabel()
        l.font = UIFont.boldSystemFont(ofSize: size)
        l.text = text
        return l
    }
    
    static func label(text: String, ofSize size: CGFloat) -> UILabel {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: size)
        l.text = text
        return l
    }
}

