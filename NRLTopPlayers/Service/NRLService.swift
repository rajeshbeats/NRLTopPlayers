//
//  NRLService.swift
//  NRLTopPlayers
//
//  Created by Ramachandrakurup, Rajesh on 24/8/19.
//  Copyright © 2019 My Company. All rights reserved.
//

import Foundation

enum StatType: String {
	case fantasyPoint
}

protocol NRLServiceProtocol {

	func fetchTopPlayerStats(match: String, completion: @escaping ([MatchDetails]?) -> Void)
	func fetchPlayerDetails(for playerId: Int, teamId: Int, completion: @escaping (Player?) -> Void)
}

struct NRLService: NRLServiceProtocol {

	var networkService: NetworkServiceProtocol = NetworkService()
	func fetchTopPlayerStats(match: String, completion: @escaping ([MatchDetails]?) -> Void ) {
		let url = Endpoint.topPlayers(match: match)
		networkService.fetchData(from: url) { data, error in
			guard error == nil, let matchData = data else {
				completion(nil)
				return
			}
			let details = try? JSONDecoder().decode([MatchDetails].self, from: matchData)
			completion(details)
		}
	}

	func fetchPlayerDetails(for playerId: Int, teamId: Int, completion: @escaping (Player?) -> Void ) {
		let url = Endpoint.playerDetails(team: teamId, player: playerId)
		networkService.fetchData(from: url) { data, error in
			guard error == nil, let matchData = data else {
				completion(nil)
				return
			}
			let player = try? JSONDecoder().decode(Player.self, from: matchData)
			completion(player)
		}

	}
}
