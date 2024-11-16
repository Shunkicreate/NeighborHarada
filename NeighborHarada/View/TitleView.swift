//
//  TitleView.swift
//  NeighborHarada
//
//  Created by Taishin Miyamoto on 2024/11/16.
//

import SwiftUI

struct TitleView: View {
    @StateObject private var gameState = GameState()
    @State private var navigatePath: [NavigationDestination] = []
    var body: some View {
        NavigationStack(path: $navigatePath) {
            VStack(spacing: 30) {
                Text("タイトルが入ります")
                    .font(.title)

                Button {
                    navigatePath.append(.host)
                } label: {
                    Text("ホスト")
                }
                .buttonStyle(.borderedProminent)

                Button {
                    navigatePath.append(.guest)
                } label: {
                    Text("ゲスト")
                }
                .buttonStyle(.borderedProminent)
            }
            .navigationDestination(for: NavigationDestination.self) { destination in
                switch destination {
                case .host: HostView(navigatePath: $navigatePath, gameState: gameState)
                case .guest: GuestView(navigatePath: $navigatePath, gameState: gameState)
                case .game: GameView(navigatePath: $navigatePath, gameState: gameState)
                case .result: ResultView(navigatePath: $navigatePath)
                }
            }
        }
    }
}

#Preview {
    TitleView()
}
