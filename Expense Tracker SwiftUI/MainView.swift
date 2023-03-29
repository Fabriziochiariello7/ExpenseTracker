//
//  MainView.swift
//  Expense Tracker
//
//  Created by Fabrizio Chiariello on 28/03/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack(spacing: -190.0) {
            WelcomeTextView()
                .padding(.leading, 275)
                Spacer()
            
            RoundedRectangleBalanceView()
            
            TransactionsTextView()
            Spacer()
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
