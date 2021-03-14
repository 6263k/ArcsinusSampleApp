//
//  ArcViewController.swift
//  ArcsinusSampleApp
//
//  Created by Danil Blinov on 13.03.2021.
//

import UIKit

class BaseViewController<ViewModel: BaseViewModel>: UIViewController {
	var viewModel: ViewModel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupStyle()
		setupRx()
	}
	
	func setupRx() { }
	func setupStyle() { }
	
	class func create(_ viewModel: ViewModel, with storyboard: UIStoryboard) -> BaseViewController? {
		guard let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? BaseViewController else {
			assertionFailure("Cannot instantiate UIViewController with \(identifier)")
			return nil
		}
		viewController.viewModel = viewModel
		return viewController
	}
}
