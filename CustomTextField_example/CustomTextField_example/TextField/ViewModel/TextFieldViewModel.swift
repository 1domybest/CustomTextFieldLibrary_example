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

class TextFieldViewModel: ObservableObject {
    var keyboardManager: KeyboardManager?
    /* 텍스트 필드 */
    var textFieldView: SingleTextFieldContentView?
    @Published var textFieldText:String = "" // 제목 텍스트
    
    
    init() {
        self.keyboardManager = KeyboardManager()
        self.keyboardManager?.setCallback(callback: self)
        self.initializeField()
    }
    
    func initializeField () {

        var textFieldOption = SingleTextFieldOption()
        textFieldOption.font = UIFont.systemFont(ofSize: 14)
        textFieldOption.textColor = .white
        textFieldOption.backgroundColor = .blue
        textFieldOption.placeholder = "텍스트 필드 플레이스 홀더"
        textFieldOption.placeholderColor = .black
        textFieldOption.leftPadding = 14
        textFieldOption.placeholderColor = .white.withAlphaComponent(0.5)
        textFieldOption.borderStyle = .none
        textFieldOption.onTextChanged = { [ weak self ] text in
            guard let self = self else { return }
            self.textFieldText = text
        }

        self.textFieldView = SingleTextFieldContentView(singleTextFieldOption: textFieldOption)
    }
    
    func deactivateTextField() {
        self.textFieldView?.deactivate()
    }
    
    func activateTextField() {
        self.textFieldView?.activate()
    }
    
}

extension TextFieldViewModel: KeyboardManangerProtocol {
    func keyBoardWillShow(notification: NSNotification, keyboardHeight: CGFloat) {
        print("키보드 열림 높이: \(keyboardHeight)")
    }
    
    func keyBoardWillHide(notification: NSNotification) {
        print("키보드 닫힘 높이: \(0)")
    }
}
