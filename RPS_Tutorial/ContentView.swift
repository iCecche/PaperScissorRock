//
//  ContentView.swift
//  RPS_Tutorial
//
//  Created by amministratore on 30/03/2021.
//

import SwiftUI
import GameplayKit

struct ContentView: View {
    @State var titol :String = "Rock, Paper, Scissor"
               .uppercased()
    @State var titol2 = "🤖"
    @State var textResult = ""
    @State var vsText = "VS"
    @State var playAgainText : String = ""
    @State var rockButton : Bool = false
    @State var paperButton : Bool = false
    @State var scissorButton : Bool = false
    @State var gameReset : Bool = false
    @State var clicked : Bool = false
    @State var contaPlayer : Int = 0
    @State var contaCPU : Int = 0
    @State var backgroundColor : Color = Color.white
    
    
    func play(_ playerTurn : Sign)
    {
        let opponent = randomSign()
        let gameResult = playerTurn.takeTurn(opponent)
        titol2 = opponent.emoji
        switch gameResult {
        case .win:
            textResult = "you win!"
            contaPlayer += 1
        case .lose:
            textResult = "Oh no, you lose!"
            contaCPU += 1
        case .draw:
            textResult = "It's a draw!"
        }
        gameReset = true
        clicked = true
        if contaPlayer == 3 {
            textResult = "you win the match!"
            playAgainText = "Play Again"
        }else if contaCPU == 3 {
            textResult = "you lose the match!"
            playAgainText = "Play Again"
        }else {
            playAgainText = "Next Round"
        }
    }
    func playAgain()
    {
        gameReset = false
        rockButton = false
        paperButton = false
        scissorButton = false
        clicked = false
        titol2 = "🤖"
        if contaPlayer  == 3 || contaCPU == 3 {
            contaPlayer = 0
            contaCPU = 0
        }
        backgroundColor = .white
    }
    
    var body: some View {
        VStack(alignment: .center)
        {
            if !gameReset
            {
                Text(titol).font(.title)
                    .padding()
            }else {
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                {
                    Text("You: \(contaPlayer)").font(.title)
                        .padding()
                    Text("Cpu: \(contaCPU)").font(.title)
                        .padding()
                }
            }
            Text(titol2).font(.system(size: 80))
                .position(x: 100, y: 75.0)
                .frame(width: 200, height: 160, alignment: .center)
            if rockButton || paperButton || scissorButton {
                Text(vsText).font(.system(size: 40))
                    .position(x: 35.0, y: 35.0)
                    .frame(width: 70, height: 70, alignment: .center)
                    .padding()
                    .padding(.bottom)
            }
            HStack(alignment: .center, spacing: 0)
             {
                if clicked && (!paperButton && !scissorButton){
                    Text("👊").font(.system(size: 80))
                      .position(x: 50.0, y: 50.0)
                      .frame(width: 100, height: 100, alignment: .center)
                      .padding()
                }else {
                 Button(action: {play(.rock)
                    self.rockButton = true
                 }, label:{
                    if paperButton || scissorButton {
                        Text("👊").hidden()
                            .frame(width: 0, height: 0, alignment: .leading)
                    }else{
                        Text("👊").font(.system(size: 80))
                          .position(x: 50.0, y: 50.0)
                          .frame(width: 100, height: 100, alignment: .center)
                          .padding()
                    }
                 })
                }
                if clicked && (!rockButton && !scissorButton) {
                    Text("🤚").font(.system(size: 80))
                      .position(x: 50.0, y: 50.0)
                      .frame(width: 100, height: 100, alignment: .center)
                      .padding()
                }else {
                 Button(action: {play(.paper)
                    self.paperButton = true
                 }, label: {
                    if rockButton || scissorButton {
                        Text("🤚").hidden()
                            .frame(width: 0, height: 0, alignment: .leading)
                    }else {
                        Text("🤚").font(.system(size: 80))
                          .position(x: 50.0, y: 50.0)
                          .frame(width: 100, height: 100, alignment: .center)
                          .padding()
                    }
                 })
                }
                if clicked && (!rockButton && !paperButton)
                {
                    Text("✂️").font(.system(size: 80))
                      .position(x: 50.0, y: 50.0)
                      .frame(width: 100, height: 100, alignment: .center)
                      .padding()
                }else {
                    Button(action: {play(.scissor)
                        self.scissorButton = true
                    }, label: {
                        if rockButton || paperButton {
                            Text("✂️").hidden()
                                .frame(width: 0, height: 0, alignment: .leading)
                        }else {
                            Text("✂️").font(.system(size: 80))
                              .position(x: 50.0, y: 50.0)
                              .frame(width: 100, height: 100, alignment: .center)
                              .padding()
                        }
                    })
                }
                
             }
             HStack(alignment: .center)
             {
                if !gameReset {
                    Text(textResult).hidden()
                }else {
                    Text(textResult).font(.title)
                            .frame(height: 35, alignment: .center)
                            .padding()
                }
             }
            HStack(alignment: .center)
            {
                if gameReset == false {
                    Text(playAgainText).hidden()
                }else {
                    Button(action: {playAgain()}, label: {
                        Text(playAgainText).font(.title)
                            .frame(height: 100, alignment: .center)
                            .padding()
                    })
                }
            }
      }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
