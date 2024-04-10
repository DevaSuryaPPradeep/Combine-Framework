//
//  ViewModel.swift
//  Timer bootcamp
//
//  Created by Devasurya on 07/04/24.
//

import Foundation


class ViewModel:ObservableObject {
    
    @Published var dataArray :[Model] = []
    init(){
        
    }
    
    func getUser() {
        let user1 = Model(name: "nick", points: 92, isVerified: true)
        let user2 = Model(name: "jos", points: 72, isVerified: false)
        let user3 = Model(name: "joe ", points: 18, isVerified: true)
        let user4 = Model(name: "nickman", points: 15, isVerified: false)
        let user5 = Model(name: "slam", points: 19, isVerified: true)
        let user16 = Model(name: "sam", points: 18, isVerified: false)
        let user8 = Model(name: "slam", points: 19, isVerified: true)
        let user9 = Model(name: "nickman", points: 15, isVerified: false)
        dataArray.append(contentsOf: [user1,user2,user3,user4,user5,user8,user9,user16])
    }
    
}
