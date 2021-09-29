//
//  GameView.swift
//  tic-tac-toe
//
//  Created by Rick Brown on 29/09/2021.
//

import SwiftUI

struct GameView: View {
  @StateObject private var vm = GameViewModel()
  
  var body: some View {
    GeometryReader { geometryProxy in
      ZStack {
        Color.black.edgesIgnoringSafeArea(.all)
        VStack {
          Spacer()
          LazyVGrid(columns: vm.columns, spacing: 5.0) {
            ForEach(0..<9) { iterator in
              ZStack {
                Tile(size: geometryProxy)
                PlayerIndicator(icon: vm.moves[iterator]?.indicator ?? "")
              }
              .onTapGesture { vm.processMoveIn(position: iterator) }
            }
          }
          Spacer()
        }
        .padding()
        .alert(item: $vm.alertItem, content: { alertItem in
          Alert(
            title: alertItem.title,
            message: alertItem.message,
            dismissButton: .default(alertItem.buttonTitle, action: { vm.resetGame() })
          )
        })
        .disabled(vm.isGameBoardDisabled)
      }
    }
  }
}

extension GameView {
  private func Tile(size proxy: GeometryProxy) -> some View {
    Circle()
      .foregroundColor(.red.opacity(0.5))
      .frame(width: proxy.size.width / 3 - 15, height: proxy.size.width / 3 - 15)
  }
  
  private func PlayerIndicator(icon indicator: String) -> some View {
    Image(systemName: indicator)
      .resizable()
      .frame(width: 40.0, height: 40.0)
      .foregroundColor(.white)
  }
}

enum Player {
  case human, cpu
}

struct Move {
  let player: Player
  let boardIndex: Int
  
  var indicator: String {
    return player == .human ? "xmark" : "circle"
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    GameView()
  }
}
