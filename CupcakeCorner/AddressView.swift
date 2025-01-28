//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by 千々岩真吾 on 2024/06/16.
//

import SwiftUI

struct AddressView: View {
    @Binding var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            }
            
            Section {
                NavigationLink("Check out") {
                    CheckoutView(order: $order)
                }
            }
            .disabled(!order.hasValidAddress)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

#Preview {
    struct Preview: View {
        @State private var order = Order()
        
        var body: some View {
            NavigationStack {
                AddressView(order: $order)
            }
        }
    }
    
   return Preview()
}
