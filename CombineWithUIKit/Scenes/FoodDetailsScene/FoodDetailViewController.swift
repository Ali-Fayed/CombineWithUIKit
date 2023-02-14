//
//  FoodDetailViewController.swift
//  CombineDataSource+UIKit
//
//  Created by AliFayed on 14/02/2023.
//
import UIKit
import CombineCocoa
import SafariServices
class FoodDetailViewController: CustomViewController<FoodDetailsViewModel, AppCoordinator> {
    // MARK: - IBOutlets
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var searchButton: UIButton!
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    // MARK: - Main Methods
    func initView() {
        configureUI()
        subscribeWikiButton()
    }
    // MARK: - UI Methods
    func configureUI() {
        guard let viewModel = viewModel else {return}
        detailsLabel.text = viewModel.foodName
    }
    func subscribeWikiButton() {
        guard let viewModel = viewModel else {return}
        guard let coordinator = coordinator else {return}
        guard let foodName = viewModel.foodName else {return}
        searchButton.tapPublisher.sink { _ in
            coordinator.presentSafariVC(foodName: foodName)
        }.store(in: &subscriptions)
    }
}
