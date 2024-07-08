//
//  NoListView.swift
//  TodoList
//
//  Created by Adarsh Chaurasia on 18/04/24.
//

import SwiftUI

struct NoListView: View {
    
    @State var animate : Bool = false
    
    var body: some View {
        ScrollView{
            VStack(spacing : 20){
                Text("There are no items !!")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Be more productive and add some todo to finish them on time ")
                    .padding(.bottom, 20)
                NavigationLink(
                    destination: AddView(),
                    label: {
                        Text("Add something")
                            .foregroundColor(.black)
                            .font(.headline)
                            .frame(height: 50)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(animate ?
                        Color("NewColor"):
                         Color.accentColor )
                                                    
                            
                    }).padding(.horizontal, animate ? 30:50)
                    .shadow(color: animate ? 
                            Color("NewColor").opacity(0.7) :
                                Color.accentColor.opacity(0.7),
                            radius: animate ? 30:50,
                            x:0, y: animate ? 50 :30)
                    .offset(y: animate ? -7 : 0)
                
                
            }.padding(40)
                .multilineTextAlignment(.center)
                .onAppear(perform: addAnimation)
            
            
        }.frame(maxWidth : .infinity, maxHeight: .infinity)
    }
    
    func addAnimation(){
        guard !animate else {return}
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            withAnimation (Animation
                .easeInOut(duration: 2.0)
                .repeatForever()
            ){
                animate.toggle()
            }
        }
    }
    
}

#Preview {
    NoListView()
}
