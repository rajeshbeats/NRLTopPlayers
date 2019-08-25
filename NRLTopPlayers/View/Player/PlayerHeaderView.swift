//
//  PlayerHeaderView.swift
//  NRLTopPlayers
//
//  Created by Ramachandrakurup, Rajesh on 24/8/19.
//  Copyright © 2019 My Company. All rights reserved.
//

import UIKit

class PlayerHeaderView: UICollectionReusableView {
	 @IBOutlet weak var fullNamLabel: UILabel!
	 @IBOutlet weak var positionLabel: UILabel!
	 @IBOutlet weak var imageView: UIImageView!

	func update(_ player: Player) {
		fullNamLabel.text = player.fullName
		positionLabel.text = player.position
		imageView.loadImage(from: Endpoint.playerImage(player.playerId ?? 0))
	}
}
