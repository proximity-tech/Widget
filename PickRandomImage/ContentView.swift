//
//  ContentView.swift
//  PickRandomImage
//
//  Created by Ramkrishna on 15/06/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Pick Random Image")
            
            Image("disney1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
