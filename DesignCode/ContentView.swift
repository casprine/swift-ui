//
//  ContentView.swift
//  DesignCode
//
//  Created by Cas on 13/06/2021.
//

import SwiftUI


// constants
let deviceWidth: CGFloat = 320
let deviceHeight: CGFloat = 568
let hasFaceID = true // false for TouchID


struct Checkout: View {
    @State var isSheetOpen = false
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                VStack {
                    Spacer()
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.4)) {
                            self.isSheetOpen = true
                        }
                    }) {
                        HStack {
                            Text("Checkout with ZeePay")
                                .foregroundColor(Color(UIColor.systemBackground))
                                .font(.custom("whitney-semibold", size: 17))
                        }
                        .padding(.vertical, 10).padding(.horizontal, 30)
                        .background(Color("green"))
                        .cornerRadius(8)
                    }
                    Spacer()
                }
                
                Rectangle()
                    .foregroundColor(Color(UIColor.black.withAlphaComponent(0.5)))
                    .opacity(self.isSheetOpen ? 1 : 0)
                
                
                ZepoPaySheet(isSheetOpen: self.$isSheetOpen)
                    .offset(x: 0, y: self.isSheetOpen ? 0 : geometry.size.height)
            }
        }
    }
}


struct ZepoPaySheet: View {
    @Binding var isSheetOpen: Bool
    @State var quantity: Int = 1
    let price: Double = 488.99
    

    
    var body: some View {
        VStack(spacing: 0) {

            Divider()
                    
            VStack(alignment: .leading) {
                Text("My Cart")
                    .padding(.vertical, 10)
                    .font(.custom("whitney-semibold", size: 20))
                
                
                HStack(alignment: .center){
                    HStack {
                        Image("headphones")
                            .resizable()
                            .scaledToFit()
                    }
                    .frame(width: 120, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color("coolGray"))
                    .cornerRadius(8)

                    Spacer()

                    
                    VStack(spacing:0) {
                        Text("Sony WH-1000xm4")
                            .padding(.vertical, 5)
                            .font(.custom("whitney-semibold", size: 18))
                        Text("$\(price, specifier: "%.2f")").font(.custom("whitney-book", size: 15 ))
                        
                   
                        
                        HStack {
                            
                            Button(action :{
                                withAnimation{
                                    self.quantity -= 1
                                }
                            }) {
                                Text("-")
                            }.frame(width:25, height:25)
                            .border(Color("coolGray"))
                            .padding(10)
                            
                        
                            Text("\(quantity)")
                                .frame(width:20,height:20)
                            
                            Button(action :{
                                withAnimation{
                                    self.quantity += 1
                                }
                            }) {
                                Image(systemName: "plus").font(.system(size:12))
                            }.frame(width:25, height:25)
                            .border(Color("coolGray"))
                            .padding(10)

                        }
                    }
                    .padding(.trailing,5)

                }
                
            }.frame(width: deviceWidth)
            .padding(.vertical, 10)
            
            

            
            VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                Text("Delivery Location")
                    .padding(.vertical, 10)
                    .font(.custom("whitney-semibold", size: 20))
                
                
                
                HStack(alignment: .center){
                    HStack {
                        Image(systemName: "mappin")
                            .font(.system(size:12))
                            .foregroundColor(Color("green"))
                    }
                    .frame(width: 30, height: 30).background(Color("coolGray")).cornerRadius(8)
                    
                    VStack(alignment: .leading) {
                        Text("Abeka Lapaz").font(.custom("whitney-semibold", size: 14)).foregroundColor(Color("blackText"))
                        Text("Accra, Ghana").font(.custom("whitney-book", size: 12))
                    }
                    .font(.footnote)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .padding(.trailing)
                        .font(.system(size:15))
                        .foregroundColor(Color(UIColor.blue))
                }.padding(.bottom, 5)
                
                
                
            }).frame(width:deviceWidth)
            .padding(.vertical, 10)
            
            
            
            VStack(alignment: .leading){
                Text("Payment Method")
                    .padding(.vertical, 10)
                    .font(.custom("whitney-semibold", size: 20))
                
                HStack(alignment: .center){
                    HStack {
                        Image(systemName: "dollarsign.circle")
                            .font(.system(size:15))
                            .foregroundColor(Color("green"))
                    }
                    .frame(width: 30, height: 30).background(Color("coolGray")).cornerRadius(8)
                    
                    VStack(alignment: .leading) {
                        Text("ZeePay Cash").font(.custom("whitney-semibold", size: 14)).foregroundColor(Color("blackText"))
                        Text("$10,000").font(.custom("whitney-book", size: 12))
                    }
                    .font(.footnote)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .padding(.trailing)
                        .font(.system(size:15))
                        .foregroundColor(Color(UIColor.black))
                }.padding(.bottom, 10)
                
                
                
                
                HStack(alignment: .center){
                    HStack {
                        Image(systemName: "creditcard.fill")
                            .font(.system(size:10))
                            .foregroundColor(Color("green"))
                    }
                    .frame(width: 30, height: 30).background(Color("coolGray")).cornerRadius(8)
                    
                    VStack(alignment: .leading) {
                        Text("VISA Classic").font(.custom("whitney-semibold", size: 14)).foregroundColor(Color("blackText"))
                        Text("******-3353").font(.custom("whitney-book", size: 12))
                    }
                    .font(.footnote)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .padding(.trailing)
                        .font(.system(size:15))
                        .foregroundColor(Color(UIColor.black))
                }
                
            }.frame(width:deviceWidth)
            .padding(.vertical, 10)
            
            
            VStack(alignment: .leading){
                Text("Order Info")
                    .padding(.vertical, 10)
                    .font(.custom("whitney-semibold", size: 20))
                
                HStack(){
                    Text("Subtotal").foregroundColor(Color(UIColor.darkGray))
                        .font(.custom("whitney-book", size: 15))
                    
                    Spacer()
                    Text("$\(Double(quantity) * price , specifier:"%.2f")").foregroundColor(Color(UIColor.black))
                        .font(.custom("whitney-book", size: 14))
                }.padding(.vertical,5)
                
                
                HStack(){
                    Text("Shipping Cost").foregroundColor(Color(UIColor.darkGray))
                        .font(.custom("whitney-book", size: 14))
                    Spacer()
                    Text("+ $10.00").foregroundColor(Color(UIColor.black))
                        .font(.custom("whitney-book", size: 14))
                }.padding(.vertical,5)
                
                
            }.frame(width:deviceWidth)
            .padding(.vertical, 10)
            
            
            VStack(spacing: 16) {
                HStack {
                    Button(action: {
                        withAnimation {
                            self.isSheetOpen = false
                        }
                    }) {
                        Text("Pay $\( Double(quantity) * price + 100 ,specifier: "%.2f")")
                            .font(.custom("whitney-semibold", size: 17))
                            .foregroundColor(Color(UIColor.systemBackground))
                    }
                }
                .frame(width: deviceWidth - 50)
                .padding(.vertical, 15)
                .padding(.horizontal, 30)
                .background(Color(UIColor.black))
                .cornerRadius(8)
            }
            .padding(.vertical, 12)
            
        }
        .background(Color(UIColor.white))
    }
}





extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}


struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Checkout()
        }
    }
}
