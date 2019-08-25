//
//  HomeViewController.swift
//  NRLTopPlayers
//
//  Created by Ramachandrakurup, Rajesh on 24/8/19.
//  Copyright © 2019 My Company. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

	@IBOutlet weak var collectionView: UICollectionView!
	@IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!

	lazy var viewModel: HomeViewModelProtocol = {
		return HomeViewModel(listDataSource: HomeDataSource())
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		title = Constant.homeTitle
		collectionView.delegate = self
		collectionView.dataSource = viewModel.dataSource
		activityIndicatorView.isHidden = false
		if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
			layout.sectionHeadersPinToVisibleBounds = true
		}
		fetchTopPlayers()
	}

	private func fetchTopPlayers() {
		viewModel.fetchTopPlayers { [weak self] error in
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

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		guard let indexPath = collectionView.indexPathsForSelectedItems?.first,
			let player = viewModel.selectedPlayer(indexPath), let teamId = viewModel.selectedTeam(indexPath) else {
			return
		}
		guard let viewController = segue.destination as? PlayerDetailsViewController else {
			return
		}
		let playerDataSource = PlayerDetailsDataSource(player)
		let playerViewModel = PlayerDetailsViewModel(dataSource: playerDataSource, teamId: teamId)
		viewController.viewModel = playerViewModel
	}
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: (collectionView.bounds.width / 2) - 6, height: 120)
	}
}
