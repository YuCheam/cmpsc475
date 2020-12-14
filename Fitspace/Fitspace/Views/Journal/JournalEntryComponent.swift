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
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(journalEntry.title)
                    .font(.system(size: ViewConstants.headingSize, weight: .semibold))
                Text(journalEntry.stringDate)
                Text(journalEntry.text).font(.body)
            }.foregroundColor(Color.black)
            
            Spacer()
            
            Button(action: {deleteEntry()}){
                Label("", systemImage: "trash")
            }.buttonStyle(PlainButtonStyle())
            .foregroundColor(Color.accent)
            
        }.padding()
        .background(Color.white)
        .cornerRadius(6)
        .lineLimit(6)
        .shadow(radius: 12)

    }
    
    func deleteEntry() {
        viewContext.delete(journalEntry)
        do {
            try viewContext.save()
        } catch {
            print("Could not save view context")
        }
    }
}

//struct JournalEntryComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        JournalEntryComponent()
//    }
//}
