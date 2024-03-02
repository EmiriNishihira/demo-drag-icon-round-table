//
//  MainView.swift
//  DragIconRoundTableDemoApp
//
//  Created by nakamori.emiri on 2024/03/02.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    VStack {
                        Image(systemName: "pencil.and.outline")
                        Text("tab1")
                    }
                }
                .tag(1)
           
            ContentView2()
                .tabItem {
                    VStack {
                        Image(systemName: "pencil.and.outline")
                        Text("tab2")
                    }
                }
                .tag(2)
        }
    }
}

#Preview {
    MainView()
}
