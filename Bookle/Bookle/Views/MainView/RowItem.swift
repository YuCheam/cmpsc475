//
//  RowItem.swift
//  Bookle
//
//  Created by Kha-Yu Cheam on 10/24/20.
//

import SwiftUI

struct RowItem: View {
    var book : BookMO
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(book.title).fontWeight(.bold)
                Text("by: \(book.author ?? "")")
            }
            Spacer()
            Image(book.image).resizable()
                .aspectRatio(contentMode: .fit)
        }.frame(height: 48)
    }
}

//struct RowItem_Previews: PreviewProvider {
//    static var previews: some View {
//        RowItem()
//    }
//}
