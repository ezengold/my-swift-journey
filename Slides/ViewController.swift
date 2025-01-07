//
//  ViewController.swift
//  Slides
//
//  Created by ezen on 04/01/2025.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let hostedView = PropertyWrapperDemo()
		
		let hosting = UIHostingController(rootView: hostedView)
		hosting.view.translatesAutoresizingMaskIntoConstraints = false
//		hosting.view.backgroundColor = UIColor.white
		
		addChild(hosting)
		view.addSubview(hosting.view)
		hosting.didMove(toParent: self)
		
		NSLayoutConstraint.activate([
			NSLayoutConstraint(item: hosting.view!, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 0),
			NSLayoutConstraint(item: hosting.view!, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0),
			NSLayoutConstraint(item: hosting.view!, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 0),
			NSLayoutConstraint(item: hosting.view!, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: 0)
		])
	}
}
