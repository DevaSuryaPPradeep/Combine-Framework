//
//  ViewModel.swift
//  CombineFramework
//
//  Created by Devasurya on 09/04/24.
//

import Foundation
import Combine

class CurrentValueViewModel: ObservableObject {
    @Published var dataArray: [String] = []
    @Published private var dataManager = DataManager()
    var cancellables =  Set<AnyCancellable>()
    init(){
        updateUI()
    }
    
    func updateUI() {
        dataManager.$observedObj
            .sink { completionResult in
            switch completionResult {
            case .finished:
                break
            case .failure(let errorMessage) :
                print("errorMessage---->\(errorMessage)")
            }
        } receiveValue: { returnValue in
            self.dataArray =  returnValue
        }
        .store(in: &cancellables)
    }
}
