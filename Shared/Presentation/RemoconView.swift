//
//  RemoconView.swift
//  Sensbox
//
//  Created by Min Jae Lee on 2021-10-10.
//

import SwiftUI

struct RemoconView: View {
    var body: some View {
        VStack {
            RemoconHeader()
            
            Spacer()
            
            VStack(alignment: .center, spacing: screenWidth * 0.05) {
                HStack {
                    KitButton(kitNumber: 1, kitName: "IoT 가스밸브", kitSelected: true)
                    
                    KitButton(kitNumber: 2, kitName: "IoT 금고", kitSelected: false)
                }
                
                HStack {
                    KitButton(kitNumber: 3, kitName: "IoT 스피커", kitSelected: false)

                    KitAddButton()
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        Image(systemName: "chart.xyaxis.line")
                            .foregroundColor(.white)
                            .padding(.bottom)
                                            
                        Text("실험실")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                        
                        Text("나만의 키트 만들기")
                            .foregroundColor(.white)
                            .font(.caption)
                    }
                    
                    Spacer()
                }
                .padding()
                .background(
                    Color.black.opacity(0.75)
                )
                .cornerRadius(15)
                .padding(.horizontal)
            }
            .frame(width: screenWidth * 0.8)
            
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

struct RemoconHeader: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        HStack {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.backward")
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            Text("리모컨")
                .font(.title2)
                .foregroundColor(.white)
                .bold()
            
            Spacer()
            
            Image(systemName: "info.circle")
                .foregroundColor(.white)
        }
        .padding()
        .padding(.horizontal)
        .background(
            Circle()
                .offset(y: screenHeight * -0.93)
                .frame(width: screenHeight * 2, height: screenHeight * 2)
                .foregroundColor(Color(remoconColor))
        )
        .shadow(color: .gray, radius: 10, x: 0, y: 0)
    }
}

struct KitButton: View {
    let kitNumber: Int
    let kitName: String
    let kitSelected: Bool
    
    var body: some View {
        NavigationLink(destination: KitView()){
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    
                    Image(systemName: kitSelected ? "checkmark.circle" : "circle")
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                Text("키트 " + String(kitNumber))
                    .foregroundColor(.white)
                    .font(.callout)
                
                Text(kitName)
                    .font(.headline)
                    .foregroundColor(.white)
                    .bold()
            }
            .padding()
            .background(
                Color(UIColor(hexString: "#f24d74f7"))
            )
            .cornerRadius(15)
            .frame(width: screenWidth * 0.35, height: screenWidth * 0.43)
        }
    }
}

struct KitAddButton: View {
    var body: some View {
        Button(action: {}) {
            HStack(alignment: .center) {
                Image(systemName: "plus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenWidth * 0.08, height: screenWidth * 0.08)
                    .foregroundColor(.white)
                    
            }
            .frame(width: screenWidth * 0.35, height: screenWidth * 0.43)
            .background(Color.gray.opacity(0.7))
            .cornerRadius(15)
        }
    }
}

struct RemoconView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
