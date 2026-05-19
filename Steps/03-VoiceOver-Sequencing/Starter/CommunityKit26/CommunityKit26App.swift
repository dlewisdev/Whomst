//
//  CommunityKit26App.swift
//  CommunityKit26
//
//  Created by Danielle Lewis on 5/14/26.
//

import SwiftUI

@main
struct CommunityKit26App: App {
    @State private var store = ContactStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(store)
        }
    }
}
