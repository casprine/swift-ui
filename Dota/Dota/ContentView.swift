//
//  ContentView.swift
//  Dota
//
//  Created by Cas on 14/06/2021.
//

import SwiftUI

struct generateCategory {
    let id = UUID()
    let name: String
    let itemCount: Int
    let icon: String?
}

let sampleData : [generateCategory] = [
    generateCategory(name:"Home", itemCount:10 , icon:"🏡"),
    generateCategory(name:"Today", itemCount: 24, icon:"⏱"),
    generateCategory(name:"Personal", itemCount:10 , icon:"🏡"),
    generateCategory(name:"Work", itemCount: 24, icon:"🏋🏿‍♀️"),
    generateCategory(name:"Errands", itemCount:10 , icon:"🏎"),
    generateCategory(name:"House", itemCount: 24, icon:"🏚"),
    generateCategory(name:"Road trip list", itemCount:10 , icon:"🚘"),
]

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                HStack{
                    Text("Welcome Casprine")
                        .font(.headline)
                        .padding(.leading, 20)
                        .padding(.top, 10)
         
                    Spacer()
                }
                .frame(width: geometry.size.width)
           
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 15, content: {
                        ForEach(sampleData, id:\.id) { category in
                            Category(name:category.name, icon: category.icon ?? "💰", itemCount:category.itemCount)
                        }
                        Spacer()
                    })
                    .padding()
                }
                
                HStack{
                    Button(action: {
                        withAnimation{
                        }
                    }) {
                        Text("Add New Category")
                            .padding(.vertical, 10)
                            .padding(.horizontal, 25)
                            .foregroundColor(.white)
                            .font(.subheadline)
                    }
                    .background(Color("blue"))
                    .cornerRadius(10)
                    .padding(.bottom, 30)
                    .frame(width: geometry.size.width)
                }
            }
            .background(Color("gray.100"))
        }
        
        
    }
}




struct Category: View {
    var name: String
    var icon: String
    var itemCount: Int
    
    var body: some View {
        HStack(alignment:.center) {
            
            Text("\(icon)")
            Text("\(name)")
                .font(.custom("whitney-semibold", size: 15))
            
            Spacer()
            
            HStack{
                Text("\(itemCount)")
                    .font(.caption)
                    .padding(.horizontal,4)
                    .padding(.vertical, 4)
            }.background(Color("gray"))
            .cornerRadius(4)
            
        }
        
        .padding(15)
        .cornerRadius(10)
        .background(Color.white)
        .shadow(color: Color(UIColor.black.withAlphaComponent(0.1)), radius: 4)
    }
}



//extension View {
//    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
//        clipShape( RoundedCorner(radius: radius, corners: corners) )
//    }
//}
//
//
//struct RoundedCorner: Shape {
//    var radius: CGFloat = .infinity
//    var corners: UIRectCorner = .allCorners
//
//    func path(in rect: CGRect) -> Path {
//        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
//        return Path(path.cgPath)
//    }
//}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
