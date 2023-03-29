//
//  SegmentedPickerView.swift
//  Expense Tracker
//
//  Created by Fabrizio Chiariello on 29/03/23.
//

import SwiftUI

struct SegmentedPickerView: View {
    @State private var selectedOption = 0
    let options = ["Income", "Expense"]
    var body: some View {
        VStack{
            Picker(selection: $selectedOption, label: Text("Options")){
                ForEach(0..<options.count, id: \.self) { index in
                    Text(options[index]).tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
        .padding()
    }
}

struct SegmentedPickerView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedPickerView()
    }
}
