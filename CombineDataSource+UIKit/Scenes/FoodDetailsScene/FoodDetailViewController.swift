//
//  FoodDetailViewController.swift
//  CombineDataSource+UIKit
//
//  Created by AliFayed on 14/02/2023.
//
import UIKit
class FoodDetailViewController: CustomViewController<FoodDetailsViewModel, AppCoordinator> {
    // MARK: - IBOutlets
    @IBOutlet weak var detailsLabel: UILabel!
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    // MARK: - Main Methods
    func initView() {
        configureUI()
    }
    // MARK: - UI Methods
    func configureUI() {
        guard let viewModel = viewModel else {return}
        detailsLabel.text = viewModel.foodName
    }
}
