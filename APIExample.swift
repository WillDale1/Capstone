//
//  APIExample.swift
//  Amplifytest
//
//  Created by Jennifer Patino on 3/24/22.
//

import SwiftUI

struct APIExample: View {
    var body: some View {
        
        GeometryReader { geometry in
           
                
                VStack(spacing: 30) {
                Image(systemName: "a.square")
                    .resizable()
                    .frame(width: geometry.size.width - 20, height: geometry.size.width - 20, alignment: .center)
                    .cornerRadius(20)
                    .shadow(radius: 10)
         
                VStack(spacing: 8) {
                    Text("Song Title")
                        .font(Font.system(.title).bold())
                    Text("Artist Name")
                        .font(.system(.headline))
                }
                    
                HStack(spacing: 40) {
                    Button(action: {
                        print("Rewind")
                    }) {
                        ZStack {
                            Circle()
                                .frame(width: 80, height: 80)
                                .accentColor(.purple)
                                .shadow(radius: 10)
                            Image(systemName: "backward.fill")
                                .foregroundColor(.white)
                                .font(.system(.title))
                        }
                    }
                 
                    Button(action: {
                        print("Pause")
                    }) {
                        ZStack {
                            Circle()
                                .frame(width: 80, height: 80)
                                .accentColor(.purple)
                                .shadow(radius: 10)
                            Image(systemName: "pause.fill")
                                .foregroundColor(.white)
                                .font(.system(.title))
                        }
                    }
                 
                    Button(action: {
                        print("Skip")
                    }) {
                        ZStack {
                            Circle()
                                .frame(width: 80, height: 80)
                                .accentColor(.purple)
                                .shadow(radius: 10)
                            Image(systemName: "forward.fill")
                                .foregroundColor(.white)
                                .font(.system(.title))
                        }
                    }
                    
                    
                }
                
                HStack(spacing: 40) {
                    Button(action: {
                        print("Dislike")
                    }) {
                        ZStack {
                            Circle()
                                .frame(width: 80, height: 80)
                                .accentColor(.red)
                                .shadow(radius: 10)
                            Image(systemName: "trash.fill")
                                .foregroundColor(.white)
                                .font(.system(.title))
                        }
                    }
                    
                    Button(action: {
                        print("Like")
                    }) {
                        ZStack {
                            Circle()
                                .frame(width: 80, height: 80)
                                .accentColor(.green)
                                .shadow(radius: 10)
                            Image(systemName: "book.fill")
                                .foregroundColor(.white)
                                .font(.system(.title))
                        }
                    }
                }
                
                    
            }
        }
        
    
}
}

struct APIExample_Previews: PreviewProvider {
    static var previews: some View {
        APIExample()
    }
}
