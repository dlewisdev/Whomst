//
//  WhomstApp.swift
//  Whomst
//
//  Created by Danielle Lewis on 5/14/26.
//

import SwiftUI

@main
struct WhomstApp: App {
    @State private var store = ContactStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(store)
        }
    }
}
