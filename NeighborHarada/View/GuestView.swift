//
//  GuestView.swift
//  NeighborHarada
//
//  Created by Taishin Miyamoto on 2024/11/16.
//

import SwiftUI

struct GuestView: View {
    @Binding var navigatePath: [NavigationDestination]
    @ObservedObject var gameState: GameState
    @StateObject private var guestViewModel = GuestViewModel()
    
    @State private var isJoined = false
    
    var body: some View {
        VStack(spacing: 30) {
            Text("GuestView（ここでマッチングを行う）")
            
            // P2P demo
            Spacer()
            VStack {
                if !isJoined {
                    Text("Matchig")
                } else {
                    Text("You are Matched!")
                    Button {
                        gameState.setProperties(_session: guestViewModel.gameState.session!, _ballState: guestViewModel.gameState.ballState!)
                        navigatePath.append(.game)
                    } label: {
                        Text("ゲームを開始する（仮）")
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }.alert(item: $guestViewModel.permissionRequest, content: { request in
            Alert(
                title: Text("Do you want to join \(request.peerId.displayName)"),
                primaryButton: .default(Text("Yes"), action: {
                    request.onRequest(true)
                    guestViewModel.join(peer: PeerDevice(peerId: request.peerId))
                    isJoined = true
                }),
                secondaryButton: .cancel(Text("No"), action: {
                    request.onRequest(false)
                })
            )
        })
    }
}

#Preview {
//    GuestView(navigatePath: .constant([]))
}
