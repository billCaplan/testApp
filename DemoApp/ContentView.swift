//
//  ContentView.swift
//  DemoApp
//
//  Created by William Caplan on 9/29/20.
//  Copyright © 2020 William Caplan. All rights reserved.
//

import SwiftUI

import IterableSDK


struct ContentView: View {
    @State private var showDetails = false
    @State private var showDetailsEvent = false

    let dataFields : [String: Any] = [
        "firstName" : "Bill",
        "isRegisteredUser" : "true",
        "SA_User_Test_Key" : "completed"
    ]
    
    let eventDataFields : [String: Any] = [
           "platform" : "iOS",
           "isTestEvent" : "true",
           "url" : "https://iterable.com/sa-test/billc",
           "secret_code_key": "Code_123"
       ]
    
    var body: some View {
        
    VStack {
        Button(action: {
            self.showDetails.toggle()
            IterableAPI.updateUser(self.dataFields, mergeNestedObjects: false)
           
        }) {
            Text("Update Iterable Details")
        }

        if showDetails {
            Text("Info updated")
                .font(.largeTitle)
        };
        
        Button(action: {
            self.showDetailsEvent.toggle()
            IterableAPI.track(event: "mobileSATestEvent", dataFields: self.eventDataFields)
           
        }) {
            Text("Second Button to send Event")
        }

        if showDetailsEvent {
            Text("Event sent")
                .font(.largeTitle)
        }
        

        
        
        Button(action: {
            // Get the in-app messages list
            let messages = IterableAPI.inAppManager.getMessages()

            if messages.isEmpty {
                print("don't present when there are 0 messages")
            } else {
                print("presents the first message")

                // Show an in-app message
                IterableAPI.inAppManager.show(message: messages[0])
            }
           
        }) {
            Text("render message store")
        }
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
