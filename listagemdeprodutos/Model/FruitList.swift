//
//  FruitList.swift
//  listagemdeprodutos
//
//  Created by stenio Lima on 22/06/24.
//

import Foundation

struct FruitList: Identifiable, Codable {
    var id: String = UUID().uuidString
    var name: String
    var description: String
    var valor: String
    var disponivel: Bool
}
