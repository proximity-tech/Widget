//
//  PickRandomImageWidget.swift
//  PickRandomImageWidget
//
//  Created by Ramkrishna on 15/06/23.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> PickRandomImageEntry {
        PickRandomImageEntry()
    }

    func getSnapshot(in context: Context, completion: @escaping (PickRandomImageEntry) -> ()) {
        let entry = PickRandomImageEntry()
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let timeline = Timeline(entries: [PickRandomImageEntry()], policy: .atEnd)
        completion(timeline)
    }
}

struct PickRandomImageWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading) {
                HStack {
                    Text("Shuffle")
                        .fontWeight(.semibold)
                        .padding(.bottom, 10)
                    Spacer()
                    Button(intent: PickRandomImageIntent(namePrefix: "disney")) {
                        Image(systemName: "shuffle")
                    }
                }
            }
            .frame(maxWidth: .infinity)
            
            HStack {
                Spacer()
                Image(PickRandomImageEntry.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .transition(.opacity.animation(.default))
                Spacer()
            }
        }
        .containerBackground(.fill.tertiary, for: .widget)
    }
}

struct PickRandomImageWidget: Widget {
    let kind: String = "PickRandomImageWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: Provider()
        ) { entry in
            PickRandomImageWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

#Preview(as: .systemSmall) {
    PickRandomImageWidget()
} timeline: {
    PickRandomImageEntry()
}

