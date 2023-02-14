//
//  CustomViewController.swift
//  CombineDataSource+UIKit
//
//  Created by AliFayed on 14/02/2023.
//
import UIKit
import Combine
class CustomViewController<T, F>:UIViewController, CustomVC {
    typealias V = T
    typealias C = F
    var viewModel: V?
    var coordinator: C?
    var subscriptions: Set<AnyCancellable> = []
    convenience init() {
        fatalError("init() has not been implemented")
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    required init(viewModel: V?, coordinator: C?) {
         super.init(nibName: nil, bundle: nil)
        bind(viewModel: viewModel, coordinator: coordinator)
    }
    func bind(viewModel: V?, coordinator: C?) {
        self.viewModel = viewModel
        self.coordinator = coordinator
    }
}
