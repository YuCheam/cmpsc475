//
//  PhotosView.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 12/5/20.
//

import SwiftUI
import UIKit
import PhotosUI

struct PhotosView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var healthStats: HealthStats
    @Binding var showActionSheet: Bool
    @State var showCalendar: Bool = false
    @State var date: Date = Date()
    @State var pushNavigationLink = false
    var configuration: PHPickerConfiguration
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)

    var body: some View {
        VStack {
            GeometryReader { geo in
                ScrollView(){
                    ForEach(healthStats.imagesArray, id:\.self) { array in
                        Text(array[0].date.formattedDate)
                        LazyVGrid(columns: columns, spacing: 6) {
                            ForEach(array, id:\.self) { image in
                                ImageView(image: image, size: geo.size.width/3)
                                    .onTapGesture {
                                        image.isSelected.toggle()
                                    }
                            }
                        }
                    }
                }.padding(4)
            }
            
            // Hidden Navigation Link
            NavigationLink(destination: ComparePhotosView(healthStats: healthStats), isActive: $pushNavigationLink, label: {Text("")})
                .hidden()
            
            NavigationLink(destination: PhotoPickerWrapper(configuration: configuration, healthStats: healthStats)){
                HStack {
                    Image(systemName: "photo")
                        .font(.system(size: 20))
                    
                    Text("Photo library")
                        .font(.headline)
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(20)
                .padding(.horizontal)
            }
        }.actionSheet(isPresented: $showActionSheet ){
            ActionSheet(title: Text("Modify Images"), buttons: [
                .destructive(Text("Delete Photos")){deleteImages()},
                .default(Text("Compare Photots")){pushNavigationLink.toggle()},
                .default(Text("Change Date")){showCalendar.toggle()},
                    .default(Text("Dismiss"))
            ])
        }.sheet(isPresented: $showCalendar) {
            Form {
                DatePicker("Change Date", selection: $date)
                Section {
                    HStack {
                        Button(action: {showCalendar.toggle()}){
                            Text("Cancel")
                                .modifier(ButtonStyle(ViewConstants.errorButtonColor))
                        }.buttonStyle(PlainButtonStyle())
                        
                        Spacer()
                        
                        Button(action: {changeDate()}){
                            Text("Save")
                                .modifier(ButtonStyle(ViewConstants.defaultButtonColor))
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
    }
    
    func changeDate() {
        for image in healthStats.selectedImages {
            image.date = date
            image.isSelected = false
        }
        
        showCalendar.toggle()
        
        do {
            try viewContext.save()
        } catch {
            print("Could not change date")
        }
        
        healthStats.setImagesArray()
    }
    
    func getUIImage(_ data: Data) -> UIImage {
        UIImage(data: data)!
    }
    
    func deleteImages() {
        for image in healthStats.selectedImages {
            viewContext.delete(image)
        }
        
        do {
            try viewContext.save()
        } catch {
            print("Could not delete images")
        }
        
        healthStats.setImagesArray()
    }
    
    
    init(healthStats: HealthStats, showActionSheet: Binding<Bool>) {
        self.configuration = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
        configuration.selectionLimit = 0
        configuration.filter = .any(of: [.images])
        
        healthStats.setImagesArray()
        
        self.healthStats = healthStats
        self._showActionSheet = showActionSheet
    }
}

struct ImageView: View {
    @ObservedObject var image: ProgressPic
    var size: CGFloat
    var color: Color {
        image.isSelected ? Color.blue : Color.clear
    }
    
    var body: some View {
        Image(uiImage: UIImage(data: image.imageData!)!)
            .resizable()
            .frame(width: size, height: size)
            .border(color, width: 2)
    }
}

//struct PhotosView_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotosView()
//    }
//}
