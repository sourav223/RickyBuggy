//
//  RickyBuggyApp.swift
//  RickyBuggy
//

import SwiftUI

@main
struct RickyBuggyApp: App {
    
    @State var isListHidden = true
    
    init() {
        DIContainer.shared.register(NetworkManager())
        DIContainer.shared.register(APIClient())
    }
    
    var body: some Scene {
        WindowGroup {
            VStack {
                Button(isListHidden ? "Hide Content" : "Show Content") {
                    isListHidden = !isListHidden
                }
                
                if(isListHidden) {
                    AppMainView()
                }
            }
        }
    }
}
