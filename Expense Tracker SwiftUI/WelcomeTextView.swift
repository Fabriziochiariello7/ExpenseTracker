//
//  WelcomeTextView.swift
//  Expense Tracker
//
//  Created by Fabrizio Chiariello on 28/03/23.
//

import SwiftUI

struct WelcomeTextView: View {
    var body: some View {
        Text("Welcome")
            .fontWeight(.light)
            .padding(.leading, 275)
            .padding(.bottom, 600)
    }
}

struct WelcomeTextView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeTextView()
    }
}
