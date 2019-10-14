//
//  ContentView.swift
//  pulkiteye
//
//  Created by Anubhav Singh on 09/10/19.
//  Copyright © 2019 Anubhav Singh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false
    @State var sliderValue: Double = 50.0
    @State var target: Int = Int.random(in: 1...100)
    @State var score = 0
    @State var round = 1
    let MidnightBlue = Color(red: 0.0 / 255.0, green: 51.0 / 255.0, blue: 102.0 / 255.0)
    
    struct labelStyle: ViewModifier {
        
        func body(content: Content) -> some View {
            return content
            .foregroundColor(Color.white)
            .modifier(Shadow())
            .font(Font.custom("Arial Rounded MT Bold", size: 18))
            }
    }
    struct valueStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .modifier(Shadow())
            .foregroundColor(Color.yellow)
            .font(Font.custom("Arial Rounded MT Bold", size: 24))
            }
    }
    
    struct Shadow: ViewModifier {
        func body(content: Content) -> some View {
            return content
                
            .shadow(color: Color.black, radius: 5, x: 2, y: 2)
        
            }
    }
    
    struct buttonLarge: ViewModifier {
    func body(content: Content) -> some View {
        return content
           .foregroundColor(Color.black)
        .font(Font.custom("Arial Rounded MT Bold", size: 18))
        }
    }
    
    struct buttonsmall: ViewModifier {
    func body(content: Content) -> some View {
        return content
           .foregroundColor(Color.black)
        .font(Font.custom("Arial Rounded MT Bold", size: 14))
        }
    }

    
   
    
   
    
    var body: some View {
    VStack {
        
    Spacer()
    //target row
        HStack {
            Text("Put the bully eye close as you can:").modifier(labelStyle())
               
     Text("\(self.target)").modifier(valueStyle())
        }
        Spacer()
        //slider row
    HStack{
        Text("1").modifier(labelStyle())
       /* we also decorate by using direct function insted of using struct .foregroundColor(Color.white)
        .shadow(color: Color.black, radius: 5, x: 2, y: 2)
        .font(Font.custom("Arial Rounded MT Bold", size: 18))*/
        Slider(value: self.$sliderValue, in: 1...100)
        Text("100").modifier(labelStyle())
        
                } 
        Spacer()
        //button row
                        
        Button(action: {
       self.alertIsVisible = true
       }) {
        Text("Hit Me!").modifier(buttonLarge())
           
   }
        .alert(isPresented: $alertIsVisible){ () ->Alert in
       //taking a variable to change the type of slider value from double to int
        //let roundValue: Int = Int(sliderValue.rounded())
        
        return Alert(title: Text(alertTitle()), message: Text(
            "The slider value is : \(sliderValueRounded()). \n" +
            "your Score is \(self.pointForCurrentRound())point this round.")
             , dismissButton: .default(Text("Awesome")){
                //we put 2 function score and target inside button with {} to done both operation after clicking the button
                self.score = self.score + self.pointForCurrentRound()
                self.target = Int.random(in: 1...100)
                self.round = self.round + 1
                })
        }
        .background(Image("Button")).modifier(Shadow())
        
        Spacer()
        //score row
        HStack{
            
        Button(action: {
            self.startOver()
        }) { HStack{
            Image("StartOverIcon")
            Text(/*@START_MENU_TOKEN@*/"Start Over"/*@END_MENU_TOKEN@*/).modifier(buttonsmall())
            }}
            .background(Image("Button")).modifier(Shadow())
        Spacer()
        Text("Score").modifier(labelStyle())
            Text("\(score)").modifier(valueStyle())
        Spacer()
        Text("Round").modifier(labelStyle())
        Text("\(round)").modifier(valueStyle())
            
        Spacer()
            NavigationLink(destination: AboutView()){
                      HStack{
                          Image("InfoIcon")
                      Text("info").modifier(buttonsmall())
                      
                      }
                      }
          
            .background(Image("Button")).modifier(Shadow())
        }
        .padding(.bottom, 4.0)
        
       
           // .padding(.bottom, 2)
    }
    .background(Image("Background"), alignment: .center)
    .accentColor(MidnightBlue)
    .navigationBarTitle("Pulkit's eye")
    }

    //we make let roundValue: Int = Int(sliderValue.rounded()) a global variable 
    func sliderValueRounded() -> Int {
        return Int(sliderValue.rounded())
    }
    func amountOff() -> Int{
        abs(target - sliderValueRounded())
    }
    
    func pointForCurrentRound() -> Int {
        let maximum = 100
        var bonus:Int
        let differnence = amountOff()
        
        if differnence == 0 {
            bonus = 100
        }
        else if differnence == 1 {
            bonus = 50
        }
        else{
            bonus = 0
        }
       /* var difference: Int
        let rondedValue:Int = Int(self.sliderValue.rounded())
        //difference = rondedValue - self.target
       /* for difference if difference < 0{
            difference = -difference
        }*/
        
        // we use a built in finction for absolute value
        difference = abs(rondedValue - self.target)
        let awardedPoint:Int = 100 - difference
        
         return awardedPoint */
        return maximum - differnence + bonus
    }
    
    func alertTitle() -> String
    {
        let difference = amountOff()
        let title:String
        if difference == 0{
            title = "perfect!"
        }
        else if difference < 5{
            title = "you almost have it"
        }
        else if difference < 10{
            title = "not bad"
        }
        else{
            title = "Are you even trying"
        }
        return title
    }
    
    func startOver() {
        score = 0
        round = 1
        sliderValue = 50.0
        target = Int.random(in: 1...100)
    }
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
}

