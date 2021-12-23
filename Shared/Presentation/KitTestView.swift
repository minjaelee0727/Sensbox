//
//  KitTestView.swift
//  Sensbox
//
//  Created by Min Jae Lee on 2021-10-10.
//

import SwiftUI

struct KitTestView: View {
    @EnvironmentObject var session: SessionService
    @StateObject var kitTestVM: KitTestViewModel = KitTestViewModel()
    
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.8)
                .edgesIgnoringSafeArea([.top, .bottom])
            
            VStack(alignment: .center) {
                KitTestHeader()

                Spacer()
                
                VStack(alignment: .leading) {
                    Text("센서 측정값")
                        .bold()
                        .foregroundColor(.white)

                    HStack {
                        Image(systemName: "checkmark")
                            .foregroundColor(Color(remoconColor))
                        
                        HStack(spacing: 3) {
                            Text("근접")
                                .font(.headline)
                                .minimumScaleFactor(0.5)
                                .lineLimit(1)
                                .foregroundColor(Color(remoconColor))
                        
                            Text("센서")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        
                        Spacer()
                        
                        Text("함숫값")
                            .foregroundColor(Color(remoconColor))
                            .font(.caption)
                            .lineLimit(1)
                            .padding(.vertical, 3)
                            .padding(.horizontal, 8)
                            .background(Capsule().foregroundColor(Color(remoconColor)).opacity(0.3))
                        
                        HStack(spacing: 0) {
                            Text("10cm")
                                .font(.title3)
                                .fontWeight(.black)
                            
                            Image(systemName: "arrow.down")
                                .foregroundColor(Color(remoconColor))
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(15)
                    
                    HStack {
                        Image(systemName: "checkmark")
                            .foregroundColor(Color(remoconColor))
                        
                        HStack(spacing: 3) {
                            Text("자이로")
                                .font(.headline)
                                .foregroundColor(Color(remoconColor))
                                .minimumScaleFactor(0.5)
                                .lineLimit(1)
                            
                            Text("센서")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        
                        Spacer()
                        
                        HStack(spacing: 8) {
                            HStack(spacing: 3) {
                                Text("x")
                                    .font(.caption2)
                                    .padding(5)
                                    .background(Circle().foregroundColor(Color(remoconColor)).opacity(0.3))
                                    .foregroundColor(Color(remoconColor))
                                
                                Text("43")
                                    .fontWeight(.black)
                            }
                            
                            HStack(spacing: 3) {
                                Text("y")
                                    .font(.caption2)
                                    .padding(5)
                                    .background(Circle().foregroundColor(Color(remoconColor)).opacity(0.3))
                                    .foregroundColor(Color(remoconColor))
                                
                                Text("25")
                                    .fontWeight(.black)
                            }

                            HStack(spacing: 3) {
                                Text("z")
                                    .font(.caption2)
                                    .padding(5)
                                    .background(Circle().foregroundColor(Color(remoconColor)).opacity(0.3))
                                    .foregroundColor(Color(remoconColor))

                                Text("5")
                                    .fontWeight(.black)

                            }
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(15)
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("시뮬레이션")
                        .foregroundColor(.white)
                        .bold()

                    ZStack(alignment: .bottomTrailing) {
                        Button(action: {}) {
                            Image(systemName: "magnifyingglass.circle.fill")
                                .resizable()
                                .frame(width: screenWidth * 0.15, height: screenWidth * 0.15)
                                .foregroundColor(Color(remoconColor))
                                .background(Circle()                                .frame(width: screenWidth * 0.14, height: screenWidth * 0.14).foregroundColor(.white))
                        }
                        .padding()
                        
                        Image("Kit2TestLockerImage")
                            .resizable()
                            .scaledToFit()
                            .padding()
                            .clipShape(Circle())
                            .shadow(color: Color(remoconColor), radius: 60, x: 0, y: 0)
                    }
                }
                
                Spacer()
            }
            .frame(width: screenWidth * 0.8)
            .navigationBarHidden(true)
//            .onAppear{
//                self.kitTestVM.setup(self.session)
//              }
        }
    }
}

struct KitTestHeader: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        HStack {
            Text("작동 테스트")
                .foregroundColor(.white)
                .font(.title3)
            
            Spacer()
            
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.title3)
            }
        }
    }
}
struct KitTestView_Previews: PreviewProvider {
    static var previews: some View {
        KitTestView()
    }
}
