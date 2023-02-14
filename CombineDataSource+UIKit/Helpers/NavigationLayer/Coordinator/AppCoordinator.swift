//
//  MainCoordinator.swift
//  CombineDataSource+UIKit
//
//  Created by AliFayed on 14/02/2023.
//
import UIKit
import SafariServices
class AppCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let vc = FoodViewController.instaintiate(on: .main)
        vc.title = NavLayerConstants.foodViewTitle
        let viewModel = FoodViewModel()
        vc.bind(viewModel: viewModel, coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    func presentDetailsVC(foodName: String) {
        let vc = FoodDetailViewController.instaintiate(on: .main)
        vc.title = NavLayerConstants.foodDetailsTitle
        let viewModel = FoodDetailsViewModel()
        viewModel.foodName = foodName
        vc.bind(viewModel: viewModel, coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    func presentSafariVC(foodName: String) {
        if let url = URL(string: "https://en.wikipedia.org/wiki/\(foodName)") {
              let config = SFSafariViewController.Configuration()
              config.entersReaderIfAvailable = true
              let vc = SFSafariViewController(url: url, configuration: config)
            self.navigationController.pushViewController(vc, animated: true)
        }
    }
}
