//
//  JustPublisher.swift
///  Timer bootcamp
//
//  Created by Devasurya on 08/04/24.


import SwiftUI
import Combine

struct JustPublisherView: View {
    
    /// State property & State object decalarations.
    @StateObject var viewModel: JustPublisherViewModel = JustPublisherViewModel()
  
    var body: some View {
        VStack{
            Text("\(viewModel.projectedText.name)")
                .padding()
                .bold()
            Text("\(viewModel.projectedText.loginID)")
                .padding()
                .bold()
            Button {
                viewModel.updateValue()
            }label: {
                Text("Generate ")
                    .padding()
                    .foregroundStyle(Color.white)
                    .bold()
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
            }
        }
    }
    
   
}

#Preview {
    JustPublisherView()
}

/// ViewModel
class JustPublisherViewModel: ObservableObject {
    
    /// Published property declarations.
    @Published var projectedText: modelClass = modelClass(name: "", loginID: " ")
        
    /// Function to specify subcribtion from the publisher.
    func updateValue()  {
        let  textValue = Just(modelClass(name: "Manu", loginID: "2345"))
        subscribeTo(PublisherName: textValue)
    }
    
    /// Fumction to specifically include subscribing functionality with .sink() modifier with completion closure.
    /// - Parameter PublisherName: Instance of the publisher .
    func subscribeTo(PublisherName: Just<modelClass>) {
        _ = PublisherName
            .sink(receiveCompletion: {completionValue in
            print("Result of completion -----> \(completionValue)")
        },
                  receiveValue: { value in
            print("value ------- >\(value)")
            self.projectedText = value
        })
    }
}

/// Model
struct modelClass {
    let name: String
    let loginID: String
}
