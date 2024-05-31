//
//  FuturePublisherView.swift
//  Timer bootcamp
//
//  Created by Devasurya on 15/04/24.
//

import SwiftUI
import Combine

struct FuturePublisherView: View {
    
    @StateObject var viewModelInstance: FuturesPublisherViewModel = FuturesPublisherViewModel()
    var body: some View {
        Text(viewModelInstance.title)
            .bold()
            .font(.title)
    }
}

#Preview {
    FuturePublisherView()
}

/// ViewModel.
class FuturesPublisherViewModel :ObservableObject{
    
    /// Published property, variables & constants declarations.
    @Published var title: String =  " Starting Title "
    private  let urlValue: URL? = URL(string: "https://www.google.com")
    private var cancellable = Set<AnyCancellable>()
    
    init(){
        downloadData()
    }
    
    /// Function to create a subscriber.
    func downloadData() {
        getFuturePublisher()
            .sink(receiveCompletion: { completion in
                // Handle completion
            }, receiveValue: { [weak self] returnedValue in
                self?.title = returnedValue
            })
            .store(in: &cancellable) // Store the cancellable
    }
    
    
    /// Function to create a publisher.
    /// - Returns: Value of Type AnyPublishers  with String or URLError value.
    func getCombinePublisher() -> AnyPublisher<String,URLError> {
        guard let url = urlValue else {
        fatalError("URL is nil")
        }
      return  URLSession.shared.dataTaskPublisher(for: url)
            .timeout(1, scheduler: DispatchQueue.main)
            .map ({ _ in
                return "New Value"
            })
            .eraseToAnyPublisher()
    }
    
    
    /// Function that act as a data Provider with @escaping  closure.
    /// - Parameter completionHandler: @escaping closure with a returnedValue of type String , along with an error block.
    func getEscapingClosure(completionHandler : @escaping(_ returnedValue: String, _ error : Error?)->()) {
        guard let url = urlValue else {
        fatalError("URL is nil")
        }
        URLSession.shared.dataTask(with: url ) {data,response,error in
            completionHandler("Updated Value 2", nil)
        }
        .resume()
    }
    
    
    /// Function to convert @escaping closure to  a publisher by using future publisher.
    /// - Returns: This
    func getFuturePublisher() -> Future <String , Error> {
        return Future { promise in
            self.getEscapingClosure { returnedValue, error in
                if let error = error {
                    promise(.failure(error))
                }
                promise(.success(returnedValue))
            }
        }
    }
}
