//
//  PlayerDetailsViewModel.swift
//  NRLTopPlayers
//
//  Created by Ramachandrakurup, Rajesh on 24/8/19.
//  Copyright © 2019 My Company. All rights reserved.
//

import Foundation
protocol PlayerDetailsViewModelProtocol {
	init(dataSource: PlayerDetailsDataSourceProtocol, teamId: Int)
	var dataSource: PlayerDetailsDataSourceProtocol { get set }
	var teamId: Int { get set }
	func fetchPlayerDetails(completion: @escaping (Player?) -> Void)
}

class PlayerDetailsViewModel: PlayerDetailsViewModelProtocol {

	var service: NRLServiceProtocol = NRLService()
	var dataSource: PlayerDetailsDataSourceProtocol
	var teamId: Int

	required init(dataSource: PlayerDetailsDataSourceProtocol, teamId: Int) {
		self.dataSource = dataSource
		self.teamId = teamId
	}

	func fetchPlayerDetails(completion: @escaping (Player?) -> Void) {

		let playerId = dataSource.player.playerId ?? 0
		service.fetchPlayerDetails(for: playerId, teamId: teamId) { [weak self] item in
			guard let this = self else {
				return
			}
			if let player = item {
				this.dataSource.player = player
			}
			completion(item)
		}
	}
}

extension Player {

	func displayStats(for indexPath: IndexPath) -> String {
		guard let stats = lastMatchStats else {
			return ""
		}
		let key = Array(stats.keys)[indexPath.item]
		guard let value = stats[key] else {
			return ""
		}
		let stasValue = String(value ?? 0)
		return "\(key.replacingOccurrences(of: "_", with: " ").capitalized) : \(stasValue)"
	}

}
