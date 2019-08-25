//
//  HomeViewModel.swift
//  NRLTopPlayers
//
//  Created by Ramachandrakurup, Rajesh on 24/8/19.
//  Copyright © 2019 My Company. All rights reserved.
//

import Foundation

/// Home view model protocol
protocol HomeViewModelProtocol {

	/// Initialiser for HomeViewModel
	///
	/// - Parameter listDataSource: HomeDataSourceProtocol
	init(listDataSource: HomeDataSourceProtocol)

	/// Data source of protocol : HomeDataSourceProtocol
	var dataSource: HomeDataSourceProtocol? { get set }

	/// Fetch top players
	///
	/// - Parameter completion: Optional Error
	/// - Returns: Void
	func fetchTopPlayers(completion: @escaping (Error?) -> Void)

	/// Player for selected indexpath
	///
	/// - Parameter indexPath: IndexPath
	/// - Returns: Optional Player
	func selectedPlayer(_ indexPath: IndexPath) -> Player?

	/// Team id for selected indexpath
	///
	/// - Parameter indexPath: IndexPath
	/// - Returns: TeamId optional Int
	func selectedTeam(_ indexPath: IndexPath) -> Int?
}

class HomeViewModel: HomeViewModelProtocol {

	var dataSource: HomeDataSourceProtocol?
	var service: NRLServiceProtocol = NRLService()

	required init(listDataSource: HomeDataSourceProtocol) {
		dataSource = listDataSource
	}

	func selectedPlayer(_ indexPath: IndexPath) -> Player? {
		return dataSource?.data?[indexPath]
	}

	func selectedTeam(_ indexPath: IndexPath) -> Int? {
		return dataSource?.data?.teamId(for: indexPath)
	}

	func fetchTopPlayers(completion: @escaping (Error?) -> Void) {
		service.fetchTopPlayerStats(match: Constant.matchId) { [weak self] details in
			guard let this = self else {
				return
			}
			guard let data = details else {
				completion(AppError.notAvailable)
				return
			}
			this.dataSource?.data = data.sort()
			completion(nil)
		}
	}
}
