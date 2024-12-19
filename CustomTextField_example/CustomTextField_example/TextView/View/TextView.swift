//
//  TextView.swift
//  CustomTextField_example
//
//  Created by 온석태 on 12/19/24.
//

import Foundation
import SwiftUI

struct TextView: View {
    @ObservedObject var vm: TextViewModel = TextViewModel()
    
    var body: some View {
        VStack(spacing: 10) {
            HStack(spacing: 10) {
                Button(action: {
                    self.vm.deactivateTextView()
                }, label: {
                    Text("텍스트 뷰 비활성화 하기")
                        .foregroundColor(.white)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 15)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.red)
                        )
                })
                
                Button(action: {
                    self.vm.activateTextView()
                }, label: {
                    Text("텍스트 뷰 활성화 하기")
                        .foregroundColor(.white)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 15)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.blue)
                        )
                })
            }
            UIKitViewRepresentable(view: self.vm.textViewView)
                .frame(height: self.vm.textViewHeight)
        }
        
    }
}

