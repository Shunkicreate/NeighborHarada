//
//  GameView.swift
//  NeighborHarada
//
//  Created by Taishin Miyamoto on 2024/11/16.
//

import SwiftUI

struct GameView: View {
    @Binding var navigatePath: [NavigationDestination]
    
    @ObservedObject var gameState: GameState
    @StateObject private var gameViewModel = GameViewModel()
    
    var body: some View {
        ZStack {
            VStack(spacing: 30) {
                Text("GameView（ここはクリア or ゲームオーバー）")
                
                Button {
                    navigatePath.append(.result)
                } label: {
                    Text("ゲームを終了する")
                }
                .buttonStyle(.borderedProminent)
            }
            
            // 背景色
            // 指が動く位置に追従する円
            Circle()
                .fill(Color.blue)
                .frame(width: 50, height: 50)
                .position(CGPoint(x: gameState.ballState!.position.x, y: gameState.ballState!.position.y))
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            // ドラッグ中の位置をcirclePositionに更新
                            let ballPosition = BallPosition(x: Int(value.location.x), y: Int(value.location.y))
                            gameViewModel.updateBallState(gameState: gameState, newBallState: BallState(position: ballPosition))
                        }
                )
        }
    }
}

#Preview {
    //    GameView(navigatePath: .constant([]))
}
