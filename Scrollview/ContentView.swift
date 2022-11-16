//
//  ContentView.swift
//  Scrollview
//
//  Created by robert on 2022/11/16.
//

import SwiftUI

struct ContentView: View {
    
    @State private var opacity: Double = 0
    @State private var defaultY: CGFloat = 0
    
    var body: some View {
        
        ZStack{
            Color.cyan
                .ignoresSafeArea()
            
            ScrollView{
                GeometryReader{ geo in
                    Rectangle()
                        .frame(width: 0,height: 0)
                        .onAppear(perform: {
                            self.defaultY = geo.frame(in: .global).midY
                        })
                        .onChange(of: geo.frame(in: .global).midY) { midY in
                            print("midY value: \(midY)")
                            self.opacity = abs((midY - defaultY)/100)
                        }
                }
                VStack{
                    Rectangle()
                        .frame(width: 100, height: 200)
                        .cornerRadius(20)
                        .foregroundColor(.orange)
                        .padding()
                    
                    Circle()
                        .frame(width: 100, height: 140)
                        .cornerRadius(20)
                        .foregroundColor(.green)
                        .padding()
                    
                    Ellipse()
                        .frame(width: 200, height: 140)
                        .cornerRadius(20)
                        .foregroundColor(.blue)
                        .padding()
                    
                    Capsule()
                        .frame(width: 100, height: 240)
                        .cornerRadius(20)
                        .foregroundColor(.purple)
                        .padding()
                    
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 100, height: 100)
                        .foregroundColor(.yellow)
                        .padding()
                    
                }
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
