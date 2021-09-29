//
//  Alerts.swift
//  tic-tac-toe
//
//  Created by Rick Brown on 29/09/2021.
//

import SwiftUI

struct AlertItem: Identifiable {
  let id = UUID()
  var title: Text
  var message: Text
  var buttonTitle: Text
}

struct AlertContext {
  static let humanWin = AlertItem(title: Text("You win!! 😉"), message: Text("You really are improving at this game. Well done!!"), buttonTitle: Text("Hell yeah!!"))
  static let cpuWin = AlertItem(title: Text("You lose!! 😫"), message: Text("The AI is too strong for you!! 💪🏻 You play like a child. Wait? Are you a child?!?!"), buttonTitle: Text("Yes, I'm a big baby!!"))
  static let draw = AlertItem(title: Text("You draw!!"), message: Text("Ooof!! That was close. Try again, if we see even a small improvement you should tip the scales in your favour!!"), buttonTitle: Text("Lemme try again!!"))
}

