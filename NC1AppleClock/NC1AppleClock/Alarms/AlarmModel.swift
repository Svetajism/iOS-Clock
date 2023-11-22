//
//  AlarmModel.swift
//  NC1AppleClock
//
//  Created by Svetlana Zakharova on 16/11/23.
//

import SwiftUI

struct AlarmModel: View {
    var body: some View {
        ZStack{
            Color.black
            VStack(alignment:
                    .center)
                   {
                Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Label@*/Text("Label")/*@END_MENU_TOKEN@*/
                }
            }
            .padding()
        }
    }
}
#Preview {
    AlarmModel()
}
