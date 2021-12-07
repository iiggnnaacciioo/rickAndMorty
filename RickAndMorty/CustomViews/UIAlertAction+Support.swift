//
//  UIAlertAction+Support.swift
//  RickAndMorty
//
//  Created by ignacio on 07-12-21.
//

import UIKit

extension UIAlertController {
    static func makeRetryAlert(title: String, message: String, parent: UIViewController, completion: @escaping()->()) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addRetryButtons(completion: completion)
        parent.present(alert, animated: true, completion: nil)
    }

    func addRetryButtons(completion: @escaping()->()) {
        let ok = UIAlertAction(title: "Retry", style: .default) { (action) -> Void in
            completion()
        }

        let cancel = UIAlertAction(title: "Cancel", style: .cancel)

        addAction(ok)
        addAction(cancel)
    }
}
