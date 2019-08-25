//
//  NRLService.swift
//  NRLTopPlayers
//
//  Created by Ramachandrakurup, Rajesh on 24/8/19.
//  Copyright © 2019 My Company. All rights reserved.
//

import Foundation

/// NRL API service protocols
protocol NRLServiceProtocol {

	/// Network service for fetching NRL details
	var networkService: NetworkServiceProtocol { get set }
	/// Fetch  top player status for given match
	///
	/// - Parameters:
	///   - match: NRL match ID
	///   - completion: Array of match details - [MatchDetails]?
	/// - Returns: Void
	func fetchTopPlayerStats(match: String, completion: @escaping ([MatchDetails]?) -> Void)

	/// Fetch player details for given player id and team id
	///
	/// - Parameters:
	///   - playerId: Int
	///   - teamId: Int
	///   - completion: Player details Player?
	func fetchPlayerDetails(for playerId: Int, teamId: Int, completion: @escaping (Player?) -> Void)
}

struct NRLService: NRLServiceProtocol {

	var networkService: NetworkServiceProtocol = NetworkService()

	func fetchTopPlayerStats(match: String, completion: @escaping ([MatchDetails]?) -> Void ) {
		let url = Endpoint.topPlayers(match: match)
		processRequest(with: url, decodeType: [MatchDetails].self, completion: completion)
	}

	func fetchPlayerDetails(for playerId: Int, teamId: Int, completion: @escaping (Player?) -> Void ) {
		let url = Endpoint.playerDetails(team: teamId, player: playerId)
		processRequest(with: url, decodeType: Player.self, completion: completion)
	}

	/// A generci Method of fetching NRL API data
	///
	/// - Parameters:
	///   - url: URL Endpoint
	///   - decodeType: Output type
	///   - completion: Decoded out of given type - T?
	private func processRequest<T: Decodable>(with url: URL, decodeType: T.Type, completion: @escaping (T?) -> Void) {
		networkService.fetchData(from: url) { data, error in
			guard error == nil, let responesData = data else {
				completion(nil)
				return
			}
			let decodedData = try? JSONDecoder().decode(decodeType, from: responesData)
			completion(decodedData)
		}
	}
}
