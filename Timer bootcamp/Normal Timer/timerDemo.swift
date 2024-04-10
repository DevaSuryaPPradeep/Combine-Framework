//
//  timerDemo.swift
//  Timer bootcamp
//
//  Created by Devasurya on 05/04/24.
//

import SwiftUI

struct timerDemo: View {
    
    /// State Property declarations & Timer declarations.
    @State var counter : Int = 0
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Text("The counter value:\(counter)")
            .onReceive(timer, perform: { time in
                if counter == 5 {
                    timer.upstream.connect().cancel()
                } else {
                    print ("Now the time is \(time)")
                }
                counter += 1
            })
    }
}

#Preview {
    timerDemo()
}
