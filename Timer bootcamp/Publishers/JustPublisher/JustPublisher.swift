//
//  JustPublisher.swift
///  Timer bootcamp
//
//  Created by Devasurya on 08/04/24.


import SwiftUI

struct JustPublisher: View {
    
    /// State property decalarations.
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack{
            Text("Hi \(viewModel.projectedText.name)")
                .bold()
            Text("This is your job Id :\(viewModel.projectedText.loginID)")
                .bold()
        }
    }
}
#Preview {
    JustPublisher()
}


