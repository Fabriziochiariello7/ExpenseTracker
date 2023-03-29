//
//  TransactionsTextView.swift
//  Expense Tracker
//
//  Created by Fabrizio Chiariello on 29/03/23.
//

import SwiftUI

struct TransactionsTextView: View {
    @State var isAllTransactionsPresented = false
    var body: some View {
        HStack {
            Text("**Transactions**")
                .font(.title)
            Spacer()
            Button(action: {
                isAllTransactionsPresented.toggle()
            }, label: {
                HStack {
                    Text("More")
                    Image(systemName: "arrow.right.circle")
                }
            })
            .sheet(isPresented: $isAllTransactionsPresented, content: {
                AllTransactionsView()
            })
        }.padding()
    }
}

struct TransactionsTextView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsTextView()
    }
}
