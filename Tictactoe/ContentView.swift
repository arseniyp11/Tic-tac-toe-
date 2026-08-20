//
//  ContentView.swift
//  Tictactoe
//
//  Created by Arseniy on 18.08.2026.
//

import SwiftUI

struct ContentView: View {
    @State private var board = ["", "", "", "", "", "", "", "", ""]
    @State private var player = "X"
    @State private var status = "Current Player: X"
    @State private var isGameOver = false

    var body: some View {
        VStack(spacing: 25) {
            Text("Tic-Tac-Toe")
                .font(.largeTitle)
                .bold()

            Text(status)
                .font(.title2)
                .bold()

            VStack(spacing: 10) {
                HStack(spacing: 10) {
                    cellButton(0)
                    cellButton(1)
                    cellButton(2)
                }
                HStack(spacing: 10) {
                    cellButton(3)
                    cellButton(4)
                    cellButton(5)
                }
                HStack(spacing: 10) {
                    cellButton(6)
                    cellButton(7)
                    cellButton(8)
                }
            }
            .padding()

            Button("Restart Game") {
                restartGame()
            }
            .font(.title3)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(15)
        }
    }

    func cellButton(_ index: Int) -> some View {
        Button {
            makeMove(index)
        } label: {
            Text(board[index])
                .font(.system(size: 50, weight: .bold))
                .foregroundColor(board[index] == "X" ? .blue : .red)
                .frame(width: 90, height: 90)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(15)
        }
        .disabled(board[index] != "" || isGameOver)
    }

    func makeMove(_ index: Int) {
        board[index] = player
        if checkWin() {
            status = "Player \(player) Wins!"
            isGameOver = true
        } else if !board.contains("") {
            status = "Draw!"
            isGameOver = true
        } else {
            player = (player == "X") ? "O" : "X"
            status = "Current Player: \(player)"
        }
    }

    func checkWin() -> Bool {
        let lines = [
            [0,1,2], [3,4,5], [6,7,8],
            [0,3,6], [1,4,7], [2,5,8],
            [0,4,8], [2,4,6]
        ]
        for line in lines {
            if board[line[0]] == player &&
               board[line[1]] == player &&
               board[line[2]] == player {
                return true
            }
        }
        return false
    }

    func restartGame() {
        board = ["", "", "", "", "", "", "", "", ""]
        player = "X"
        status = "Current Player: X"
        isGameOver = false
    }
}

#Preview {
    ContentView()
}
