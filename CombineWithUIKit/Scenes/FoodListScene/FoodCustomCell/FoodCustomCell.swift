//
//  FoodCustomCell.swift
//  CombineWithUIKit
//
//  Created by AliFayed on 14/02/2023.
//
import UIKit
class FoodCustomCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func setData(foodModel: FoodModel) {
        textLabel?.text = foodModel.title
        imageView?.image = UIImage(systemName: foodModel.image)
    }
}
