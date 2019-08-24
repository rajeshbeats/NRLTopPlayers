//
//  HomeDataSource.swift
//  NRLTopPlayers
//
//  Created by Ramachandrakurup, Rajesh on 24/8/19.
//  Copyright © 2019 My Company. All rights reserved.
//

import UIKit

/// Home Data Source Protocol
protocol HomeDataSourceProtocol: UICollectionViewDataSource {

	var data: [MatchDetails]? { get set }
}

class HomeDataSource: NSObject, HomeDataSourceProtocol {

	var data: [MatchDetails]?

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		  let cell = HomePlayerLeftCell.dequeueReusableCell(forCollectionView: collectionView, indexPath: indexPath) as HomePlayerLeftCell

		let index = Int(indexPath.item / 2)
		var item: Player?
		if indexPath.item % 2 == 0 {
			item = data?[indexPath.section].teamA?.topPlayers?[index]
		} else {
			item = data?[indexPath.section].teamB?.topPlayers?[indexPath.item / 2]
		}

		cell.updatePlayer(item)
		return cell
	}

	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return data?.count ?? 0
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return (data?[section].teamA?.topPlayers?.count ?? 0 ) * 2
	}
}
