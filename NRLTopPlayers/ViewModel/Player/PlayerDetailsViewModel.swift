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
	func fetchPlayerDetails(completion: @escaping (Error?) -> Void)
}

class PlayerDetailsViewModel: PlayerDetailsViewModelProtocol {

	var service: NRLServiceProtocol = NRLService()
	var dataSource: PlayerDetailsDataSourceProtocol
	var teamId: Int

	required init(dataSource: PlayerDetailsDataSourceProtocol, teamId: Int) {
		self.dataSource = dataSource
		self.teamId = teamId
	}

	func fetchPlayerDetails(completion: @escaping (Error?) -> Void) {

		let playerId = dataSource.player.playerId ?? 0
		service.fetchPlayerDetails(for: playerId, teamId: teamId) { [weak self] item in
			guard let this = self else {
				return
			}
			guard let player = item else {
				completion(AppError.notAvailable)
				return
			}
			this.dataSource.player = player
			completion(nil)
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
		return "\(key.displayFormat) : \(stasValue)"
	}
}
