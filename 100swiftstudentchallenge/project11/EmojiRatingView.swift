//
//  EmojiRatingView.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 02/09/26.
//

import SwiftUI

struct EmojiRatingView: View {
    let rating: Int
    var body: some View {
        switch rating {
        case 1: return Text("😴")
            case 2: return Text("😐")
        case 3: return Text("😄")
        case 4: return Text("😍")
        case 5: return Text("🤩")
        default: return Text("😴")
        }
    }
}



#Preview {
    EmojiRatingView(rating: 3)
}
