//
//  TextViewModel.swift
//  CustomTextField_example
//
//  Created by 온석태 on 12/19/24.
//

import Foundation
import UIKit
import CustomTextFieldLibrary
import KeyboardManager

class TextViewModel: ObservableObject {
    var keyboardManager: KeyboardManager?
    /* 텍스트 뷰 */
    var textViewView: SingleTextViewContentView?
    @Published var textViewHeight:CGFloat = 40 // 웰컴코멘트 동적 높이Add missing conformance to 'KeyboardManangerProtocol' to class 'TextViewModel'
    @Published var textViewText:String = "" // 웰컴코멘트 텍스트
    
    
    init() {
        self.keyboardManager = KeyboardManager()
        self.keyboardManager?.setCallback(callback: self)
        self.initializeField()
    }
    
    func initializeField () {

        var textViewOption = SingleTextViewOption()
        textViewOption.backgroundColor = .clear
        textViewOption.textColor = .white
        textViewOption.placeholder = "텍스트 뷰 플레이스 홀더"
        textViewOption.backgroundColor = .brown
        textViewOption.placeholderColor = .black
        textViewOption.enableAutoHeight = true
        textViewOption.minHeight = 40
        textViewOption.maxHeight = 72
        textViewOption.maximunLenght = 1000
        textViewOption.font = UIFont.systemFont(ofSize: 14)
        textViewOption.horizontalPadding = 14
        textViewOption.verticalPadding = 11
        textViewOption.onChangeHeight = {[ weak self ]  height in
            guard let self = self else { return }
            self.textViewHeight = height
        }
        
        textViewOption.onTextChanged = {[ weak self ]  text in
            guard let self = self else { return }
            self.textViewText = text
        }

        self.textViewView = SingleTextViewContentView(singleTextViewOption: textViewOption)
    }
    
    
    func deactivateTextView() {
        self.textViewView?.deactivate()
    }
    
    func activateTextView() {
        self.textViewView?.activate()
    }
}


extension TextViewModel: KeyboardManangerProtocol {
    func keyBoardWillShow(notification: NSNotification, keyboardHeight: CGFloat) {
        print("키보드 열림 높이: \(keyboardHeight)")
    }
    
    func keyBoardWillHide(notification: NSNotification) {
        print("키보드 닫힘 높이: \(0)")
    }
}
