//
//  Viewmodel.swift
//  Timer bootcamp
//
//  Created by Devasurya on 08/04/24.
//

import Foundation
import Combine

/// ViewModel
class JustPublisherViewModel: ObservableObject {
    
    /// Published property declarations.
    @Published var projectedText:modelClass = modelClass(name: "", loginID: " ")

    
    init(){
        updateValue()
    }
    
    /// Function to specify subcribtion from the publisher.
    func updateValue()  {
        let  textValue = Just(modelClass(name: "manu", loginID: "2345"))
        subscribeTo(PublisherName: textValue)
    }
    
    /// Fumction to specifically include subscribing functionality with .sink() modifier with completion closure.
    /// - Parameter PublisherName: Instance of the publisher .
    func subscribeTo(PublisherName: Just<modelClass>) {
        _ = PublisherName .sink(receiveCompletion: { completionValue in
            print("Result of completion -----> \(completionValue)")
        }, receiveValue: { value in
            print("value ------- >\(value)")
            self.projectedText = value
        })  
    }
}

