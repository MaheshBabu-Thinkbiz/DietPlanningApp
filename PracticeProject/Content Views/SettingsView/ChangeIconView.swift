//
//  ChangeIconView.swift
//  PracticeProject
//
//  Created by Mahesh on 08/02/24.
//

import SwiftUI

struct ChangeIconView: View {
    var body: some View {
        List{
            Button{
                
            }label: {
                HStack{
                    Image("IconApp").resizable().frame(width: 50, height: 50)
                    Text("Default").foregroundStyle(Color.textColor)
                }
            }.padding(5)
            
            Button{
                CommonFunctions.Functions.changeAppIcon(to: "CloudIcon")
            }label: {
                HStack{
                    Image("CloudIcon").resizable().frame(width: 50, height: 50)
                    Text("Cloud Icon").foregroundStyle(Color.textColor)
                }
            }.padding(5)
            
            Button{
                
            }label: {
                HStack{
                    Image("IconApp").resizable().frame(width: 50, height: 50)
                    Text("Cloud").foregroundStyle(Color.textColor)
                }
            }.padding(5)
        }
    }
}

#Preview {
    ChangeIconView()
}
