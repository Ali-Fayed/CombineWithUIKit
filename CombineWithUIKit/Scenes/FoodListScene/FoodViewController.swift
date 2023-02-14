//
//  FoodViewController.swift
//  CombineDataSource+UIKit
//
//  Created by AliFayed on 14/02/2023.
//
import UIKit
import CombineDataSources
import CombineCocoa
class FoodViewController: CustomViewController<FoodViewModel, AppCoordinator> {
    // MARK: - IBOutlets
    @IBOutlet weak private var tableView: UITableView!
    // MARK: - Properties
    private let tableViewRefreshControl = UIRefreshControl()
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    // MARK: - MainMethods
    private func initView() {
        tableViewConfigurations()
    }
    // MARK: - TableView
    private func tableViewConfigurations() {
        bindTableViewDataSource()
        subscribeOnDidSelectRow()
        subscribeTableViewRefresh()
    }
    private func bindTableViewDataSource() {
        guard let viewModel = viewModel else {return}
        viewModel.foodListSubject
            .bind(subscriber: tableView.rowsSubscriber(cellIdentifier: "foodCell", cellType: UITableViewCell.self, cellConfig: { cell, indexPath, foodModel in
                cell.textLabel?.text = foodModel.title
                cell.imageView?.image = UIImage(systemName: foodModel.image)
        })).store(in: &subscriptions)
    }
    private func subscribeOnDidSelectRow() {
        guard let coordinator = self.coordinator else {return}
        guard let viewModel = self.viewModel else {return}
        tableView.didSelectRowPublisher
          .sink(receiveValue: { [weak self] indexPath in
             guard let self = self else {return}
             guard let passedFoodItem = viewModel.passedFoodItem else {return}
             self.tableView.deselectRow(at: indexPath, animated: true)
             coordinator.presentDetailsVC(foodName: passedFoodItem[indexPath.row].title)
       }).store(in: &subscriptions)
    }
    private func subscribeTableViewRefresh() {
        tableView.refreshControl = tableViewRefreshControl
        tableViewRefreshControl.isRefreshingPublisher.sink(receiveValue: { [weak self]  isRefreshing in
            guard let self = self else {return}
            self.tableView.refreshControl?.endRefreshing()
        }).store(in: &subscriptions)
    }
}
