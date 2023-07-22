//
//  AboutView.swift
//  MagicOrb
//
//  Created by Simon Erlic on 2023-07-20.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack{
            Text("About Fortune")
                .font(Font.custom(textFont, size: 22))
            
            Text("Fortune was created over two days by Simon Erlic while procrastinating the studying of continuous time signals at the University of Victoria in July, 2023.")
                .font(Font.custom("Vollkorn-Medium", size: 16))
                .multilineTextAlignment(.center)
                .padding()
            
            Text("Hopefully you find as much time wastage using the app as I have found building it.")
                .font(Font.custom("Vollkorn-Medium", size: 16))
                .multilineTextAlignment(.center)
                .padding()
            
            Divider()
            
            ScrollView {
                Text("Resources Used:")
                    .font(Font.custom("Vollkorn-Medium", size: 16))
                    .multilineTextAlignment(.leading)
                    .padding()
                
                Text("[Bluunext](https://velvetyne.fr/fonts/bluu/) by Jean-Baptiste Morizot")
                    .font(Font.custom("Vollkorn-Medium", size: 16))
                
                Text("[AnimateText](https://github.com/jasudev/AnimateText) by jasudev")
                    .font(Font.custom("Vollkorn-Medium", size: 16))
                
                Spacer()
                Text("Copious amounts of Google")
                    .font(Font.custom("Vollkorn-Medium", size: 16))
                Text("Apple Developer guides")
                    .font(Font.custom("Vollkorn-Medium", size: 16))
                
                Spacer()
                
                Text("And the support of my friends and family")
                    .font(Font.custom("Vollkorn-Medium", size: 16))
            }
        }
        .padding()
        
    }
}

#Preview {
    AboutView()
}
