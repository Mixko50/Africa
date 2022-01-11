//
//  CreditsView.swift
//  Africa
//
//  Created by Mixko on 11/1/2565 BE.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            
            Text("""
    Copyright © Mixko
    All right reserved
    Better Apps 🤍 Less Code
    """)
                .font(.footnote)
            .multilineTextAlignment(.center)
        } //: VStack
        .padding()
        .opacity(0.4)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
