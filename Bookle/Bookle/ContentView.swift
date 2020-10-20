//
//  ContentView.swift
//  Bookle
//
//  Created by Kha-Yu Cheam on 10/19/20.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var shelfModel: ShelfModel
    
    var body: some View {
        ForEach(shelfModel.books) { book in
            Text(book.title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
