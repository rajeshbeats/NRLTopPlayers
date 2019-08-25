//
//  Utility.swift
//  NRLTopPlayersTests
//
//  Created by Ramachandrakurup, Rajesh on 25/8/19.
//  Copyright © 2019 My Company. All rights reserved.
//

import Foundation
@testable import NRLTopPlayers

func setupURLMockup() {
	URLCache.shared.removeAllCachedResponses()
	let config = URLSessionConfiguration.ephemeral
	config.protocolClasses = [URLMockProtocol.self]
	let session = URLSession(configuration: config)
	NetworkService.session = session
}
