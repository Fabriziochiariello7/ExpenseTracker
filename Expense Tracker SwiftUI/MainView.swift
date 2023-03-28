//
//  MainView.swift
//  Expense Tracker
//
//  Created by Fabrizio Chiariello on 28/03/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            WelcomeTextView()
                .padding(.leading, 275)
                Spacer()
            
            RoundedRectangleBalanceView()
            Spacer()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
