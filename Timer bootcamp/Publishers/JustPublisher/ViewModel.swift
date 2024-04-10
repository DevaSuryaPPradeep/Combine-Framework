//
//  Viewmodel.swift
//  Timer bootcamp
//
//  Created by Devasurya on 08/04/24.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    
    /// <#Description#>
    @Published var projectedText:modelClass = modelClass(name: "", loginID: " ")

    init(){
        updateValue()
    }
    
    func updateValue()  {
        let  textValue = Just(modelClass(name: "manu", loginID: "2345"))
        _ = textValue.sink(receiveCompletion: { completionValue in
            print("Result of completion -----> \(completionValue)")
        }, receiveValue: { value in
            print("value ------- >\(value)")
            self.projectedText = value
        })
           }
    
}

