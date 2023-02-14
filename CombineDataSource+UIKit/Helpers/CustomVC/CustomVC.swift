//
//  CustomVC.swift
//  CombineDataSource+UIKit
//
//  Created by AliFayed on 14/02/2023.
//
import Foundation
protocol CustomVC: AnyObject {
   associatedtype V
   associatedtype C
   init(viewModel: V?, coordinator: C?)
}
