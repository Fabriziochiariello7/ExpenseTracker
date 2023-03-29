//
//  ContentView.swift
//  Expense Tracker
//
//  Created by Fabrizio Chiariello on 28/03/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabBar()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TabBar: View {
    @State var selected = 0
    var body : some View{
        TabView(selection: $selected){
            MainView()
                .tabItem{
                    Image(selected == 0 ?  "Home" : "Home2")
                }
                .tag(0)
            AddExpenseView( selectedDate: Date())
                .tabItem{
                    Image(selected == 1 ? "Charts" : "Charts2")
                }
                .tag(1)
            TotalExpenseView()
                .tabItem{
                    Image(selected == 2 ? "PieChart2" : "PieChart")
                }
                .tag(2)
        }
    }
}
