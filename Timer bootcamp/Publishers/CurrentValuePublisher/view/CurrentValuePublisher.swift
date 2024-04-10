//
//  CurrentValuePublisher.swift
//  Timer bootcamp
//
//  Created by Devasurya on 09/04/24.
//

import SwiftUI
import Combine

struct CurrentValuePublisher: View {
    @StateObject private var viewModelData = CurrentValueViewmodel()
    var body: some View {
        ScrollView{
            VStack {
                ForEach(viewModelData.dataArray,id: \.self) {
                    Text("\($0)")
                        .foregroundStyle(.black)
                        .font(.title)
                        .bold()
                }
                if !viewModelData.errorMessage.isEmpty {
                    Text(viewModelData.errorMessage)
                }
            }
        }
    }
}

/// Viewmodel
class CurrentValueViewmodel :ObservableObject {
    
    /// Published Property & varaible  declarations.
    @Published var dataArray: [String] = []
    @Published private var dataManager = DataManager()
    @Published var errorMessage: String = ""
    var cancellables =  Set<AnyCancellable>()
    
    init(){
        updateUI()
    }
    
    /// Function to add the Subscriber.
    func updateUI() {
        dataManager.currentValuePublisher
        // Sequence Operations.
        /*
         //.first()
         // .first(where: { $0 > 5})
         //            .tryFirst(where: { resultValue in
         //                if resultValue == 3 {
         //                    throw URLError(.badServerResponse)
         //                }
         //                return resultValue > 4
         //            })
         //            .last(where: { $0 < 4})
         //            .last()
         //            .tryLast(where: { value in
         //                if value == 4 {
         //                    throw URLError(.badServerResponse)
         //                }
         //               return value > 1
         //            })
         // .dropFirst()
         //.dropFirst(4)
         // .drop(while: { $0 < 5})
         //            .tryDrop(while: { value in
         //                if value == 5 {
         //                    throw URLError(.badServerResponse)
         //                }
         //                return  value < 6
         //            })
         //  .prefix(4)
         // .prefix(while: { $0 < 5})
         // .output(at: 4) // To get result at a particular index.
         // .output(in:2..<4)
         */
        //Mathematic Operations.
        /*
         //            .max()
         //            .max(by: { value1, value2 in
         //                return value1 < value2
         //            })
         //            .tryMax(by: { int2, int3 in
         //                if int2 < int3 {
         //                    throw URLError(.badServerResponse)
         //                }
         //                return int2 == int3
         //            })
         //            .min()
         //            .min(by: { Int3, Int4 in
         //                return Int4 > Int3
         //            })
         //            .tryMin(by: { Int2, Int3 in
         //                if  Int2 > Int3 {
         //                    throw URLError(.badServerResponse)
         //                }
         //                return Int2 == Int3
         //            })
         */
        //Filter / Reducing operation
        /*
         //            .tryMap({ value in
         //                if value == 5 {
         //                    throw URLError(.badServerResponse)
         //                }
         //                return String(value)
         //            })
         //.map({String($0)})
         .compactMap({ value in
         if value == 5 {
         return nil
         }
         return String(value)
         })
         //            .tryCompactMap({ value in
         //                if value == 5 {
         //                    return "\(URLError(.badServerResponse))"
         //                }
         //                return "\(value)"
         //            })
         //            .tryCompactMap({ value in
         //                if value == 5 {
         //                    return nil
         //                }
         //                return String(value)
         //            })
         //            .filter({($0 > 3) && ($0 < 7)})
         //            .tryFilter({ value in
         //                if value > 3 {
         //                    throw URLError(.badServerResponse)
         //                }
         //                return value > 5
         //            })
         //            .removeDuplicates()
         //            .replaceNil(with: 4)
         //            .scan(0, { existingValue, newValue in
         //                return existingValue + newValue
         //            })
         //            .reduce(0, {$0 + $1})
         //            .scan(0,{$0 + $1})
         //            .collect()
         //                .collect(3)
         //.allSatisfy({$0 < 100})
         */
        //Timing operations.
        // .debounce(for: 0.5, scheduler: DispatchQueue.main)
        //        .delay(for: 4, scheduler: DispatchQueue.main) // this will add a delay in the
            .map({String($0)})
            .sink { completionResult in
                switch completionResult {
                case .finished:
                    break
                case .failure(let returnedError) :
                    self.errorMessage = "Error-->\(returnedError.localizedDescription)"
                }
            } receiveValue: { returnValue in
                self.dataArray.append(returnValue)
                //                self.dataArray.append(contentsOf: returnValue)
            }
            .store(in: &cancellables)
    }
}
/// Data Provider
class DataManager: ObservableObject{
    
    /// Published Property and publisher declarations.
    //  @Published var observedObj: String  = ""
      let currentValuePublisher = CurrentValueSubject<Int,Error>(100)
   // let passThroughValue =  PassthroughSubject<Int,Error>()
    
    init() {
        addDuplicateData()
    }
    
    /// Function to provide data for the publishers.
    private func addDuplicateData () {
        let items = [0,22,1,2,4,5,6,77,77,88,88]
        for x in items.indices {
            DispatchQueue.main.asyncAfter(deadline: .now()+Double(x)) {
                print("Value of x--->\(x)")
                self.currentValuePublisher.send(items[x])
                if x == items.indices.last {
                    self.currentValuePublisher.send(completion: .finished)
                    print("Subscription ends here...")
                }
            }
        }
        //Instance to illustrate the usage of debounce the timing operator.
        /*
         DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
         self.passThroughValue.send(1)
         }
         DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
         self.passThroughValue.send(2)
         }
         DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
         self.passThroughValue.send(3)
         }
         
         So here we added three publishers and added a debounce timer operation  as a result the first publisher will wait for o.5 s as mentioned in the .debounce(). So the first publisher is never implemented.
         */
    }
}
/*
 Difference btw passthrough and currentValuepublisher
 pass through exact same way current value subject except it will not have a initial value.
 when you dont need a initail value then passthrough will be more effective.
 */

#Preview {
    CurrentValuePublisher()
}
