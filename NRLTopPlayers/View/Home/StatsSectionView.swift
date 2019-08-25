//
//  StatsSectionView.swift
//  NRLTopPlayers
//
//  Created by Ramachandrakurup, Rajesh on 24/8/19.
//  Copyright © 2019 My Company. All rights reserved.
//

import UIKit

class StatsSectionView: UICollectionReusableView {
	@IBOutlet weak var statLabel: UILabel!
	@IBOutlet weak var teamALabel: UILabel!
	@IBOutlet weak var teamBLabel: UILabel!

	func update(with details: StatsSection?) {
		statLabel.text =  details?.title.uppercased()
		teamALabel.text = details?.teamA
		teamBLabel.text = details?.teamB
	}
}
