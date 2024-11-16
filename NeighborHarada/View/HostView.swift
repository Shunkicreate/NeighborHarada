//
//  HostView.swift
//  NeighborHarada
//
//  Created by Taishin Miyamoto on 2024/11/16.
//

import SwiftUI

struct HostView: View {
    @Binding var navigatePath: [NavigationDestination]
    @ObservedObject var gameState: GameState
    @StateObject private var hostViewModel = HostViewModel()
    
    @State private var isPleaseWaitAlertActive = false
    @State private var isShakeHandsComplete = false
    
    var body: some View {
        VStack(spacing: 30) {
            Text("HostView（ここでマッチングを行う）")
            
            // P2P demo
            Spacer()
            List(hostViewModel.peers, id: \.self) { peer in
                HStack {
                    Image(systemName: "iphone.gen1")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    
                    Text(peer.peerId.displayName)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.vertical, 5)
                .onTapGesture {
                    hostViewModel.invite(_selectedPeer: PeerDevice(peerId: peer.peerId))
                }
            }
            Button {
                if (!hostViewModel.isParticipantsJoined()) {
                    isPleaseWaitAlertActive = true
                    return
                }
                isShakeHandsComplete = true
                hostViewModel.join()
                gameState.setProperties(_session: hostViewModel.gameState.session!, _ballState: hostViewModel.gameState.ballState!)
                navigatePath.append(.game)
            } label: {
                Text("ゲームを開始する（仮）（ここでマッチングを行う）")
            }
            .buttonStyle(.borderedProminent)
        }.alert(isPresented: $isPleaseWaitAlertActive, content: {
            Alert(
                title: Text("Any device is not ready. Please wait."),
                dismissButton: .default(Text("OK"), action: {
                    isPleaseWaitAlertActive = false
                })
            )
        })
    }
}


#Preview {
    //    HostView(navigatePath: .constant([]))
}
