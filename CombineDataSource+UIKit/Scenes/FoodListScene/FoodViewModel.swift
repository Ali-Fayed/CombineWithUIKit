//
//  FoodViewModel.swift
//  CombineDataSource+UIKit
//
//  Created by AliFayed on 14/02/2023.
//
import Foundation
import Combine
class FoodViewModel {
    var foodListSubject = PassthroughSubject<[FoodModel], Never>()
    private var foodCard = [
        FoodModel(title: "Eggs", image: "person.fill"),
        FoodModel(title: "Chicken", image: "person.fill"),
        FoodModel(title: "Meat", image: "person.fill"),
        FoodModel(title: "Rice", image: "person.fill"),
        FoodModel(title: "Banana", image: "person.fill"),
        FoodModel(title: "Mango", image: "person.fill"),
        FoodModel(title: "Fish", image: "person.fill"),
        FoodModel(title: "Orange", image: "person.fill"),
        FoodModel(title: "Strawberry", image: "person.fill"),
        FoodModel(title: "Apple", image: "person.fill"),
        FoodModel(title: "Oats", image: "person.fill"),
        FoodModel(title: "Pasta", image: "person.fill"),
    ]
    init() {
        fetchFoodData()
    }
    private func fetchFoodData() {
        DispatchQueue.main.async {
            self.foodListSubject.send(self.foodCard)
        }
    }
}
