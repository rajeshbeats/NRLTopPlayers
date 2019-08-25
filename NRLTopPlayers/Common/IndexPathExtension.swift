//
//  IndexPathExtension.swift
//  NRLTopPlayers
//
//  Created by Ramachandrakurup, Rajesh on 24/8/19.
//  Copyright © 2019 My Company. All rights reserved.
//

import Foundation

extension IndexPath {

	var isLeft: Bool {
		return item % 2 == 0
	}
}
