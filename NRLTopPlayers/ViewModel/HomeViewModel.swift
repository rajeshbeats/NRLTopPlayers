//
//  HomeViewModel.swift
//  NRLTopPlayers
//
//  Created by Ramachandrakurup, Rajesh on 24/8/19.
//  Copyright © 2019 My Company. All rights reserved.
//

import Foundation

protocol HomeViewModelProtocol {
	init(listDataSource: HomeDataSourceProtocol)
	var dataSource: HomeDataSourceProtocol? { get set }
	func fetchTopPlayers(completion: @escaping () -> Void)
	func fetchPlayer(_ playerId: Int, teamId: Int, completion: @escaping (Player?) -> Void)
}

class HomeViewModel: HomeViewModelProtocol {

	var dataSource: HomeDataSourceProtocol?
	var service: NRLServiceProtocol = NRLService()

	required init(listDataSource: HomeDataSourceProtocol) {
		dataSource = listDataSource
	}

	func fetchTopPlayers(completion: @escaping () -> Void) {
		service.fetchTopPlayerStats(match: "NRL20172101") { [weak self] details in
			guard let this = self else {
				return
			}
			this.dataSource?.data = details
			completion()
		}
	}

	func fetchPlayer(_ playerId: Int, teamId: Int, completion: @escaping (Player?) -> Void) {
		service.fetchPlayerDetails(for: playerId, teamId: teamId) { player in
			completion(player)
		}
	}
}
