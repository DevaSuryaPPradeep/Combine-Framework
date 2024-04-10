//
//  Timer+viewmodel.swift
//  Timer bootcamp
//
//  Created by Devasurya on 05/04/24.
//

import SwiftUI

struct TimerView: View {
    @StateObject var viewModelManager :TimerViewmodel = TimerViewmodel()
    
    var body: some View {
        VStack {
            Text ("\(viewModelManager.count)")
                .font(.title)
                .bold()
            HStack {
                TextField("Type your name here...", text: $viewModelManager.textFieldText)
                    .padding()
                    .frame(width: 340,height: 50)
                    .background(Color.gray.opacity(0.6))
                    .overlay {
                        Image(systemName: "xmark")
                            .padding(.leading,300)
                            .foregroundStyle(Color.red)
                            .opacity(
                                viewModelManager.textIsValid ? 0.0 : 1.0
                            )
                        Image(systemName: "checkmark")
                            .padding(.leading,300)
                            .foregroundStyle(Color.green)
                            .opacity(
                                viewModelManager.textIsValid  ? 1.0 : 0.0
                            )
                    }
            }
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
        }
        Button{
            print("Buttom Pressed.")
        }label: {
            Text("submit".uppercased())
                .padding()
                .font(.headline)
                .foregroundStyle(Color.black)
                .bold()
                .background(Color.cyan)
                .opacity(viewModelManager.showButton  ? 1.0 :0.5)
        }
        .disabled(!viewModelManager.showButton)
        .clipShape(RoundedRectangle(cornerRadius: 10.0))
    }
}

#Preview {
    TimerView()
}


