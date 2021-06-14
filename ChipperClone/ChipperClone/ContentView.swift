//
//  ContentView.swift
//  ChipperClone
//
//  Created by Cas on 14/06/2021.
//

import SwiftUI

struct ContentView: View {
    
    //    init() {
    //        UITabBar.appearance().backgroundColor = UIColor.blue
    //    }
    
    var body: some View {
        ZStack (alignment: .bottomTrailing) {
            TabView{
                ProfileScreen().tabItem {
                    Image(systemName: "person")
                }
            }
        }.statusBar(hidden: false)
        
        
        
    }
}

struct ProfileScreen: View {
    var body: some View {
        
        VStack {
            NavigationView {
                ScrollView (.vertical, showsIndicators: false) {
                    VStack (alignment: .leading) {
                        ProfileSection()
                        SectionDivider(height:40)
                        AccountBalanceSection()
                        SectionDivider(height:40)
                        AirtimeSection()
                        SectionDivider(height:40)
                        SettingsSection()
                        SectionDivider(height:40)
                        UnlockServicesSection()
                        SectionDivider(height:40)
                    }
                }
                .navigationBarTitle("Profile", displayMode: .inline)
                
            }.navigationViewStyle(StackNavigationViewStyle())
        }
    }
}


struct SectionDivider: View  {
    var height : CGFloat
    var body: some View {
        Rectangle()
            .fill(Color("gray.100"))
            .frame(height: height)
            .edgesIgnoringSafeArea(.horizontal)
    }
}



struct ProfileSection: View {
    var body: some View {
        HStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            Spacer().border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            VStack(alignment: .center, spacing: 2, content: {
                ZStack {
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width:65, height:65)
                        .padding(.bottom, 10)
                        .foregroundColor(Color(UIColor.systemGreen))
                    
                    Text("C").padding(.bottom, 10).font(.title).foregroundColor(.white)
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width:30, height:30)
                        .foregroundColor(Color.white)
                        .padding(.top,40)
                        .padding(.leading,40)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    
                    Image("qr").resizable().frame(width:20,height:20)
                        .padding(.top,40)
                        .padding(.leading,40)
                        
                    
                    
                    
                }
                Text("Casprine Assempah").font(.headline)
                
                Text("@casprine").font(.subheadline).foregroundColor(Color.gray)
            }).padding(20)
            Spacer()
        }).background(Color.white)
    }
}





struct AccountBalanceSection: View{
    var body: some View{
        VStack{
            HStack (alignment:.center){
                Spacer()
                Text("My Balance: $0.20")
                    .foregroundColor(Color(UIColor.systemGreen))
                    .font(.system(size:15, weight:.semibold))
                Spacer()
            }
            .padding(10)
            SectionDivider(height:2)
            
            VStack {
                ActionItem(title: "Add Cash", subTitle: "Transfer cash from mobile money into Chipper")
                ActionItem(title: "Cash Out", subTitle: "Transfer cash from Chipper into mobile money")
                ActionItem(title: "Check Rates", subTitle: "See Current foreign exchange rates", showDivider: false)
            }.padding(.horizontal, 20)
        }
        .background(Color.white)
    }
}



struct AirtimeSection: View  {
    var body: some View {
        VStack{
            ActionItem(title:"Buy Airtime",subTitle: "Buy discounted airtime with your Chipper balance", showDivider: false)
        }.padding(.horizontal,15)
    }
}


struct SettingsSection: View{
    var body: some View {
        VStack{
            ActionItem(title: "Personal", subTitle: "Sign into your account using multiple phone numbers and emails")
            ActionItem(title: "Payment Methods", subTitle: "Add multiple mobile money accounts")
            ActionItem(title: "Transfer Limit", subTitle: "Check money transfer limits")
            ActionItem(title: "Settings", subTitle: "Control your notification and security settings", showDivider: false)
        }.padding(.horizontal,15)
    }
}


struct UnlockServicesSection :View  {
    var body: some View {
        
        VStack (alignment: .center, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            Text("Unlock all Chipper Cash has to offer...").font(.system(size:13, weight:.light))
            HStack{
                Spacer()
                Button(action:{
                    withAnimation{

                    }
                }) {
                    Text("Get Verified").font(.headline).foregroundColor(.white)
                        .padding(.vertical,13)
                }
                Spacer()
            }
            .background(Color.green).cornerRadius(20)
            Divider()
            Text("Get Support").font(.system(size:13, weight:.medium)).foregroundColor(Color.green)
            
        })
        
        
        
        
        .padding(15)
    }
}





struct ActionItem: View {
    var title:String
    var subTitle: String
    var showDivider: Bool = true
    
    var body: some View {
        VStack{
            Button(action:{
                withAnimation{
                    
                }
            }) {
                HStack(alignment:.bottom){
                    VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                        Text("\(title)")
                            .font(.system(size:16,weight:.semibold))
                            .foregroundColor(Color("gray.800"))
                        Text("\(subTitle)")
                            .font(.system(size:12))
                            .foregroundColor(Color("gray.400"))
                    })
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.system(size:15))
                        .foregroundColor(Color("gray.400"))
                    
                }
            }
            if showDivider {
                SectionDivider(height:1)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
