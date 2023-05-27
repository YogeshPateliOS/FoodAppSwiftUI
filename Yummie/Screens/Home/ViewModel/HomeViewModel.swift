//
//  HomeViewModel.swift
//  Yummie
//
//  Created by Yogesh Patel on 26/05/23.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {

    private let service: NetworkServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    @Published var viewState: ViewState = .loading
    @Published var allDishes: AllDishes?

    init(service: NetworkServiceProtocol = NetworkService()) {
        self.service = service
    }

    func fetchAllDishes() {
        self.viewState = .loading
        service.request(url: "https://yummie.glitch.me/dish-categories", decodeType: APIResponse.self)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    if let error = error as? URLError,
                       error.code == .timedOut {
                        self.viewState = .error(message: Strings.requestTimeout)
                    } else {
                        self.viewState = .error(message: Strings.somethingWentWrong)
                    }
                case .finished:
                    print("Finished")
                }
            } receiveValue: { [weak self] responseData in
                self?.allDishes = responseData.data
                self?.viewState = .dataLoaded
            }
            .store(in: &cancellables)
    }

}

struct APIResponse: Decodable {
    let status: Int
    let message: String
    let data: AllDishes?
}

struct AllDishes: Decodable {
    let categories: [DishCategory]
    let populars: [Dish]
    let specials: [Dish]
}

struct DishCategory: Decodable, Identifiable {
    let id, name, image: String

    enum CodingKeys: String, CodingKey {
        case id
        case name = "title"
        case image
    }
}

struct Dish: Decodable, Identifiable {
    let id, name, description, image: String
    let calories: Int

    var formattedCalories: String {
        return "\(calories) calories"
    }
}

