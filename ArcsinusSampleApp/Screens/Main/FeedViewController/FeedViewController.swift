//
//  FeedViewController.swift
//  ArcsinusSampleApp
//
//  Created by Danil Blinov on 13.03.2021.
//

import RxCocoa
import RxSwift

final class FeedViewController: BaseViewController<FeedViewModel> {
	@IBOutlet private weak var nextButton: UIButton!
	private let disposeBag = DisposeBag()
	
	override func setupRx() {
		nextButton.rx.tap.bind(to: viewModel.nextButtonPressed).disposed(by: disposeBag)
	}
	
	override func setupStyle() {
		nextButton.layer.cornerRadius = 8
	}
}
