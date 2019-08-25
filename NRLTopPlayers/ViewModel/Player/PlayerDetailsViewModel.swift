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
	var showStatsNotAvailable: Bool { get }
	func fetchPlayerDetails(completion: @escaping (Error?) -> Void)
}

class PlayerDetailsViewModel: PlayerDetailsViewModelProtocol {

	var service: NRLServiceProtocol = NRLService()
	var dataSource: PlayerDetailsDataSourceProtocol
	var teamId: Int
	var isRequestProcessing = false

	required init(dataSource: PlayerDetailsDataSourceProtocol, teamId: Int) {
		self.dataSource = dataSource
		self.teamId = teamId
	}

	func fetchPlayerDetails(completion: @escaping (Error?) -> Void) {

		isRequestProcessing = true
		let playerId = dataSource.player.playerId ?? 0
		service.fetchPlayerDetails(for: playerId, teamId: teamId) { [weak self] item in
			guard let this = self else {
				return
			}
			guard let player = item, let statsKeys = player.lastMatchStats?.filter({$0.value != nil}).keys else {
				this.isRequestProcessing = false
				completion(AppError.notAvailable)
				return
			}
			let stats = Array(statsKeys)
			this.dataSource.stats = stats
			this.dataSource.player = player
			this.isRequestProcessing = false
			completion(nil)
		}
	}

	var showStatsNotAvailable: Bool {
		return isRequestProcessing == false && dataSource.stats.count == 0
	}
}

extension Player {
	func displayStats(for key: String) -> String {
		guard let stats = lastMatchStats, let stasValue = stats[key] else {
			return ""
		}
		return "\(key.displayFormat) : \(stasValue ?? 0)"
	}
}
