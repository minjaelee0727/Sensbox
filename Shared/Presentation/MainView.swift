//
//  MainView.swift
//  Sensbox
//
//  Created by Min Jae Lee on 2021-10-02.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var session: SessionService
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Text("메인 스마트폰을 선택해주세요.")
                        .foregroundColor(.white)
                        .font(.callout)
                    
                    Text("모든 조작을 담당하며, 데이터를 표시합니다.")
                        .foregroundColor(.white)
                        .font(.callout)
                    
                    NavigationLink(destination: RemoconView()) {
                        Text("리모컨")
                            .foregroundColor(Color(remoconColor))
                            .frame(width: screenWidth * 0.25, height: screenWidth * 0.25)
                            .background(Circle().foregroundColor(.white))
                            .padding(screenWidth * 0.06)
                            .background(Circle().foregroundColor(Color(remoconColor)))
                    }
                }
                .background(
                    Circle()
                        .frame(width: screenWidth * 2, height: screenWidth * 2)
                        .foregroundColor(Color(remoconColor))
                        .offset(y: screenWidth * -0.9)
                        .shadow(color: .gray, radius: 3, x: 0, y: 0)
                )
                
                Spacer()
                
                Button(action: {
                    self.session.logout()
                }) {
                    Image("SensboxIotLogoImage")
                        .resizable()
                        .frame(width: screenWidth * 0.5, height: screenWidth * 0.4)
                        .scaledToFit()
                        .background(Circle().foregroundColor(.white)                    .shadow(color: Color(UIColor(hexString: "#3b65f7")), radius: 15, x: 0, y: 0))
                }

                Spacer()
                
                VStack {
                    Text("센서")
                        .foregroundColor(Color(sensorColor))
                        .frame(width: screenWidth * 0.25, height: screenWidth * 0.25)
                        .background(Circle().foregroundColor(.white))
                        .padding(screenWidth * 0.06)
                        .background(Circle().foregroundColor(Color(sensorColor)))
                    
                    
                    Text("서브 스마트폰을 선택해주세요")
                        .foregroundColor(.white)
                        .font(.callout)
                    
                    Text("키트에 장착되어 데이터를 수집합니다.")
                        .foregroundColor(.white)
                        .font(.callout)
                }
                .background(
                    Circle()
                        .frame(width: screenWidth * 2, height: screenWidth * 2)
                        .foregroundColor(Color(sensorColor))
                        .offset(y: screenWidth * 0.9)
                        .shadow(color: .gray, radius: 3, x: 0, y: 0)
                )
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
