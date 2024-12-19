//
//  ContentView.swift
//  CustomTextField_example
//
//  Created by 온석태 on 12/19/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Spacer()
                    
                    NavigationLink(destination: LazyView(TextFieldView())) {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.blue)
                            .frame(width: 200, height: 100)
                            .overlay(
                                Text("텍스트 필드")
                                    .bold()
                                    .foregroundColor(.white)
                            )
                    }
                    
                    Spacer().frame(height: 30)
                    
                    NavigationLink(destination: LazyView(TextView())) {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.red)
                            .frame(width: 200, height: 100)
                            .overlay(
                                Text("텍스트 뷰")
                                    .bold()
                                    .foregroundColor(.white)
                            )
                    }
                    
                    Spacer()
                }
            }
            
        }
    }
}
