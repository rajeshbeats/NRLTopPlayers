//
//  URLMockProtocol.swift
//  NRLTopPlayersTests
//
//  Created by Ramachandrakurup, Rajesh on 25/8/19.
//  Copyright © 2019 My Company. All rights reserved.
//

import Foundation
/// Custom Error for Unit testcase URL Mock Protocol
struct URLError: LocalizedError {
	let errorDescription: String?
	static let dataError = URLError(errorDescription: "Data Error")
}

/// Mock Protocol for Unit testing
class URLMockProtocol: URLProtocol {

	/// Map data against provided urls.
	static var testURLs: [URL?: Data?] = [:]

	// Override method to inform that Custom protocol will handle all requests
	override class func canInit(with request: URLRequest) -> Bool {
		return true
	}

	// Ignore this method; just send back what we were given
	override class func canonicalRequest(for request: URLRequest) -> URLRequest {
		return request
	}

	override func startLoading() {
		if let url = request.url {
			// Check if provided url have a valid data available
			if let data = URLMockProtocol.testURLs[url], data != nil {
				client?.urlProtocol(self, didLoad: data!)
			} else {
				// Sent failure if data not present
				client?.urlProtocol(self, didFailWithError: URLError.dataError)
			}
		}
		client?.urlProtocolDidFinishLoading(self)
	}

	// this method is required to work Custom URLProtocol
	override func stopLoading() { }
}
