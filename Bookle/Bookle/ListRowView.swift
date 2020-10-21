//
//  ListRowView.swift
//  Bookle
//
//  Created by Kha-Yu Cheam on 10/20/20.
//

import SwiftUI

struct ListRowView: View {
    @EnvironmentObject var shelfModel: ShelfModel
    var completedBooks: [Int] {
        shelfModel.filteredBooksIndex(filterOn: {$0.isCompleted})
    }
    var inProgressBooks: [Int] {
        shelfModel.filteredBooksIndex(filterOn: {$0.isReading})
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("All Books").font(.headline)
            ScrollView(.horizontal){
                HStack(spacing: 10){
                    ForEach(shelfModel.books.indices, id:\.self) { index in
                        Image(shelfModel.books[index].image).resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 256)
                    }
                }
            }
            
            Text("In Progress Books").font(.headline)
            ScrollView(.horizontal){
                HStack(spacing: 10){
                    ForEach(inProgressBooks, id:\.self) { index in
                        Image(shelfModel.books[index].image).resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 256)
                    }
                }
            }
            
            Text("Finished Books").font(.headline)
            ScrollView(.horizontal){
                HStack(spacing: 10){
                    ForEach(completedBooks, id:\.self) { index in
                        Image(shelfModel.books[index].image).resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 256)
                    }
                }
            }
            
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView()
    }
}
