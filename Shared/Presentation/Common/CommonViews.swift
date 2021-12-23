//
//  CommonViews.swift
//  Sensbox (iOS)
//
//  Created by Min Jae Lee on 2021-11-15.
//

import SwiftUI

// MARK: CustomTextField
struct CustomTextField: View {
    private var prompt: String
    @Binding var input: String
    let fieldHeight: CGFloat = 60
    let cornerRadius: CGFloat = 10
    let lineWidth: CGFloat = 0.8
    private var forcedPlaceHolder: String
    private var maximumLength: Int
    private var keyboardType: UIKeyboardType
    private var uppercaseOnly: Bool
    private var lowercaseOnly: Bool
    private var strokeColor: Color
    
    init(_ prompt: String, input: Binding<String>, forcedPlaceHolder: String = "", maximumLength: Int = 999, keyboardType: UIKeyboardType = .default, uppercaseOnly: Bool = false, lowercaseOnly: Bool = false, strokeColor : Color = Color.gray) {
        self.prompt = prompt
        self._input = input
        self.forcedPlaceHolder = forcedPlaceHolder
        self.maximumLength = maximumLength
        self.keyboardType = keyboardType
        self.uppercaseOnly = uppercaseOnly
        self.lowercaseOnly = lowercaseOnly
        self.strokeColor = strokeColor
    }
    
    var body: some View {
        HStack {
            let binding = Binding<String>(get: {
                self.input
            }, set: {
                self.input = $0
                if (input.count > maximumLength) {
                    input = String(input.dropLast())
                }
                if (lowercaseOnly) {
                    input = input.lowercased()
                }
            })
            
            Image(systemName: "envelope")
                .foregroundColor(.gray)
            
            ZStack(alignment: .leading){
                if (input.isEmpty) {
                    Text(prompt)
                        .foregroundColor(.secondary)
                        .opacity(0.5)
                }
                
                TextField("", text: binding)
                    .keyboardType(keyboardType)
                    .disableAutocorrection(true)
                    .autocapitalization(uppercaseOnly ? .allCharacters : .words)
                
                if (!forcedPlaceHolder.isEmpty) {
                    Text(forcedPlaceHolder)
                        .foregroundColor(.primary)
                }
            }
        }
        .padding()
        .frame(height: fieldHeight)
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(cornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius).stroke(strokeColor, lineWidth: lineWidth)
        )
    }
}


struct PasswordTextField_Secure: View {
    private var prompt: String
    @Binding var password: String
    @State private var isSecured: Bool = true
    let eyeButtonWidth: CGFloat = 18
    let eyeButtonHeight: CGFloat = 13
    let fieldHeight: CGFloat = 60
    let cornerRadius: CGFloat = 10
    let lineWidth: CGFloat = 0.8
    private let strokeColor: Color
    
    init(_ prompt: String, password: Binding<String>, strokeColor: Color = Color.gray) {
        self.prompt = prompt
        self._password = password
        self.strokeColor = strokeColor
    }
    
    var body: some View {
        HStack{
            Image(systemName: "lock")
                .foregroundColor(.gray)
            
            if isSecured {
                SecureField(prompt, text: $password)
            } else {
                TextField(prompt, text: $password)
            }
            
            if (!password.isEmpty) {
                Button(action: {
                    isSecured.toggle()
                }) {
                    Image(systemName: self.isSecured ? "eye.slash" : "eye")
                        .resizable()
                        .accentColor(.primary)
                        .frame(width: eyeButtonWidth, height: eyeButtonHeight)
                }
            }
        }
        .padding()
        .frame(height: fieldHeight)
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(cornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius).stroke(strokeColor, lineWidth: lineWidth)
        )
    }
}
