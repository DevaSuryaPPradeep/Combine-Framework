//
//  DataManager.swift
//  Timer bootcamp
//
//  Created by Devasurya on 09/04/24.
//
import Combine
import Foundation


///// Data Provider
//class DataManager: ObservableObject{
//    
//    /// Published Property and publisher declarations.
//    //  @Published var observedObj: String  = ""
//    //  let currentValuePublisher = CurrentValueSubject<Int,Error>(100)
//    let passThroughValue =  PassthroughSubject<Int,Error>()
//    
//    init() {
//        addDuplicateData()
//    }
//    
//    /// Function to provide data for the publishers.
//    private func addDuplicateData () {
//        let items = Array(0..<11)
//        for x in items.indices {
//            DispatchQueue.main.asyncAfter(deadline: .now()+Double(x)) {
//                self.passThroughValue.send(items[x])
//            }
//        }
//    }
//}
///*
// Difference btw passthrough and currentValuepublisher
// pass through exact same way current value subject except it will not have a initial value.
// when you dont need a initail value then passthrough will be more effective.
// */
