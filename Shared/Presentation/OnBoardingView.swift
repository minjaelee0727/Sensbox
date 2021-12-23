//
//  OnBoarding.swift
//  Sensbox
//
//  Created by Min Jae Lee on 2021-10-02.
//

import SwiftUI

struct OnBoardingView: View {
    @AppStorage(AppStorageData.DID_LAUNCH_BEFORE) private var didLaunchBefore = false
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Text("sensbox")
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button(action: {}) {
                    Text("건너뛰기")
                        .fontWeight(.thin)
                        .padding(7)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue)
                        )
                }
            }
            .padding()
            
            Spacer()
            
            Image("OnBoardingImage1")
                .resizable()
                .frame(width: screenWidth * 0.7, height: screenWidth * 0.6)
                .scaledToFill()
                .padding()
            
            VStack(spacing: 5) {
                Text("크라프트 키트 조립을 통한")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                Text("공간지각적 창의력 함양")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
            .padding(.vertical)

            VStack(spacing: 3) {
                Text("만들기를 하면서 입체에 대한")
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(.secondary)
                
                Text("이해가 높아지고, 새로운 형태를 만드는")
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(.secondary)
                
                Text("창의력을 기를 수 있어요!")
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(.secondary)
            }

            
            Spacer()
            
            Button(action: {
                self.didLaunchBefore = true
            }){
                Text("시작하기")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(RoundedRectangle(cornerRadius: 25).foregroundColor(Color(UIColor(hexString: "#3b65f7"))))
            }
            
            Spacer()
        }
        .padding()
    }
}

struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
