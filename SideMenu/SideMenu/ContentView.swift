//
//  ContentView.swift
//  SideMenu
//
//  Created by Thach Nguyen Trong on 18.03.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showMenu = false
    
    var body: some View {
        NavigationView {
            ZStack {
                if showMenu {
                    SlideMenuView()
                        .navigationBarHidden(true)
                        .overlay(
                            Button(action: {
                                withAnimation(.spring()) {
                                    self.showMenu.toggle()
                                }
                            }, label: {
                                Image(systemName: "xmark")
                                    .foregroundColor(.white)
                            })
                            .padding()
                            , alignment: .topTrailing
                        )
                    
                }
                
                HomeView()
                    .cornerRadius(showMenu ? 20 : 10)
                    .scaleEffect(showMenu ? 0.8 : 1)
                    .opacity(showMenu ? 0.6 : 1)
                    .offset(x: showMenu ? 300 : 0, y: showMenu ? 50 : 0)
                    
                    .navigationBarItems(leading:
                                            Button(action: {
                                                withAnimation(.spring()) {
                                                    self.showMenu.toggle()
                                                }
                                            }, label: {
                                                Image(systemName: "list.bullet")
                                                    .foregroundColor(.primary)
                                            })
                    )
                    .navigationTitle("Home")
            }
        }
        .foregroundColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SlideMenuView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: .init(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack(alignment: .leading, spacing: 20) {
                
                MenuHeaderView()
                
                VStack(alignment: .leading, spacing: 16) {
                    MenuItemView(image: "person", title: "Profile")
                    MenuItemView(image: "list.bullet", title: "Lists")
                    MenuItemView(image: "bookmark", title: "Bookmarks")
                    MenuItemView(image: "bubble.left", title: "Messages")
                    MenuItemView(image: "bell", title: "Notifications")
                    MenuItemView(image: "arrow.backward.square", title: "Logout")
                }
                .padding()
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding()
        }
    }
}

struct MenuItemView: View {
    
    let image: String
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .font(.title2)
                .frame(width: 40, height: 40)
            Text(title)
                .fontWeight(.semibold)
        }
        .foregroundColor(.white)
    }
}

struct MenuHeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Image("Hunter Brooks")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: 65, height: 65)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: 2)
                )
                .shadow(color: .black.opacity(0.3), radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 0)
            
            VStack(alignment: .leading) {
                Text("Hunter Brooks")
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                
                Text("@hunterbrooks")
                    .font(.caption)
                    .foregroundColor(.white)
            }
            
            HStack(spacing: 12) {
                HStack(spacing: 4) {
                    Text("1,254")
                        .fontWeight(.semibold)
                    Text("Following")
                }
                HStack(spacing: 4) {
                    Text("607")
                        .fontWeight(.semibold)
                    Text("Followers")
                }
            }
            .foregroundColor(.white)
        }
    }
}
