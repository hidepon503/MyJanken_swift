//
//  ContentView.swift
//  MyJanken
//
//  Created by 飯塚 秀幸 on 2023/12/20.
//

import SwiftUI

struct ContentView: View {
    //ジャンケンの結果を格納する変数（0=初期画面,1=ぐー,2=ちょき,3=パー）
    @State var cpuChoice: Int = 0
    @State var resultText: String = ""

    //プレーヤーが選択したジャンケンでランダムでCPUのジャンケンを選択し、resultJankenに格納。
    //resultJankenでreturnで返す勝敗をresultTextに代入
    func playJanken(playerChoice: Int){
        cpuChoice = Int.random(in:1...3)
        resultText = resultJanken(playerChoice: playerChoice, cpuChoice: cpuChoice)
    }

    //   勝敗を判定する関数
    func resultJanken(playerChoice: Int, cpuChoice: Int) -> String {
        if playerChoice == cpuChoice {
            return "あいこ"
        }else if (playerChoice == 1 && cpuChoice == 2) ||
                    (playerChoice == 2 && cpuChoice == 3) ||
                    (playerChoice == 3 && cpuChoice == 1){
            return "勝ち‼︎"
        }else{
            return "負け..."
        }
    }
    //   数値を画像名に変換するロジック
    func choiceToImage( choice: Int) -> String{
        switch choice {
        case 1:
            return "gu"
        case 2:
            return "choki"
        case 3:
            return "pa"
        default:
            return ""
        }
    }

    //    数値を文字列に変換するロジック
    func choiceToString( choice: Int) -> String{
        switch choice {
        case 1:
            return "グー"
        case 2:
            return "チョキ"
        case 3:
            return "パー"
        default:
            return ""
        }

    }


    var body: some View {

        VStack {
            //スペースを追加
            Spacer()
            //ジャンケンの数字が0だったら
            if cpuChoice == 0 {
                //初期画面のテキストを表示
                Text("これからじゃんけんをします！")
                //下辺に余白を設定
                    .padding(/*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
            }else {
                //ジャンケンの数字が１だったらグーを表示
                //グー画像を指定
                Image(choiceToImage(choice: cpuChoice))
                //リサイズ
                    .resizable()
                //画面に収まるようにアスペクト比を維持する指定
                    .scaledToFit()
                Spacer()
                //ジャンケンの種類を指定
                Text(choiceToString(choice: cpuChoice))
                //下辺に余白を設定
                    .padding(/*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
                Text(resultText)
            }

            HStack {
                Button(action: { playJanken(playerChoice: 1) }){
                    Image(.gu)
                        .resizable()
                        .scaledToFit()
                        .frame(width:80,height:80)
                }
                Button(action: { playJanken(playerChoice: 2) }){
                    Image(.choki)
                        .resizable()
                        .scaledToFit()
                        .frame(width:80,height:80)
                }
                Button(action: { playJanken(playerChoice: 3) }){
                    Image(.pa)
                        .resizable()
                        .scaledToFit()
                        .frame(width:80,height:80)
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 100)
            .foregroundColor(.white)
            .background(.blue)
        }

    }
}

#Preview {
    ContentView()
}
