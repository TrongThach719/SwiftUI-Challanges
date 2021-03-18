//
//  ContentView.swift
//  ProfilePage
//
//  Created by Thach Nguyen Trong on 01/31/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Profile()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct Profile: View {
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                HStack {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image("menu")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 20, height: 20)
                    })
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image("close")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 20, height: 20)
                    })
                    
                }
                
                Spacer()
                
                ZStack(alignment: .top) {
                    
                    VStack {
                        
                        HStack {
                            
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Bella,")
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                Text("25")
                            }
                            Spacer()
                            
                            HStack {
                                Image("map")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                Text("8 Miles")
                            }
                            .padding(8)
                            .background(Color.black.opacity(0.1))
                            .cornerRadius(10)
                        }
                        .padding(.top, 35)
                        
                        Text("Hi! My name is Bella. I live in New Orleans. I love traveling and adventure. I like sharing my thoughts and adore people who except me the way I am. I see the world in different a way and I m always positive.")
                            .padding(.top)
                    }
                    .padding()
                    .background(BlurView(style: .systemUltraThinMaterialLight))
                    .clipShape(ButtonShape())
                    .cornerRadius(25)
                    
                    ZStack {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                           Image("play")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 20, height: 20)
                            .padding(20)
                            .background(Color.white)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        })
                        Circle()
                            .stroke(Color.yellow, lineWidth: 5)
                            .frame(width: 70, height: 70)
                    }
                    .offset(y: -35)
                    
                    HStack {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image("heart")
                                .resizable()
                                .renderingMode(.original)
                                .frame(width: 25, height: 20)
                                .padding()
                                .background(Color.white)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            
                        })
                        Spacer()
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image("smile")
                                .resizable()
                                .renderingMode(.original)
                                .frame(width: 25, height: 25)
                                .padding()
                                .background(Color.white)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            
                        })
                    }
                    .offset(y: -30)
                    .padding(.horizontal,35)
                }
                
            }.padding()
        }
    }
}

struct ButtonShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addArc(center: CGPoint(x: rect.midX, y: 0), radius: 42, startAngle: .zero, endAngle: .degrees(180), clockwise: false)
            path.closeSubpath()
        }
    }
}

struct BlurView: UIViewRepresentable {
    let style: UIBlurEffect.Style
    
    func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurView, at: 0)
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
        return view
    }
    
    func updateUIView(_ uiView: UIView,
                      context: UIViewRepresentableContext<BlurView>) {
        
    }
}
