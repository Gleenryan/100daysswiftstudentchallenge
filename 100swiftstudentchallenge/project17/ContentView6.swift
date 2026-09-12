//
//  ContentView6.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 12/09/26.
//

import SwiftUI

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        //kalo mau kebalikannya tinggal hapus total - nya(cuma pake position)
        return self.offset(y: offset * 10)
    }
}

struct ContentView6: View {
    @State private var cards = Array<Card>(repeating: .example, count: 10)
    
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    ForEach(0..<cards.count, id: \.self) { index in
                        CardView(card: cards[index]){
                            withAnimation{
                                removeCard(at: index)
                            }
                        }
                            .stacked(at: index, in: cards.count)
                    }
                }
            }
        }
    }
    
    func removeCard(at index: Int){
        cards.remove(at: index)
    }
    
    
}

#Preview {
    ContentView6()
}
