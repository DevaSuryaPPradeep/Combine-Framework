//
//  JustPublisher.swift
///  Timer bootcamp
//
//  Created by Devasurya on 08/04/24.


import SwiftUI

struct JustPublisherView: View {
    
    /// State property & State object decalarations.
    @StateObject var viewModel = JustPublisherViewModel()
    @State var id: String = ""
    @State var name: String = ""
    
    var body: some View {
        VStack{
            Text("\(self.name)")
                .padding()
                .bold()
            Text("\(self.id)")
                .padding()
                .bold()
            Button {
                textGenerator()
            }label: {
                Text("Click Here")
                    .padding()
                    .foregroundStyle(Color.white)
                    .bold()
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
            }
        }
    }
    
    /// Assigns a data to the state properties on Clicking a button.
    func textGenerator () {
        self.name =  viewModel.projectedText.name ?? ""
        self.id = viewModel.projectedText.loginID ?? ""
    }
}

#Preview {
    JustPublisherView()
}


