//
//  MainCoordinator.swift
//  CombineDataSource+UIKit
//
//  Created by AliFayed on 14/02/2023.
//
import UIKit
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
}
