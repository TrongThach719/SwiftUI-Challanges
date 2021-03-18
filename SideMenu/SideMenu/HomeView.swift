//
//  HomeView.swift
//  SideMenu
//
//  Created by Thach Nguyen Trong on 18.03.2021.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.white
            Text("Hello, Hunter Brooks!")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.black)
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
