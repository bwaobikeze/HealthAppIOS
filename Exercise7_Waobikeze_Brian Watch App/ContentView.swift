//
//  ContentView.swift
//  Exercise7_Waobikeze_Brian Watch App
//
//  Created by brian waobikeze on 10/29/23.
//

import SwiftUI
import HealthKit

struct ContentView: View {
    @State var  heartRate = 0
    var healthStore = HKHealthStore()
    var body: some View {
        VStack {
            Button(action: {
                
            }, label: {
                Text("❤️").font(.system(size: 40))
            })
            Spacer()
            HStack{
                Text("\(heartRate)").font(.system(size: 70)).fontWeight(.regular)
                Text("BPM").font(.headline).foregroundStyle(.red).padding(.vertical, 9)
            }
            
        }.onAppear(perform: {
            start()
        })
        .padding()
    }
    func start(){
        authorizeHealKit()
    }
    func authorizeHealKit(){
        let healthKitTypes: Set = [HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!]
        
        healthStore.requestAuthorization(toShare: healthKitTypes, read: healthKitTypes){_,_ in}

    }
}

#Preview {
    ContentView()
}
