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
    @Binding var imagesArray: [[ProgressPic]]
    @Binding var showActionSheet: Bool
    
    @State var showCalendar: Bool = false
    @State var date: Date = Date()
    @State var pushNavigationLink = false
    var configuration: PHPickerConfiguration
    var columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 2), count: 3)

    var body: some View {
        VStack {
            GeometryReader { geo in
                ScrollView(){
                    ForEach(imagesArray, id:\.self) { array in
                        Text(array[0].date.formattedDate)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(Color.accent)
                            .font(.system(size: ViewConstants.headingSize, weight: .bold, design: .default))
                        LazyVGrid(columns: columns, spacing: 6) {
                            ForEach(array, id:\.self) { image in
                                ImageView(image: image, size: (geo.size.width/3)-4)
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
                .background(ViewConstants.gradient)
                .foregroundColor(.white)
                .cornerRadius(20)
                .padding(.horizontal)
            }
        }.actionSheet(isPresented: $showActionSheet ){
            ActionSheet(title: Text("Modify Images"), buttons: [
                .destructive(Text("Delete Photos")){deleteImages()},
                .default(Text("Compare Photots")){
                    if healthStats.selectedImages.count != 0 {
                        pushNavigationLink.toggle()
                    }
                },
                .default(Text("Change Date")){
                    if healthStats.selectedImages.count != 0 {
                        showCalendar.toggle()
                    }
                },
                .default(Text("Dismiss"))
            ])
        }.sheet(isPresented: $showCalendar) {
            ChangeDateView(healthStats: healthStats, date: $date, showCalendar: $showCalendar)
        }
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
    
    
    init(healthStats: HealthStats, imagesArray: Binding<[[ProgressPic]]>, showActionSheet: Binding<Bool>) {
        self.configuration = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
        configuration.selectionLimit = 0
        configuration.filter = .any(of: [.images])
        
        healthStats.setImagesArray()
        
        self._imagesArray = imagesArray
        self.healthStats = healthStats
        self._showActionSheet = showActionSheet
    }
}

struct ImageView: View {
    @ObservedObject var image: ProgressPic
    var size: CGFloat
    var color: Color {
        image.isSelected ? Color.accent : Color.clear
    }
    
    var body: some View {
        Image(uiImage: UIImage(data: image.imageData!)!)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: size, height: size)
            .clipped()
            .cornerRadius(8)
            .border(color, width: 4)
    }
}

struct ChangeDateView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var healthStats: HealthStats
    @Binding var date: Date
    @Binding var showCalendar: Bool
    
    var body: some View {
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
}

//struct PhotosView_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotosView()
//    }
//}
