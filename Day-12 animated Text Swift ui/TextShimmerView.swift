//
//  TextShimmerView.swift
//  Day-12 animated Text Swift ui
//
//  Created by Apple  on 27/12/22.
//

import SwiftUI

struct TextShimmerView: View {
    var text:String
    @State var animation = false
    @Binding var multiColor:Bool
    
    var body: some View {
        ZStack{
            Text(text)
                .font(.system(size:75,weight: .bold))
                .foregroundColor(Color.white.opacity(0.25))
            
            //multicolor text
            HStack(spacing:0){
                ForEach(0..<text.count,id:\.self){index in
                    Text(String(text[text.index(text.startIndex,offsetBy: index)]))
                        .font(.system(size:75,weight: .bold))
                        .foregroundColor(multiColor ? randomColor() : Color.white)
                }
            }
            //masking for shimmer effect
            .mask {
                Rectangle()
                //for some for nice effect were going to use gradient
                    .fill(
                        //can use any colour
                        LinearGradient(gradient: .init(colors: [Color.white.opacity(0.5),Color.white,Color.white.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
                    )
                    .rotationEffect(.init(degrees: 70))
                    .padding(20)
                
                    //moving view continuously
                    //so it will create shimmer effect
                
                    .offset(x:-250)
                    .offset(x:animation ? 500 : 0 )
                
            }
            .onAppear {
                withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)){
                    animation.toggle()
                }
                
            }
        }
        
       
    }
    
    //Random colors
    //we can try different setting
    func randomColor()->Color{
        let color = UIColor(red:1, green: .random(in: 0...1),blue: .random(in: 0...1),alpha: 1)
        return Color(color)
    }
}

struct TextShimmerView_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
