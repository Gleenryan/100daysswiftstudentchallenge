//
//  Day64.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 05/09/26.
//



import SwiftUI
import PhotosUI //to open gallery
import StoreKit // untuk maksa user review tinggal  requestReview()


struct Day64: View {
    @Environment(\.requestReview) var requestReview
    @State private var pickerItems = [PhotosPickerItem]()
    
    @State private var selectedImages = [Image]()
    

    var body: some View {
        VStack{
            Button("Leave a review"){
                requestReview()
            }
            //otomatis bikin share extension.
            //bisa kasi text
            //bisa bikin preview juga kalo yg di share complex, things like images.
            ShareLink(item: URL(string: "https://www.hackingwithswift.com")!, subject: Text("Learn Swift here"), message: Text("Check out the 100 Days of SwiftUI!"))
        }
        VStack{
            PhotosPicker(selection: $pickerItems, maxSelectionCount: 3, matching: .any(of: [.images, .not(.screenshots)])){
                Label("Select a pict", systemImage: "swift")
            }
            
            ScrollView{
                ForEach(0..<selectedImages.count, id: \.self){ i in
                    selectedImages[i]
                        .resizable()
                        .scaledToFit()
                }
            }
            
            
        }
        .onChange(of: pickerItems){
            Task{
                selectedImages.removeAll()
                
                for item in pickerItems {
                    if let loadedImage = try await item.loadTransferable(type: Image.self){
                        
                        selectedImages.append(loadedImage)
                        
                    }
                }
            }
        }
        
        
    }
        
}


#Preview {
    Day64()
}
