//
//  Library.swift
//  iMusic
//
//  Created by Александр Прайд on 14.09.2020.
//  Copyright © 2020 Alexander Pride. All rights reserved.
//

import SwiftUI

struct Library: View {
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                HStack {
                    Button(action: {
                        print("1234455435354")
                    }, label: {
                        Image(systemName: "play.fill")
                            .frame(width: geometry.size.width / 2 - 10, height: 50)
                            .accentColor(Color.init(#colorLiteral(red: 0.9098039216, green: 0.2666666667, blue: 0.3529411765, alpha: 1)))
                            .background(Color.init(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)))
                            .cornerRadius(10)
                    })
                    
                    Button(action: {
                        print("1234455435354")
                    }, label: {
                        Image(systemName: "arrow.2.circlepath")
                            .frame(width: geometry.size.width / 2 - 10, height: 50)
                            .accentColor(Color.init(#colorLiteral(red: 0.9098039216, green: 0.2666666667, blue: 0.3529411765, alpha: 1)))
                            .background(Color.init(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)))
                            .cornerRadius(10)
                    })
                }
                }.padding().frame(height: 50)
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .navigationBarTitle("Library")
        }
    
        
    }
}

struct Library_Previews: PreviewProvider {
    static var previews: some View {
        Library()
    }
}
