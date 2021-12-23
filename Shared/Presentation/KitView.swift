//
//  KitView.swift
//  Sensbox
//
//  Created by Min Jae Lee on 2021-10-10.
//

import SwiftUI

struct KitView: View {
    var body: some View {
        ZStack {
            Color(UIColor(hexString: "#f6f9fd"))
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center) {
                KitHeader()
                    .frame(width: screenWidth * 0.8)
                
                HStack {
                    Image("Kit2BoxImage")
                        .resizable()
                        .scaledToFill()
                    
                    VStack(alignment: .leading, spacing: 7) {
                        Spacer()
                        
                        Text("열림/이동 감지 스마트 금고")
                            .font(.headline)
                            .bold()
                            .foregroundColor(.primary)
                        
                        HStack(spacing: 5) {
                            Image(systemName: "clock")
                                .font(.caption2)
                                .foregroundColor(Color(remoconColor))
                            
                            Text("약 30분")
                                .font(.caption2)
                                .foregroundColor(Color(remoconColor))
                        }
                        
                        HStack {
                            
                            Text("난이도")
                                .foregroundColor(Color(remoconColor))
                                .font(.caption)
                                .padding(.top, 3)
                            
                            
                        }
                        
                        HStack(spacing: 5) {
                            Text("제작 가이드 영상")
                                .foregroundColor(.secondary)
                                .font(.caption)

                            Image(systemName: "chevron.forward.circle")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        .padding(.top, 3)
                        
                        Spacer()
                    }
                    .offset(x: screenWidth * -0.05)
                }
                .offset(x: screenWidth * -0.05)
                .frame(width: screenWidth * 0.8, height: screenHeight * 0.35)
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("키트 소개")
                        .font(.headline)
                        .bold()
                    
                    Text("IoT 금고는 근접센서와 자이로센서를 활용하여 수집한 데이터로 금고 문의 열림 유무, 위치 이동, 외부 침입 시도 등을 감지합니다. 키트를 통해 사용할 수 있는 금고를 제작하여, 나에게 소중한 물건들을 보관하고 지킬 수 있습니다.")
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundColor(.black.opacity(0.6))
                        .lineLimit(5)
                        .minimumScaleFactor(0.1)
                }
                .padding(.vertical)
                .frame(width: screenWidth * 0.8)
                
                Spacer()

                VStack(alignment: .center, spacing: 5) {
                    Text("사용 센서")
                        .font(.headline)
                        .bold()
                        .frame(width: screenWidth * 0.8, alignment: .leading)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            SensorBox(sensorName: "근접", sensorDescription: "대상과 얼마나 가깝게 있는지 거리 수집")
                            SensorBox(sensorName: "자이로", sensorDescription: "대상과 얼마나 가깝게 있는지 거리 수집")
                            SensorBox(sensorName: "근접", sensorDescription: "대상과 얼마나 가깝게 있는지 거리 수집")
                        }
                        .offset(x: screenWidth * 0.1)
                    }
                }
                
                Spacer()
                
                NavigationLink(destination: KitTestView()) {
                    Text("작동 테스트 시작하기")
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: screenWidth * 0.8)
                        .background(Capsule()
                                        .foregroundColor(Color(remoconColor)))
                }
                .frame(width: screenWidth * 0.8)
            }
            .navigationBarHidden(true)
            .background(
                Circle()
                    .strokeBorder(Color(UIColor(hexString: "#4d6182f7")),lineWidth: 1)
                    .frame(width: screenHeight, height: screenHeight)
                    .background(Circle().foregroundColor(Color.white))
                    .offset(y: screenWidth * 0.75)
            )
        }
    }
}

struct SensorBox: View {
    let sensorName: String
    let sensorDescription: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack(spacing: 3) {
                Image(systemName: "checkmark")
                    .foregroundColor(Color(remoconColor))
                    .font(.callout)

                Text(sensorName)
                    .foregroundColor(Color(remoconColor))
                    .fontWeight(.semibold)
                    .font(.callout)
                
                Text("센서")
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .font(.callout)
            }
            
            Text(sensorDescription)
                .font(.caption)
                .fontWeight(.regular)
                .foregroundColor(.gray)
                .minimumScaleFactor(0.1)
                .lineLimit(2)
        }
        .frame(width: screenWidth * 0.3)
        .padding(10)
        .background(RoundedRectangle(cornerRadius: 15).stroke(Color(UIColor(hexString: "#4d6182f7"))).shadow(color: Color(UIColor(hexString: "#4d6182f7")), radius: 1, x: 0, y: 0))
    }
}

struct KitHeader: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        HStack {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.backward.circle.fill")
                    .foregroundColor(Color(remoconColor))
                    .font(.title)
            }
            
            Spacer()
            
            Text("IoT 금고")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            Spacer()
            
            Image(systemName: "info.circle")
                .foregroundColor(.primary)
                .font(.title2)
        }
    }
}

struct KitView_Previews: PreviewProvider {
    static var previews: some View {
        KitView()
    }
}
