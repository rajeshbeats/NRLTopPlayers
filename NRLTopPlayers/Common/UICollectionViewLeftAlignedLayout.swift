//
//  File.swift
//  NRLTopPlayers
//
//  Created by Ramachandrakurup, Rajesh on 24/8/19.
//  Copyright © 2019 My Company. All rights reserved.
//

import UIKit
open class UICollectionViewLeftAlignedLayout: UICollectionViewFlowLayout {
	open override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
		return super.layoutAttributesForElements(in: rect)?.map { $0.representedElementKind == nil ? (layoutAttributesForItem(at: $0.indexPath) ?? $0 ) : $0 }
	}

	open override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
		guard let currentItemAttributes = super.layoutAttributesForItem(at: indexPath)?.copy() as? UICollectionViewLayoutAttributes,
			collectionView != nil else {
				// should never happen
				return nil
		}
		if scrollDirection == .vertical {
			// if the current frame, once stretched to the full row intersects the previous frame then they are on the same row
			if indexPath.item != 0,
				let previousFrame = layoutAttributesForItem(at: IndexPath(item: indexPath.item - 1, section: indexPath.section))?.frame,
				currentItemAttributes.frame.intersects(CGRect(x: -.infinity, y: previousFrame.origin.y, width: .infinity, height: previousFrame.size.height)) {
				// the next item on a row
				currentItemAttributes.frame.origin.x = previousFrame.origin.x + previousFrame.size.width + evaluatedMinimumInteritemSpacingForSection(at: indexPath.section)
			} else {
				// the first item on a row is section aligned
				currentItemAttributes.frame.origin.x = evaluatedSectionInsetForSection(at: indexPath.section).left
			}
		} else {
			// if the current frame, once stretched to the full column intersects the previous frame then they are on the same column
			if indexPath.item != 0,
				let previousFrame = layoutAttributesForItem(at: IndexPath(item: indexPath.item - 1, section: indexPath.section))?.frame,
				currentItemAttributes.frame.intersects(CGRect(x: previousFrame.origin.x, y: -.infinity, width: previousFrame.size.width, height: .infinity)) {
				// the next item on a column
				currentItemAttributes.frame.origin.y = previousFrame.origin.y +
					previousFrame.size.height +
					evaluatedMinimumInteritemSpacingForSection(at: indexPath.section)
			} else {
				// the first item on a column is section aligned
				currentItemAttributes.frame.origin.y = evaluatedSectionInsetForSection(at: indexPath.section).top
			}
		}
		return currentItemAttributes
	}

	func evaluatedMinimumInteritemSpacingForSection(at section: NSInteger) -> CGFloat {
		guard let view = collectionView else {
			return 0
		}
		return (collectionView?.delegate as? UICollectionViewDelegateFlowLayout)?.collectionView?(view,
																								  layout: self,
																								  minimumInteritemSpacingForSectionAt: section) ?? minimumInteritemSpacing
	}

	func evaluatedSectionInsetForSection(at index: NSInteger) -> UIEdgeInsets {
		guard let view = collectionView else {
			return .zero
		}
		return (collectionView?.delegate as? UICollectionViewDelegateFlowLayout)?.collectionView?(view, layout: self, insetForSectionAt: index) ?? sectionInset
	}
}
