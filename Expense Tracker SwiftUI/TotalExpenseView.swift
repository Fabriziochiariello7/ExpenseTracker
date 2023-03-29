//
//  TotalExpenseView.swift
//  Expense Tracker
//
//  Created by Fabrizio Chiariello on 29/03/23.
//

import SwiftUI

struct TotalExpenseView: View {
    var body: some View {
        SegmentedPickerView()
            .padding(.bottom, 500)
    }
}

struct TotalExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        TotalExpenseView()
    }
}
