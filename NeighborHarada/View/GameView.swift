import SwiftUI

struct GameView: View {
    @Binding var navigatePath: [NavigationDestination]
    
    // グリッドの列数を設定
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()),
                   GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    // 6x13 の二次元配列を作成し、すべての値を 1 にする
    var block_type_list: [[Int]] = Array(repeating: Array(repeating: 1, count: 13), count: 6)

    var body: some View {
        // GeometryReaderを使って画面の横幅を取得
        GeometryReader { geometry in
            VStack(spacing: 1) {  // 画像グリッドとボタンの間に少し間隔を追加
//                Text("GameView（ここはクリア or ゲームオーバー）")
//                    .font(.title)  // 見出しのフォントサイズ調整
                
                // 6列のグリッドを使って画像を表示
                LazyVGrid(columns: columns, spacing: 0) {
                    // 6行13列の二次元配列を表示
                    ForEach(0..<6) { rowIndex in
                        ForEach(0..<13) { columnIndex in
                            // `block_type_list` の値に応じて画像を表示
                            if block_type_list[rowIndex][columnIndex] == 1 {
                                Image("block_normal") // 1の場合は block_normal を表示
                                    .resizable()
                                    .scaledToFill() // ここで画像をフレームにぴったり合わせる
                                    .frame(
                                        width: max((geometry.size.width / 6) - 0, 1), // 最小値を1にしてゼロ以下にしない
                                        height: max((geometry.size.width / 6) - 5, 1) // 最小値を1にしてゼロ以下にしない
                                    )
                                    .clipped() // 画像がフレームからはみ出ないように切り取る
                            } else {
                                // 1以外の時は何も表示しない場合
                                Color.clear
                            }
                        }
                    }
                }
                .padding(.horizontal, 0) // グリッドに横方向の余白を追加しない

                // ゲーム終了ボタン
                Button {
                    navigatePath.append(.result)
                } label: {
                    Text("ゲームを終了する")
                        .font(.headline) // ボタンテキストのフォントサイズ調整
                        .padding(.vertical, 12) // ボタンの上下に余白を追加
                }
                .buttonStyle(.borderedProminent)
                .frame(maxWidth: .infinity) // ボタンを横幅いっぱいに広げる
                .padding(.horizontal, 20) // ボタンの横方向の余白
            }
        }
        .edgesIgnoringSafeArea(.all) // SafeAreaを無視して全画面表示
    }
}

#Preview {
    GameView(navigatePath: .constant([]))
}
