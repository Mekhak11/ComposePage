//
//  ComposeView.swift
//  ComposePage
//
//  Created by MEKHAK GHAPANTSYAN on 15.06.23.
//

import SwiftUI

struct ComposeView<M: ComposePageViewModeling>: View {
    
    @StateObject var viewModel: M = ComposePageViewModel() as! M
    @State var isCcBc: Bool  = false
    var body: some View {
        content
            .onChange(of: viewModel.mailMModel.to) { newValue in
                viewModel.textFieldCHanged(newValue: newValue,toType: .to)
            }
            .onChange(of: viewModel.mailMModel.cc) { newValue in
                viewModel.textFieldCHanged(newValue: newValue,toType: .cc)
            }
            .onChange(of: viewModel.mailMModel.bc) { newValue in
                viewModel.textFieldCHanged(newValue: newValue,toType: .bc)
            }

    }
}
extension ComposeView {
    
    private var content: some View {
        VStack(alignment: .leading) {
            fromField
            Divider()
                .padding(.horizontal,-16)
            toField
            Divider()
                .padding(.horizontal,-16)
            if isCcBc {
                ccField
                Divider()
                    .padding(.horizontal,-16)
                bcField
                Divider()
                    .padding(.horizontal,-16)
            }
            subjectField
            Divider()
                .padding(.horizontal, -16)
            TextEditor(text: $viewModel.mailMModel.mailContent)
            Spacer()
        }.padding(16)
    }
    
    private var fromField: some View {
        HStack(spacing: 16) {
            Text("From:")
                .font(.title.bold())
            TextField("", text: $viewModel.mailMModel.subject)
        }
    }
    
    private var toField: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {

                Text("To:")
                        .font(.title.bold())
                
                VStack(alignment: .leading) {
                    createChips(array: viewModel.mailsArr,type: .to)
                    TextField("", text: $viewModel.mailMModel.to)
                }
                
                Button {
                    isCcBc.toggle()
                } label: {
                    Text("-")
                }
            }
        }
    }
    private var ccField: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                    Text("Cc:")
                        .font(.title.bold())

                VStack(alignment: .leading) {
                    createChips(array: viewModel.ccArr, type: .cc)
                    TextField("", text: $viewModel.mailMModel.cc)
                }
            }
        }
    }
    private var bcField: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                
                    Text("Bc:")
                        .font(.title.bold())

                VStack(alignment: .leading) {
                    createChips(array: viewModel.bcArr, type: .bc)
                    TextField("", text: $viewModel.mailMModel.bc)
                }
            }
        }
    }
    
    private var subjectField: some View {
        HStack(spacing: 16) {
            Text("Subject:")
                .font(.title.bold())
            TextField("", text: $viewModel.mailMModel.from)
        }
    }
    
    private func createChips(array:  [[String]], type: ToType) -> some View {
        ForEach(array, id: \.self) {  arr in
            HStack {
                ForEach(arr, id: \.self) { ml in
                    CustomChipView(mail: ml) {
                        viewModel.removeFromMailsArr(str: ml, type: type)
                    }
                }
            }
        }
    }
    
}

struct ComposeView_Previews: PreviewProvider {
    static var previews: some View {
        ComposeView<ComposePageViewModel>()
    }
}

