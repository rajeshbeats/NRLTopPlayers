//
//  NetworkService.swift
//  NRLTopPlayers
//
//  Created by Ramachandrakurup, Rajesh on 24/8/19.
//  Copyright © 2019 My Company. All rights reserved.
//

import Foundation

protocol NetworkServiceProtocol {

	/// URLSession
	static var session: URLSession { get set }

	/// Fetch data from given URL
	///
	/// - Parameters:
	///   - url: URL
	///   - completion: (Data?, Error?) -> Void
	func fetchData(from url: URL, completion: @escaping (Data?, Error?) -> Void)
}

struct NetworkService: NetworkServiceProtocol {

	static var session = URLSession(configuration: URLSessionConfiguration.default)

	func fetchData(from url: URL, completion: @escaping (Data?, Error?) -> Void) {

		let urlRequest = URLRequest(url: url)
		let session = NetworkService.session

		session.dataTask(with: urlRequest) { data, _, error in

			completion(data, error)
			}.resume()
	}
}
