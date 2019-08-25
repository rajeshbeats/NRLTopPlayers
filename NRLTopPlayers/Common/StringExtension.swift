//
//  StringExtension.swift
//  NRLTopPlayers
//
//  Created by Ramachandrakurup, Rajesh on 24/8/19.
//  Copyright © 2019 My Company. All rights reserved.
//

import UIKit
extension String {
	func sizeOfDynamicFont(font: UIFont) -> CGSize {
		return self.size(withAttributes: [NSAttributedString.Key.font: font])
	}

	var displayFormat: String {
		return replacingOccurrences(of: "_", with: " ").capitalized
	}
}
