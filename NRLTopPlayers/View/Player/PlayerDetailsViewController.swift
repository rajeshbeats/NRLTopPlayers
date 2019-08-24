//
//  PlayerDetailsViewController.swift
//  NRLTopPlayers
//
//  Created by Ramachandrakurup, Rajesh on 24/8/19.
//  Copyright © 2019 My Company. All rights reserved.
//

import UIKit

class PlayerDetailsViewController: UIViewController {

	@IBOutlet weak var collectionView: UICollectionView!
	@IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
	var viewModel: PlayerDetailsViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
		title = Constant.appName
		collectionView.dataSource = viewModel?.dataSource
		collectionView.delegate = self
		collectionView.collectionViewLayout = UICollectionViewLeftAlignedLayout()
		activityIndicatorView.isHidden = false

		viewModel?.fetchPlayerDetails(completion: { _ in
			DispatchQueue.main.async { [weak self] in
				guard let this = self else {
					return
				}
				this.collectionView.reloadData()
				this.activityIndicatorView.isHidden = true
			}
		})
    }
}

extension PlayerDetailsViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let text = viewModel?.dataSource.player.displayStats(for: indexPath)
		var size = text?.sizeOfDynamicFont(font: UIFont.systemFont(ofSize: 14))
		size?.width += 20
		size?.height += 20
		return size ?? .zero
	}

	func collectionView(_ collectionView: UICollectionView, layout
		collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
		return CGSize(width: view.bounds.width, height: 200)
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
						minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 5
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
	}
}
