//
//  aboutview.swift
//  pulkiteye
//
//  Created by Anubhav Singh on 13/10/19.
//  Copyright © 2019 Anubhav Singh. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    
    struct labelStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        return content
            .foregroundColor(Color.black)
        .font(Font.custom("Arial Rounded MT Bold", size: 16))
        .padding(.leading, 60)
        .padding(.trailing, 60)
            .padding(.bottom, 20)
        
        }
    }
    
    struct headingModifier: ViewModifier {
       
       func body(content: Content) -> some View {
           return content
               .foregroundColor(Color.black)
           .font(Font.custom("Arial Rounded MT Bold", size: 30))
           .padding(.top, 20)
           .padding(.bottom, 20)
           
           }
       }
    
   var body: some View {
    Group{
    VStack {
      Text("🎯 Bullseye 🎯").modifier(headingModifier())
    Text("This is Bullseye, the game where you can win points and earn fame by dragging a slider.").modifier(labelStyle())
    Text("Your goal is to place the slider as close as possible to the target value. The closer you are, the more points you score.").modifier(labelStyle())
        Text("Enjoy!").modifier(labelStyle())
    }
    .navigationBarTitle("About Pulkit's eye")
    .background(Color.init(red: 255.0 / 255.0, green: 214.0 / 255.0, blue: 179.0 / 255.0))
  }
   .background(Image("Background"))
    }
}


struct AboutView_Previews: PreviewProvider {
  static var previews: some View {
    AboutView().previewLayout(.fixed(width: 896, height: 414))
  }
}

