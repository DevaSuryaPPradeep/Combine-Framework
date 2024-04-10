//
//  Map in data array.swift
//  Timer bootcamp
//
//  Created by Devasurya on 07/04/24.
//

import SwiftUI

struct MapView: View {
    
    @StateObject var MapViewModel: ViewModel = ViewModel()
    var body: some View {
        ZStack{
            Color.orange
                .ignoresSafeArea()
            ScrollView {
            VStack {
                ForEach(MapViewModel.dataArray) { user in
                    Text(user.name)
//                    HStack{
//                        Text(String(user.points))
//                    }
                }
            }
            
            }
        }
    }
}
#Preview {
    MapView()
}
