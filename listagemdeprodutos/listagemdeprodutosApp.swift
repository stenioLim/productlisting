//
//  listagemdeprodutosApp.swift
//  listagemdeprodutos
//
//  Created by stenio Lima on 22/06/24.
//

import SwiftUI

@main
struct listagemdeprodutosApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                Home()
            }.environmentObject(listViewModel)
            
        }
    }
}
