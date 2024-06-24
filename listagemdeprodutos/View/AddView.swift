//
//  AddView.swift
//  listagemdeprodutos
//
//  Created by stenio Lima on 24/06/24.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationModel
    @EnvironmentObject var listModelView: ListViewModel
    
    @State var name: String = ""
    @State var price: String = ""
    @State var description: String = ""
    @State var disponivel: Bool = true
    
    
    var body: some View {
        NavigationStack{
            Form {
                    Section(header: Text("Nome do produto:")){
                            TextField("Maçã Verde", text: $name)
                                .frame(height: 40)
                                .cornerRadius(10)
                    }
                Section(header: Text("Preço do produto:")){
                        TextField("R$", text: $price)
                            .keyboardType(.numberPad)
                            .frame(height: 40)
                            .cornerRadius(10)
                }
                Section(header: Text("\(name) está disponivel ?")){
                    Picker("", selection: $disponivel){
                        Text("Sim").tag(true)
                        Text("Não").tag(false)
                    }
                    .pickerStyle(.segmented)
                }
                Section(header: Text("Descrição:")){
                        TextField("Maçã Verde muito nova", text: $description)
                            .frame(height: 40)
                            .cornerRadius(10)
                }
                Button(action: saveButtonPressed, label: {
                    Text("Adcionar Item".uppercased())
                        .foregroundColor(.blue)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        
                })
            }
        }.navigationTitle("Adicionar novo item")
    }
    func saveButtonPressed(){
        listModelView.addItem(title: name, descricao: description, valor: price, dispnivel: disponivel)
        presentationModel.wrappedValue.dismiss()
    }
}

#Preview {
    NavigationView{
        AddView()
    }.environmentObject(ListViewModel())
}
