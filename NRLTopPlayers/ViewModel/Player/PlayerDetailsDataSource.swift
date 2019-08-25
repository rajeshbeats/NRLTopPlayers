//
//  PlayerDetailsDataSource.swift
//  NRLTopPlayers
//
//  Created by Ramachandrakurup, Rajesh on 24/8/19.
//  Copyright © 2019 My Company. All rights reserved.
//

import UIKit

/// Protocols for PlayerDetailsDataSource
protocol PlayerDetailsDataSourceProtocol: UICollectionViewDataSource {

	/// Player isntance
	var player: Player { get set }

	/// List of sttatus
	var stats: [String] { get set }

	/// Initializer for PlayerDetailsDataSourceProtocol
	///
	/// - Parameter player: Player
	init(_ player: Player)
}

class PlayerDetailsDataSource: NSObject, PlayerDetailsDataSourceProtocol {

	var player: Player
	var stats: [String] = []

	required init(_ player: Player) {
		self.player = player
	}

	func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		switch kind {
		case UICollectionView.elementKindSectionHeader:
			let view: PlayerHeaderView = PlayerHeaderView.dequeueViewForSupplementaryElement(forCollectionView: collectionView, kind: kind, for: indexPath)
			view.update(player)
			return view

		case UICollectionView.elementKindSectionFooter:
			let view: PlayerFooterView = PlayerFooterView.dequeueViewForSupplementaryElement(forCollectionView: collectionView, kind: kind, for: indexPath)
			return view
		default:
			debugPrint("Unknow section kind")
			fatalError()
		}
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = PlayerStatsCell.dequeueReusableCell(forCollectionView: collectionView, indexPath: indexPath) as PlayerStatsCell
		let key = stats[indexPath.item]
		cell.label.text = player.formattedStatsValue(for: key)
		return cell
	}

	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return stats.count
	}
}
