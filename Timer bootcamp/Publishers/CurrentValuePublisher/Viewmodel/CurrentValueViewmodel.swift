//
//  CurrentValueViewmodel.swift
//  Timer bootcamp
//
//  Created by Devasurya on 09/04/24.
//

import Foundation
import Combine

///// Viewmodel
//class CurrentValueViewmodel :ObservableObject {
//    
//    /// Published Property & varaible  declarations.
//    @Published var dataArray: [String] = []
//    @Published private var dataManager = DataManager()
//    @Published var errorMessage: String = ""
//    var cancellables =  Set<AnyCancellable>()
//    
//    init(){
//        updateUI()
//    }
//    
//    /// Function to add the Subscriber.
//    func updateUI() {
//        dataManager.passThroughValue
//       // Sequence Operations.
//            //.first()
//           // .first(where: { $0 > 5})
//            .tryFirst(where: { resultValue in
//                if resultValue == 3 {
//                    throw URLError(.badServerResponse)
//                }
//                return resultValue > 4
//            })
//            .map({String($0)})
//            .sink { completionResult in
//                switch completionResult {
//                case .finished:
//                    break
//                case .failure(let returnedError) :
//                    self.errorMessage = "Error-->\(returnedError.localizedDescription)"
//                }
//            } receiveValue: { returnValue in
//                self.dataArray.append(returnValue)
//            }
//            .store(in: &cancellables)
//    }
//}
