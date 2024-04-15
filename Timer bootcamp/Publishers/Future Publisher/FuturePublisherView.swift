//
//  FuturePublisherView.swift
//  Timer bootcamp
//
//  Created by Devasurya on 15/04/24.
//

import SwiftUI

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
