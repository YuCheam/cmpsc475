//
//  JournalEntryComponent.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 12/1/20.
//

import SwiftUI

struct JournalEntryComponent: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var journalEntry: JournalEntry
    var date: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(journalEntry.title).font(.largeTitle)
                Text(date)
                Text(journalEntry.text).font(.body)
            }
            
            Spacer()
            
            Button(action: {deleteEntry()}){
                Label("", systemImage: "trash")
            }.buttonStyle(PlainButtonStyle())
        }
        .padding(8)
        .background(LinearGradient(gradient: Gradient(colors: [Color.primary, Color.primaryLight]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(12)
        .lineLimit(6)
        .font(.footnote)
        .foregroundColor(Color.white)

    }
    
    func deleteEntry() {
        viewContext.delete(journalEntry)
        do {
            try viewContext.save()
        } catch {
            print("Could not save view context")
        }
    }
    
    init(journalEntry: JournalEntry) {
        self.journalEntry = journalEntry
        self.date = journalEntry.date.formattedDate
    }
}

//struct JournalEntryComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        JournalEntryComponent()
//    }
//}
