//
//  DetailedViewController.swift
//  StromViewer
//
//  Created by Jyoti Sahoo on 6/3/20.
//  Copyright © 2020 Jyoti Sahoo. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {

	@IBOutlet weak var imageView: UIImageView!
	var selectedImageName: String?
	var selectedImageIndex: Int?
	var totalImageCount: Int?

	override func viewDidLoad() {
        super.viewDidLoad()
		setUpNavBar()
		setUpImageOnImageView()
    }
	
	fileprivate func setUpImageOnImageView() {
		if let imageName = selectedImageName {
			imageView.image = UIImage(named: imageName)
		}
	}

	fileprivate func setUpNavBar() {
		var navTitle = ""
		if let x = selectedImageIndex, let y = totalImageCount {
			navTitle = "Picture \(x) of \(y)"
		}
		title = navTitle
		navigationItem.largeTitleDisplayMode = .never
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.hidesBarsOnTap = true
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		navigationController?.hidesBarsOnTap = false
	}

}
