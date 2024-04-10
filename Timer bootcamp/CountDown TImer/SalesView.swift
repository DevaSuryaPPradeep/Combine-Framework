//
//  SalesView.swift
//  Timer bootcamp
//
//  Created by Devasurya on 05/04/24.
//

import SwiftUI

struct SalesView: View {
    
    /// State property Decalarations. &  Timer intialization with publisher setup.
    let timer1 =  Timer.publish(every: 1.0, on: .main, in:.common).autoconnect()
    @State var finishedText: String? = nil
    @State var timeRemaining :String = ""
    let futureDate: Date = Calendar.current.date(byAdding: .minute, value: 1, to: Date()) ?? Date()
    
    /// Function to perform Timer.
    func updateTimeRemaining() {
        let remainingTime = Calendar.current.dateComponents([.minute,.second], from: Date(), to: futureDate)
        let minute = remainingTime.minute ?? 0
        let seconds = remainingTime.second ?? 0
        if seconds != 0 {
            timeRemaining = "\(minute) : \(seconds)"
        } else {
            timeRemaining = "Few seconds"
            timer1.upstream.connect().cancel()
        }
    }
    
    /// Computed property to implement a specific time format.
    var dateFormatter :DateFormatter {
        let formatter = DateFormatter()
        //formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }
    
    var body: some View {

        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color(.blue),Color(.white)]),
                           center: .center,
                           startRadius: 5,
                           endRadius: 500)
            .ignoresSafeArea(edges: .all)
            VStack {
                Text ("Summer Sales")
                    .font(.title)
                    .foregroundStyle(Color.yellow)
                    .bold()
                    .lineLimit(1)
                    .minimumScaleFactor(0.1)
                Text("The sale ends in \(timeRemaining)")
                    .foregroundStyle(Color.white)
                    .font(.title3)
                    .bold()
            }
        }
        .onReceive(timer1, perform: { _ in
            updateTimeRemaining()
        })
    }
}

#Preview {
    SalesView()
}
