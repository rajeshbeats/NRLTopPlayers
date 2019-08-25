//
//  PlayerDetailsViewController.swift
//  NRLTopPlayers
//
//  Created by Ramachandrakurup, Rajesh on 24/8/19.
//  Copyright © 2019 My Company. All rights reserved.
//

import UIKit

private extension Constant {
	static let cellPadding: CGFloat = 20
	static let headerHeight: CGFloat = 230
	static let footerHeight: CGFloat = 40
	static let cellMargin: CGFloat = 5
}

class PlayerDetailsViewController: UIViewController {

	@IBOutlet weak var collectionView: UICollectionView!
	@IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
	var viewModel: PlayerDetailsViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
		title = Constant.appName
		collectionView.dataSource = viewModel?.dataSource
		collectionView.delegate = self
		// CollectionViewLayout for left aligned cell
		collectionView.collectionViewLayout = UICollectionViewLeftAlignedLayout()
		activityIndicatorView.isHidden = false
		fetchPlayerDetails()
    }

	private func fetchPlayerDetails() {
		viewModel?.fetchPlayerDetails { [weak self] error in
			guard let this = self else {
				return
			}
			DispatchQueue.main.async {
				this.collectionView.reloadData()
				this.activityIndicatorView.isHidden = true
				if let appError = error {
					this.showErrorMessage(appError.localizedDescription)
				}
			}
		}
	}
}

extension PlayerDetailsViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let key = viewModel?.dataSource.stats[indexPath.item]
		let text = viewModel?.dataSource.player.formattedStatsValue(for: key ?? "")
		var size = text?.sizeOfDynamicFont(font: UIFont.systemFont(ofSize: 14))
		size?.width += Constant.cellPadding
		size?.height += Constant.cellPadding
		return size ?? .zero
	}

	func collectionView(_ collectionView: UICollectionView, layout
		collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
		return CGSize(width: collectionView.bounds.width, height: Constant.headerHeight)
	}

	func collectionView(_ collectionView: UICollectionView, layout
		collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
		// Show not available message only if last match stats not available
		let height: CGFloat = (viewModel?.showStatsNotAvailable ?? false) ? Constant.footerHeight : 0
		return CGSize(width: collectionView.bounds.width, height: height)
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
						minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 5
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: Constant.cellMargin, left: Constant.cellMargin, bottom: Constant.cellMargin, right: Constant.cellMargin)
	}
}
