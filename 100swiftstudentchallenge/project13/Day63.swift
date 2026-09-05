//
//  Day63.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 05/09/26.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct Day63: View {
    @State private var image: Image?

    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
        
        
        //fast View made from apple if something bad hapen (not found / error, etc)
        ContentUnavailableView(
            "No Results",
            systemImage: "magnifyingglass",
            description: Text("Try searching for something else")
        )
    }
    

    func loadImage() {
        let inputImage = UIImage(resource: .kids)
        let beginImage = CIImage(image: inputImage)

        let context = CIContext()
        let currentFilter = CIFilter.sepiaTone()
        
        currentFilter.inputImage = beginImage
        currentFilter.intensity = 1
        
        guard let outputImage = currentFilter.outputImage else { return }
        
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
        
        // convert that to a UIImage
        let uiImage = UIImage(cgImage: cgImage)

        // and convert that to a SwiftUI image
        image = Image(uiImage: uiImage)
    }
    
//    alur lengkap
//    UIImage (buat display)
//       ↓ convert
//    CIImage (buat diproses)
//       ↓ dikasih ke filter
//    CIFilter (nyimpen resep, belum eksekusi)
//       ↓ minta output
//    CIImage lagi (masih resep, belum bitmap)
//       ↓ di-"render" pakai CIContext
//    CGImage (bitmap asli, hasil final)
//       ↓ convert
//    UIImage → Image (buat ditampilin)
}

#Preview {
    Day63()
}
