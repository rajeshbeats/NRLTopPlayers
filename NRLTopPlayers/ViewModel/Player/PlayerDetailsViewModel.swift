//
//  PlayerDetailsViewModel.swift
//  NRLTopPlayers
//
//  Created by Ramachandrakurup, Rajesh on 24/8/19.
//  Copyright © 2019 My Company. All rights reserved.
//

import Foundation

/// Player deails view model protocols
protocol PlayerDetailsViewModelProtocol {

	/// Initialiser for PlayerDetailsViewModel
	///
	/// - Parameters:
	///   - dataSource: PlayerDetailsDataSourceProtocol
	///   - teamId: Int
	init(dataSource: PlayerDetailsDataSourceProtocol, teamId: Int)

	/// Data sournce of PlayerDetailsDataSourceProtocol
	var dataSource: PlayerDetailsDataSourceProtocol { get set }

	/// Team ID
	var teamId: Int { get set }

	/// Status for showing not available message
	var showStatsNotAvailable: Bool { get }

	/// Fetch player details
	///
	/// - Parameter completion: Error
	func fetchPlayerDetails(completion: @escaping (Error?) -> Void)

	/// NRLServiceProtocol instance
	var service: NRLServiceProtocol { get set }
}

class PlayerDetailsViewModel: PlayerDetailsViewModelProtocol {

	var service: NRLServiceProtocol = NRLService()
	var dataSource: PlayerDetailsDataSourceProtocol
	var teamId: Int

	/// Status of request processing
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
			// Convert stats into ordered array of keys
			guard let player = item, let statsKeys = player.lastMatchStats?.filter({$0.value != nil}).keys else {
				this.isRequestProcessing = false
				completion(AppError.notAvailable)
				return
			}
			// Update values in dataSource
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

	/// Foramtted status value with stats type
	///
	/// - Parameter key: String
	/// - Returns: Formatted text : String
	func formattedStatsValue(for key: String) -> String {
		guard let stats = lastMatchStats, let stasValue = stats[key] else {
			return ""
		}
		return "\(key.displayFormat) : \(stasValue ?? 0)"
	}
}
