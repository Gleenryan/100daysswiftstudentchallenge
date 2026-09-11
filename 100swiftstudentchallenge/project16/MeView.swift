//
//  MeView.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 11/09/26.
//

import SwiftUI
import CoreImage.CIFilterBuiltins
import SwiftData


struct MeView: View {
    @AppStorage("name") private var name = "Anonymous"
    @AppStorage("emailAddress") private var emailAddress = "you@yoursite.com"
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                    .textContentType(.name)
                    .font(.title)

                TextField("Email address", text: $emailAddress)
                    .textContentType(.emailAddress)
                    .font(.title)
                
                Image(uiImage: generateQRCode(from: "\(name)\n\(emailAddress)"))
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                
            }
            .navigationTitle("Your code")
        }
    }
    
    func generateQRCode(from string: String) -> UIImage{
        //mastiin datanya format bener
        filter.message = Data(string.utf8)
        
        
        if let outputImage = filter.outputImage{
            
            //coba dibuat jadi qr bisa ga, kalo bisa kasi hasil qrnya langsung return
            if let cgImage = context.createCGImage(outputImage, from: outputImage.extent){
                return UIImage(cgImage: cgImage)
            }
                
        }
        
        //kalo if diatas ga jalan kasih gambar silang
        return UIImage(systemName: "xmark.circle") ?? UIImage()
        
        
    }
}

#Preview {
    MeView()
}
