//
//  PlayerDetailsDataSource.swift
//  NRLTopPlayers
//
//  Created by Ramachandrakurup, Rajesh on 24/8/19.
//  Copyright © 2019 My Company. All rights reserved.
//

import UIKit

protocol PlayerDetailsDataSourceProtocol: UICollectionViewDataSource {

	var player: Player { get set }
	//var stats: [String]
	init(_ player: Player)

}

class PlayerDetailsDataSource: NSObject, PlayerDetailsDataSourceProtocol {

	var player: Player

	required init(_ player: Player) {
		self.player = player
	}

	func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		let view: PlayerHeaderView = PlayerHeaderView.dequeueViewForSupplementaryElement(forCollectionView: collectionView, kind: kind, for: indexPath)
		view.update(player)
		return view
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = PlayerStatsCell.dequeueReusableCell(forCollectionView: collectionView, indexPath: indexPath) as PlayerStatsCell
		cell.label.text = player.displayStats(for: indexPath)
		return cell
	}

	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return player.lastMatchStats?.count ?? 0
	}
}
