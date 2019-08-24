//
//  HomePlayerCell.swift
//  NRLTopPlayers
//
//  Created by Ramachandrakurup, Rajesh on 24/8/19.
//  Copyright © 2019 My Company. All rights reserved.
//

import UIKit

class HomePlayerCell: UICollectionViewCell {
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var shortNameLabel: UILabel!
	@IBOutlet weak var positionLabel: UILabel!
	@IBOutlet weak var statLabel: UILabel!
	@IBOutlet weak var numberLabel: UILabel!
	@IBOutlet weak var statValueLabel: UILabel!
}

class HomePlayerLeftCell: HomePlayerCell {
}
class HomePlayerRightCell: HomePlayerCell {
}
