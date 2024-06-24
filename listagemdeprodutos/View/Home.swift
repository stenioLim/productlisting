//
//  Home.swift
//  listagemdeprodutos
//
//  Created by stenio Lima on 22/06/24.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var listModelView: ListViewModel
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(listModelView.items){ items in
                    ListView(item: items)
                }
                .onDelete(perform: listModelView.deleteItem)
                .onMove(perform: listModelView.moveItem)
                
            }.navigationTitle("Items")
            .navigationBarItems(leading: EditButton(),
            trailing: NavigationLink("Adicionar", destination: AddView()))
        }
        
    }
}

#Preview {
    NavigationView{
        Home()
    }.environmentObject(ListViewModel())
    
}
