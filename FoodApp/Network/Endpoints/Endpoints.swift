//
//  Endpoints.swift
//  FoodApp
//
//  Created by Michał Niemiec on 17/05/2022.
//

import Foundation

struct FoodsEndpoint: Endpoint {

    let foodId: Int

    var path: String {
        "foodipedia/codetest?foodid=\(self.foodId)"
    }

    var method: HTTPMethod {
        .get
    }

    var header: [String: String]? {
        nil
    }

    var body: [String: String]? {
        nil
    }

    init(_ foodId: Int) {
        self.foodId = foodId
    }
}
