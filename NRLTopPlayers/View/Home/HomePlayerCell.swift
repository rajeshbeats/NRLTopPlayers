//
//  HomePlayerCell.swift
//  NRLTopPlayers
//
//  Created by Ramachandrakurup, Rajesh on 24/8/19.
//  Copyright © 2019 My Company. All rights reserved.
//

import UIKit

/// Common class for Home Player headshot cell
class HomePlayerCell: UICollectionViewCell {
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var shortNameLabel: UILabel!
	@IBOutlet weak var positionLabel: UILabel!
	@IBOutlet weak var numberLabel: UILabel!
	@IBOutlet weak var statValueLabel: UILabel!

	override func awakeFromNib() {
		super.awakeFromNib()
		imageView.layer.masksToBounds = true
		numberLabel.layer.masksToBounds = true
	}
	override func layoutSubviews() {
		super.layoutSubviews()
		imageView.round()
		numberLabel.round()
	}

	func updatePlayer(_ player: Player?) {
		shortNameLabel.text = player?.shortName
		positionLabel.text = player?.position
		statValueLabel.text = String(player?.statValue ?? 0)
		numberLabel.text = String(player?.jumberNumber ?? 0)
		imageView.loadImage(from: Endpoint.playerImage(player?.playerId ?? 0))
	}
}

class HomePlayerLeftCell: HomePlayerCell {}
class HomePlayerRightCell: HomePlayerCell {}

extension UIView {
	/// Make circle round of UIView objects
	func round() {
		layer.cornerRadius = bounds.width / 2
	}
}
