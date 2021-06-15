//
//  Onboarding.swift
//  Cash App
//
//  Created by Cas on 15/06/2021.
//

import SwiftUI

struct EmailOnboarding: View {
    @State private var email: String  = ""
    @State private var phone : String = ""
    @State private var currentForm: String = "email"
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack (alignment:.leading) {
                HStack (alignment: .center, spacing: nil, content: {
                    Spacer()
                    Text("?").bold(size:20)
                }).padding()
                
                Text("Enter your email")
                    .medium(size: 18)
                
                
                TextField("tim@apple.com",text: $email).padding(.top, 10)
                    .font(.custom("CashMarket-RegularRounded", size:17))
                
                Spacer()
                
                
                HStack {
                    Button(action:{
                        withAnimation{
                            
                        }
                    })
                    {
                        Text("Use Phone")
                            .book(size: 18)
                            .padding(15)
                            .foregroundColor(.white)
                            .frame(maxWidth:.infinity)
                        
                    }
                    .background(Color.gray)
                    .cornerRadius(30)
                    Spacer()
                    
                    
                    
                    Button(action:{
                        withAnimation{
                            
                        }
                    }) {
                        Text("Next")
                            .book(size: 18)
                            .foregroundColor(.white)
                            .padding(15)
                            .frame(maxWidth:.infinity)
                    }
                    .background(Color.green)
                    .cornerRadius(30)
                    
                }
                
                .padding(.bottom, 20)
                
            }
            
            
        }
        .padding(.horizontal,20)
    }
}

struct EmailOnboarding_Previews: PreviewProvider {
    static var previews: some View {
        EmailOnboarding()
    }
}
