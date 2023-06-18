//
//  CustomChipView.swift
//  ComposePage
//
//  Created by MEKHAK GHAPANTSYAN on 18.06.23.
//

import SwiftUI

struct CustomChipView: View {
    @State var mail: String
    var deleteAction: (()->())?
    var body: some View {
        HStack(spacing: 8) {
            ZStack {
                Color.red
                    .clipShape(Circle())
                    .frame(width: 30, height: 30)
                Text(mail.first?.uppercased() ?? "")
                    .font(.body)
            }
               .padding(10)
           Text(mail)
               .font(.callout)
               .lineLimit(1)
               .padding(10)
            Button {
                if let deleteAction = deleteAction {
                    deleteAction()
                }
            } label: {
                Text("X")
                    .foregroundColor(.red)
            }
            .padding(10)
       }  .overlay(
           RoundedRectangle(cornerRadius: 32)
               .stroke(Color.gray, lineWidth: 1)
               
       )
    }
}

struct CustomChipView_Previews: PreviewProvider {
    static var previews: some View {
        CustomChipView(mail: "hh@hh.io", deleteAction: nil)
    }
}
