//
//  HomeViewController.swift
//  NRLTopPlayers
//
//  Created by Ramachandrakurup, Rajesh on 24/8/19.
//  Copyright © 2019 My Company. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
	@IBOutlet weak var collectionView: UICollectionView!
	let datasource = HomeDataSource()
	lazy var viewModel: HomeViewModelProtocol = {
		return HomeViewModel(listDataSource: datasource)
	}()

    override func viewDidLoad() {
        super.viewDidLoad()
		collectionView.delegate = self
		collectionView.dataSource = datasource
		viewModel.fetchTopPlayers { [weak self] in
			guard let this = self else {
				return
			}
			DispatchQueue.main.async {
				this.collectionView.reloadData()
			}
		}
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: (view.bounds.width / 2) - 10, height: 170)
	}
}
