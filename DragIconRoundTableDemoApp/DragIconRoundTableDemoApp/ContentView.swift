//
//  ContentView.swift
//  DragIconRoundTableDemoApp
//
//  Created by nakamori.emiri on 2024/03/02.
//

import SwiftUI

struct ContentView: View {
    // ボタンの数
    let buttonCount = 6
    @State private var rotationAngle: Double = 0
    @State private var previousTranslation: CGFloat = 0
    @State var isShowPencil = false
    var body: some View {
        ZStack {
            // リボルバー
            if isShowPencil {
                ZStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        GeometryReader { geometry in
                            
                            ForEach(0..<buttonCount) { index in
                                // ボタンを配置する座標を計算する
                                let angle = 2 * .pi / Double(buttonCount) * Double(index) + rotationAngle
                                let radius: CGFloat = 100 // 円の半径
                                let centerX = geometry.size.width / 2 // GeometryReaderの中心のX座標
                                let centerY = geometry.size.height / 2 // GeometryReaderの中心のY座標
                                let buttonX = radius * cos(CGFloat(angle)) + centerX - 25 // ボタンのX座標（中心からのオフセットを考慮）
                                let buttonY = radius * sin(CGFloat(angle)) + centerY - 25 // ボタンのY座標（中心からのオフセットを考慮）
                                
                                Circle()
                                    .fill(.pink)
                                    .frame(width: 50, height: 50)
                                    .overlay(
                                        Text("\(index)") // ボタンに番号を表示
                                            .foregroundColor(.black)
                                    )
                                             
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .position(x: buttonX, y: buttonY)
                                    .onTapGesture {
                                        print("Button \(index) tapped")
                                        
                                    }
                                    .disabled(true)
                            }
                            
                        }
                        .offset(x: 160, y: 0)
                    }
                    .gesture(DragGesture(minimumDistance: 0.0)
                        .onChanged({ value in
                            let delta = value.translation.height - previousTranslation // 前回の変化量からの差分を取得
                            let angleDelta = Double(delta) / 100 // スワイプの量に応じて角度を調整
                            self.rotationAngle += angleDelta
                            self.previousTranslation = value.translation.height // 前回の変化量を更新
                        })
                            .onEnded({ _ in
                                self.previousTranslation = 0
                            }))
                    
                }
                .background(.yellow)
                .frame(width: 300, height: 300)
            }
            
            
            ZStack {
                Text("リボルバーの下半分を隠すviewです")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .frame(width: 300, height: 100)
                    .background(.orange)
                    .cornerRadius(10)
                
            }
            .padding(.top, 250)
            .frame(maxWidth: .infinity, maxHeight: 50)
            
            // えんぴつ
            ZStack {
                Button() {
                    withAnimation {
                        isShowPencil.toggle()
                    }
                    
                } label: {
                    Text("えんぴつ")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(.green)
                        .cornerRadius(10)
                    
                }
            }
            .padding(.top, 20)
            
            // 広告
            ZStack {
                Text("広告です")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .frame(width: 320, height: 50)
                    .background(.gray)
                
                    .cornerRadius(10)
                
            }
            .padding(.top, 100)
            .frame(width: 320, height: 50)
        }
        .padding(.top, 600)

    }
}

#Preview {
    ContentView()
}
