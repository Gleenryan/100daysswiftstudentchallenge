//
//  day93.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 13/09/26.
//

import SwiftUI

struct day93: View {
    var body: some View {
        
        //you can add the proxy to set the frame
        //geometryreader indeed is very greedy, take all space available
        GeometryReader{ proxy in
            Image(.aldrin)
                .resizable()
                .scaledToFit()
                .frame(width: proxy.size.width * 0.5)
            
        }
        
        HStack {
            Text("IMPORTANT")
                .frame(width: 200)
                .background(.blue)

            Image(.lovell)
                .resizable()
                .scaledToFit()
            //ini mirip kek gemetry tapi gak greedy
                .containerRelativeFrame(.horizontal) { size, axis in
                    size * 0.8
                }
        }
    
    
    }
}

#Preview {
    day93()
}
