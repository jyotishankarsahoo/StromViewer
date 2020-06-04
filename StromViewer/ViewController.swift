//
//  ViewController.swift
//  StromViewer
//
//  Created by Jyoti Sahoo on 6/3/20.
//  Copyright © 2020 Jyoti Sahoo. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
	var listItems = [String]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setUpNavBar()
		setUpDatasource()
	}

	fileprivate func setUpNavBar() {
		title = "Strom Viewer"
		navigationController?.navigationBar.prefersLargeTitles = true
	}

	fileprivate func setUpDatasource() {
		let fm = FileManager.default
		let path = Bundle.main.resourcePath!
		let images = try! fm.contentsOfDirectory(atPath: path)
		for image in images where image.hasPrefix("nssl") {
			listItems.append(image)
		}
		listItems.sort()
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return listItems.count
	}
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
		cell.textLabel?.text = listItems[indexPath.row]
		cell.accessoryType = .disclosureIndicator
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if let detailedViewController = storyboard?.instantiateViewController(identifier: "details") as? DetailedViewController {
			detailedViewController.selectedImageName = listItems[indexPath.row]
			detailedViewController.selectedImageIndex = indexPath.row + 1
			detailedViewController.totalImageCount = listItems.count
			navigationController?.pushViewController(detailedViewController, animated: true)
		}
	}
}

