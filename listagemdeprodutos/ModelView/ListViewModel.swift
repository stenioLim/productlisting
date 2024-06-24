//
//  File.swift
//  listagemdeprodutos
//
//  Created by stenio Lima on 22/06/24.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [FruitList] = [] {
        didSet {
            saveItems()
        }
    }
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    //claro que aqui estamos decondificando os dados que nós mesmo codificamos 
    func getItems() {
        guard 
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let saveItems = try? JSONDecoder().decode([FruitList].self, from: data)
        else {return}
         
        self.items = saveItems
        
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    func addItem(title: String, descricao: String, valor: String, dispnivel: Bool){
        let newItem = FruitList(name: title, description: descricao, valor: valor, disponivel: dispnivel)
        items.append(newItem)
    }
    
    //aqui a baixo estamos codificando os dados que criamos dentro de items para poder salva-los internamente em cada aparelho
    
    func saveItems(){
        if let encodeData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodeData, forKey:  itemsKey)
        }
    }
    
}
