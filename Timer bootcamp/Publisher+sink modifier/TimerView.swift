//
//  Timer+viewmodel.swift
//  Timer bootcamp
//
//  Created by Devasurya on 05/04/24.
//

import SwiftUI
import Combine

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
                    .background(Color.gray.opacity(0.3))
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


/*
 // .sink & .assign.
 // .combineLatest.
 // Any cancellables.
 // Debounce.
 //AutoConnect.
 */
class TimerViewmodel: ObservableObject {
    
    /// Published property & varaible declarations.
    @Published  var count: Int = 0
   // var timer :AnyCancellable?
    var cancellables = Set<AnyCancellable>()
    @Published var textFieldText: String = ""
    @Published var textIsValid : Bool = false
    @Published var showButton: Bool = false
    
    init() {
        setUpTimer()
        addTextFieldSubscriber()
        buttonFunctionality()
    }
    
    /// Function setup Timer.
    func setUpTimer() {
        Timer.publish(every: 1, on: .main, in: .common).autoconnect()
            .sink {[weak self] _ in
                guard let self = self else{
                    return
                }
                self.count += 1
                //                if self.count >= 10 {
                //                    for item in cancellables {
                //                        item.cancel()
                //                    }
                //                }
            }
            .store(in: &cancellables)
    }
    
    /// Function to check text contains 3 characters.
    func addTextFieldSubscriber () {
        $textFieldText
           .debounce(for: 0, scheduler: DispatchQueue.main)
            .map{(textValue) -> Bool in
                if textValue.count > 3 {
                    return true
                }
                return false
            }
                .assign(to: \.textIsValid, on: self)
//            .sink(receiveValue: {[weak self] isValid in
//                guard let self = self else {
//                    return
//                }
//                self.textIsValid =  isValid
//            })
            .store(in: &cancellables)
    }
    
    /// buttonFunctionality - function facilitates the usage of the submit button in the view.
    func buttonFunctionality () {
        $count.combineLatest($textIsValid)
            .sink { [weak self](count, isValid) in
                guard let self = self else {return}
                if isValid || count >= 10 {
                    self.showButton = true
                }
                else{
                    self.showButton =  false
                }
            }
            .store(in: &cancellables)
    }
}
