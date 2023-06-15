//
//  PickRandomImageIntent.swift
//  PickRandomImage
//
//  Created by Ramkrishna on 15/06/23.
//

import SwiftUI
import AppIntents
import WidgetKit

struct PickRandomImageIntent: AppIntent {
    static var title: LocalizedStringResource = "Pick Random Image"
    
    @Parameter(title: "Image Name")
    var namePrefix: String
    
    init() {}
    
    init(namePrefix: String) {
        self.namePrefix = namePrefix
    }

    func perform() async throws -> some IntentResult {
        PickRandomImageEntry.imageName = "\(namePrefix)\(Int.random(in: 1...5))"
        print("Image Name: \(PickRandomImageEntry.imageName)")
        return .result()
    }
}

struct PickRandomImageEntry: TimelineEntry {
    var date: Date = .now
    static var imageName: String = "disney1"
}
