//
//  ImageService.swift
//  NRLTopPlayers
//
//  Created by Ramachandrakurup, Rajesh on 24/8/19.
//  Copyright © 2019 My Company. All rights reserved.
//

import Foundation
import Nuke

private struct ImageService {

	/// Load image
	///
	/// - Parameters:
	///   - url: URL
	///   - placeholderImage: Optional UIImage
	///   - imageView: UIImageView
	static func loadImage(with url: URL, placeholderImage: UIImage?, imageView: UIImageView) {
		let options = ImageLoadingOptions(
			placeholder: placeholderImage
		)
		Nuke.loadImage(with: url, options: options, into: imageView)
	}

	/// Load image with url and completion handler
	///
	/// - Parameters:
	///   - url: URL
	///   - completion: (UIImage?) -> Void
	static func loadImage(with url: URL, completion: @escaping (UIImage?) -> Void) {
		ImagePipeline.shared.loadImage(with: url, progress: nil, completion: { response, _ in
			completion(response?.image)
		})
	}
}

extension UIImageView {
	/// Load image with url
	///
	/// - Parameter url: Optional String
	func loadImage(from url: URL) {
		ImageService.loadImage(with: url, placeholderImage: nil, imageView: self)
	}
}
