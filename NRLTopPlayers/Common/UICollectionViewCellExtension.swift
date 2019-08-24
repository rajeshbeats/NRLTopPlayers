//
//  UICollectionViewCellExtension.swift
//  NRLTopPlayers
//
//  Created by Ramachandrakurup, Rajesh on 24/8/19.
//  Copyright © 2019 My Company. All rights reserved.
//

import UIKit

extension UICollectionViewCell {

	static func dequeueReusableCell<T: UICollectionViewCell>(forCollectionView collectionView: UICollectionView, indexPath: IndexPath) -> T {
		guard let cellIdentifier = classForCoder().description().components(separatedBy: ".").last,
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? T else {
				fatalError("Unable to load collection view cell from given class type. Cell identifier and class name should be same")
		}
		return cell
	}
}

extension UICollectionReusableView {
	static func dequeueViewForSupplementaryElement<T: UICollectionReusableView>(forCollectionView collectionView: UICollectionView,
																				kind: String, for indexPath: IndexPath) -> T {
		guard let identifier = classForCoder().description().components(separatedBy: ".").last,
			let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: identifier, for: indexPath) as? T else {
				fatalError("Unable to load collection view Supplementary view from given class type. Identifier and class name should be same")
		}
		return cell
	}
}
