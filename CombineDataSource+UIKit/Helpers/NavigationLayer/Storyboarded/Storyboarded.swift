//
//  Storyboarded.swift
//  CombineDataSource+UIKit
//
//  Created by AliFayed on 14/02/2023.
//
import Foundation
import UIKit
protocol Storyboarded {
    static func instaintiate(on storyboard: AppStoryboards) -> Self
}
extension Storyboarded where Self: UIViewController {
    static func instaintiate(on storyboard: AppStoryboards) -> Self {
        let vcID = String(describing: self)
        let storyBoard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        return storyBoard.instantiateViewController(identifier: vcID) as! Self
    }
}
extension UIViewController: Storyboarded {}
