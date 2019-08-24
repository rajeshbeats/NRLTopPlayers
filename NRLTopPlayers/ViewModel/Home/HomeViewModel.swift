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
	func selectedPlayer(_ indexPath: IndexPath) -> Player?
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

	func fetchTopPlayers(completion: @escaping () -> Void) {
		service.fetchTopPlayerStats(match: "NRL20172101") { [weak self] details in
			guard let this = self else {
				return
			}
			this.dataSource?.data = details
			completion()
		}
	}
}