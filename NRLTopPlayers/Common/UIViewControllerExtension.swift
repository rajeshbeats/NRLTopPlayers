//
//  UIViewControllerExtension.swift
//  NRLTopPlayers
//
//  Created by Ramachandrakurup, Rajesh on 24/8/19.
//  Copyright © 2019 My Company. All rights reserved.
//

import UIKit

extension UIViewController {
	/// Show alert with given message
	///
	/// - Parameter message: String value
	func showErrorMessage(_ message: String) {
		let alert = UIAlertController(title: Constant.appName, message: message, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
		present(alert, animated: true)
	}
}

extension UIStoryboard {

	/// Viewcontroller for giving storyboard identifier
	///
	/// - Parameter identifier: String
	/// - Returns: Given viewController type T
	static func viewController<T>(with identifier: String) -> T {
		guard let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier) as? T else {
			fatalError("Viewcontroller not available")
		}
		return viewController
	}
}
