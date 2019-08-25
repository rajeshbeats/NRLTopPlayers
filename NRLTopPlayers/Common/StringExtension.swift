//
//  StringExtension.swift
//  NRLTopPlayers
//
//  Created by Ramachandrakurup, Rajesh on 24/8/19.
//  Copyright © 2019 My Company. All rights reserved.
//

import UIKit
extension String {

	/// Size of string for given font
	///
	/// - Parameter font: UIFont
	/// - Returns: CGSize
	func sizeOfDynamicFont(font: UIFont) -> CGSize {
		return self.size(withAttributes: [NSAttributedString.Key.font: font])
	}

	/// Formatted display text for given text, by replacing underscore and captilized
	var displayFormat: String {
		return replacingOccurrences(of: "_", with: " ").capitalized
	}
}
