//
//  ListView.swift
//  listagemdeprodutos
//
//  Created by stenio Lima on 24/06/24.
//

import SwiftUI

struct ListView: View {
    let item: FruitList
    var body: some View {
    
        VStack(alignment: .leading){
            HStack{
                Text(item.name)
                    .font(.headline)
                Spacer()
                Text("R$ \(item.valor)")
                    .fontWeight(.bold)
                Image(systemName:item.disponivel ? "cart.fill.badge.plus" : "cart.fill.badge.minus")
                    .foregroundColor(item.disponivel ? Color(.green) : Color(.red))
            }
            Text(item.description)
                .font(.system(size: 13))
                .foregroundColor(.gray)
        }
        
        
    }
}

#Preview {
    ListView(item: FruitList(name: "Uva", description: "Ruim", valor: "5.40", disponivel: false))
}
