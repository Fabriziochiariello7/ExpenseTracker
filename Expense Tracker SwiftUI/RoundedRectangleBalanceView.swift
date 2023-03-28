//
//  RoundedRectangleBalanceView.swift
//  Expense Tracker
//
//  Created by Fabrizio Chiariello on 28/03/23.
//

import SwiftUI

struct RoundedRectangleBalanceView: View {
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .background([Color.yellow, Color.red, Color.yellow])
                .frame(width: 325, height: 225)
            
            
        }
    }
}

struct RoundedRectangleBalanceView_Previews: PreviewProvider {
    static var previews: some View {
        RoundedRectangleBalanceView()
    }
}
