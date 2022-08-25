//
//  MukChiBaGame.swift
//  RockPaperScissors
//
//  Created by LJ, 준호.
//

struct MukChiBaGame {
    func startGame() {
        let rockPaperScissorsGame: RockPaperScissorsGame = RockPaperScissorsGame()
        guard let turnOwner: Participant = rockPaperScissorsGame.startGame() else {
            return
        }
    }
    
    private func getSelectedUserMenu(turnOwner: Participant) -> Int {
        printUserMenu(turnOwner: turnOwner)
        guard let selectedUserMenu: Int = userInput() else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return getSelectedUserMenu(turnOwner: .computer)
        }
        
        if isCorrectUserMenu(selectedUserMenu) {
            return selectedUserMenu
        } else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return getSelectedUserMenu(turnOwner: .computer)
        }
    }
    
    func printUserMenu(turnOwner: Participant) {
        print("[\(turnOwner.name) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
    }
    
    private func userInput() -> Int? {
        let userInput: Int? = Int(readLine() ?? "")
        return userInput
    }
    
    private func isCorrectUserMenu(_ userMenu: Int) -> Bool {
        switch userMenu {
        case 0...3:
            return true
        default:
            return false
        }
    }
    
    private func getComputerHand() -> MukChiBa? {
        return MukChiBa.allCases.randomElement()
    }
    
    private func compareComputerHand(with userHand: MukChiBa) -> GameResult? {
        guard let computerHand: MukChiBa = getComputerHand() else {
            return nil
        }
        guard userHand != computerHand else {
            return .draw
        }
        
        switch userHand {
        case .muk:
            if computerHand == .chi {
                return .win
            } else {
                return .lose
            }
        case .chi:
            if computerHand == .ba {
                return .win
            } else {
                return .lose
            }
        case .ba:
            if computerHand == .muk {
                return .win
            } else {
                return .lose
            }
        }
    }

}