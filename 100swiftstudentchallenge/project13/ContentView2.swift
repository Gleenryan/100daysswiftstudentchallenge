//
//  Instafilter.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 05/09/26.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI
import PhotosUI

struct ContentView2: View{
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    @State private var selectedItems: PhotosPickerItem?
    @State private var showingFilters = false
    
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    let context = CIContext()
    
    
    var body: some View{
        NavigationStack{
            VStack{
                Spacer()
                
                
                PhotosPicker(selection: $selectedItems){
                    if let processedImage{
                        processedImage
                            .resizable()
                            .scaledToFit()
                    }else{
                        ContentUnavailableView("No picture", systemImage: "photo.badge.plus", description: Text("tap to import a photo"))
                    }
                    
                }
                //biar ga biru
                .buttonStyle(.plain)
                .onChange(of: selectedItems, loadImage)
                
                
                Spacer()
                
                HStack{
                    Text("Intensity")
                    Slider(value:$filterIntensity)
                        .onChange(of: filterIntensity, applyProcessing)
                }
                
                HStack{
                    Button("Change Filter", action: changeFilter)
                    Spacer()
                    
                    if let processedImage{
                        ShareLink(item:processedImage, preview: SharePreview("Instafiler", image: processedImage))
                    }
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("InstaFilter")
            .confirmationDialog("select a fliter", isPresented: $showingFilters){
                
                Button("Crystallize") { setFilter(CIFilter.crystallize()) }
                Button("Edges") { setFilter(CIFilter.edges()) }
                Button("Gaussian Blur") { setFilter(CIFilter.gaussianBlur()) }
                Button("Pixellate") { setFilter(CIFilter.pixellate()) }
                Button("Sepia Tone") { setFilter(CIFilter.sepiaTone()) }
                Button("Unsharp Mask") { setFilter(CIFilter.unsharpMask()) }
                Button("Vignette") { setFilter(CIFilter.vignette()) }
                Button("Cancel", role: .cancel) { }
                
            }
        }
    }
    
    func changeFilter(){
        showingFilters = true
    }
    
    func loadImage(){
        Task{
            //why data, biar nanti bisa diedit atau dipakein filetr (gabisa pake type image)
            guard let imageData = try await selectedItems?.loadTransferable(type: Data.self) else {return}
            
            guard let inputImage = UIImage(data:imageData) else {return}
            
            let beginImage = CIImage(image: inputImage)
            
            currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
            applyProcessing()
        }
    }
    
    func applyProcessing(){
        let inputKeys = currentFilter.inputKeys

        if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey) }
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(filterIntensity * 200, forKey: kCIInputRadiusKey) }
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(filterIntensity * 10, forKey: kCIInputScaleKey) }
        
        guard let outputImage = currentFilter.outputImage else {return}
        
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else {return}
        
        let uiImage = UIImage(cgImage: cgImage)
        
        processedImage = Image(uiImage: uiImage)
        
    }
    
    func setFilter(_ filter: CIFilter){
        currentFilter = filter
        loadImage()
    }
    
}

#Preview {
    ContentView2()
}
