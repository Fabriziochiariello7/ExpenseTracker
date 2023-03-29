//
//  RoundedRectangleView.swift
//  Expense Tracker
//
//  Created by Fabrizio Chiariello on 28/03/23.
//

import SwiftUI

struct RoundedRectangleView: View {
    var body: some View {
        
        HStack{
                Text("Expenses")
                .padding(.trailing, 70)
            Text("**Total Balance**")
                .font(.system(size: 20))
        }
        .padding(.bottom, 185)
        .frame(width: 325, height: 225)
        .overlay(
        RoundedRectangle(cornerRadius: 20)
            .stroke(LinearGradient(colors: [.red, .purple, .red, .orange, .yellow, .orange], startPoint: .topLeading, endPoint: .bottomTrailing),
                    lineWidth: 2.3)
            .frame(width: 325, height: 225)
            
        )
        
    }
}

struct RoundedRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        RoundedRectangleView()
    }
}
