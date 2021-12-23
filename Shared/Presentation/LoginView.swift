//
//  LoginView.swift
//  Sensbox
//
//  Created by Min Jae Lee on 2021-10-11.
//

import SwiftUI

struct LoginView: View {
    @StateObject var loginVM: LoginViewModel = LoginViewModel()
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            
            Text("시작하기")
                .foregroundColor(Color(UIColor(hexString: "#3b65f7")))
                .fontWeight(.bold)
                .font(.title)
            
            Spacer()
            
            CustomTextField("이메일", input: self.$loginVM.email, keyboardType: .emailAddress, lowercaseOnly: true)
                .frame(width: screenWidth * 0.85)
            PasswordTextField_Secure("비밀번호", password: self.$loginVM.password)
                .frame(width: screenWidth * 0.85)
            
            if !self.loginVM.errMsg.isEmpty {
                Text(self.loginVM.errMsg)
                    .foregroundColor(.red)
            }
            
            Button(action: {
                
            }) {
                Text("비밀번호 찾기")
                    .foregroundColor(.secondary)
                    .padding(.top)
            }

            Spacer()
            
            Button(action: {
                self.loginVM.login()
            }){
                HStack(spacing: 10) {
                    Image(systemName: "arrow.forward")
                        .foregroundColor(.white)
                    
                    Text("로그인")
                        .foregroundColor(.white)
                }
                .frame(width: screenWidth * 0.8)
                .padding(.vertical)
                .background(
                    RoundedRectangle(cornerRadius: 25).foregroundColor(.blue)
                )
            }
            .padding(.bottom, screenWidth * 0.1)
            
            Button(action: {

            }){
                HStack(spacing: 10) {
                    Text("계정 만들기")
                        .foregroundColor(.secondary)
                }
                .frame(width: screenWidth * 0.8)
                .padding(.vertical)
                .background(
                    RoundedRectangle(cornerRadius: 25).foregroundColor(.gray).opacity(0.2)
                )
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
