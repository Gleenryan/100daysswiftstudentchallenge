//
//  day23.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 04/07/26.
//
//gonna learn so much about some view
//view itu kayak inheritance, bisa terus inherit"
//use struct for your views
import SwiftUI


struct day23: View {
    @State private var useRedText: Bool = false
    
    var body: some View {//kenapa someview? karena objectnya harus jelas
        //body juga ada @viewbuildernya secara otomatis
        //dengan view builder --> boleh nulis beberapa view
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!") // example of order matters
                .padding()
                .background(.red)
                .padding()
                .background(.blue)
                .padding()
                .background(.green)
                .padding()
                .background(.yellow)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)//membolehkan vstack take width dan height sesuai yg diberi
        .background(.red)//inget order matter
        
        //ternary operator juga works di swift
        
        Button("Hello World") {
                    // flip the Boolean between true and false
                    useRedText.toggle()
                }
                .foregroundStyle(useRedText ? .red : .blue)//ternary
        
        Group {//grup ini bisa ngikut parentnya ga kayak vstack or hstack --> kalo di taru di hstack dia ngikut jadi hstack
                Text("Lumos")
                Text("Obliviate")

            }
        
        
        
        //BISA BUAT CUSTOM MODIFIERR!!!
        Text("Hello World")
//            .modifier(Title())
        //damnnn bagus buat button
        //kalo gamau pake .modifier, dan pengennya langsung juga bisa buat extension
            
            .titleStyle()
            
        
        //BISA JUGA KALO MAU ADA PARAMETERNYA
        //MISAL PAKE WATERMARK
            .watermarked(with: "Watermark")
        
    }
    

    

}
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
    }
}

extension View{
    func titleStyle() -> some View{
        modifier(Title())
    }
}

struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}
#Preview {
    day23()
}


