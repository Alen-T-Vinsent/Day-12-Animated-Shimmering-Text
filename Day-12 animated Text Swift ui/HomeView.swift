//
//  HomeView.swift
//  Day-12 animated Text Swift ui
//
//  Created by Apple  on 27/12/22.
//

import SwiftUI

struct HomeView: View {
    @State var multiColor = false
    
    var body: some View {
        VStack(spacing:25){
            TextShimmerView(text: "1 CRORE", multiColor: $multiColor)
            Toggle(isOn: $multiColor) {
                Text("Enable shimmer")
                    .font(.title)
                    .fontWeight(.bold)
            }
            .padding(60)
        }
        .preferredColorScheme(.dark)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
