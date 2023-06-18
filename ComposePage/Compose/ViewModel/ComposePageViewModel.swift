//
//  ComposePageViewModel.swift
//  ComposePage
//
//  Created by MEKHAK GHAPANTSYAN on 18.06.23.
//

import Foundation

final class ComposePageViewModel: ComposePageViewModeling, Identifiable {
    @Published var ccArr: [[String]] = []
    @Published var bcArr: [[String]] = []
    @Published var mailsArr: [[String]] = []
    @Published var mailMModel: MailModel = MailModel(from: "", to: "", subject: "", mailContent: "", bc: "", cc: "")
    
    
    func removeFromMailsArr(str: String, type: ToType) {
        switch type {
        case .to: do {
            for i in 0..<self.mailsArr.count {
                self.mailsArr[i].removeAll(where: {$0 == str})
               }
            }
        case .cc: do {
            for i in 0..<self.ccArr.count {
                self.ccArr[i].removeAll(where: {$0 == str})
               }
        }
            
        case .bc:
            for i in 0..<self.bcArr.count {
                self.bcArr[i].removeAll(where: {$0 == str})
               }
        }
    }
    
    func seperateEmails(mail: String, mailsArr: inout [[String]]) {
        if mailsArr.isEmpty {
            mailsArr.append([mail])
        } else {
            if (mailsArr.last?.characterCountSum() ?? 0) + mail.count < 30 {
                mailsArr[mailsArr.count-1].append(mail)
            } else {
                mailsArr.append([mail])
            }
        }
    }
    
    func textFieldCHanged(newValue: String, toType: ToType) {
        if newValue.contains(where: {$0 == " "}) {
            var cp = newValue
            cp.removeLast()
            if cp.isValidEmail() {
                switch toType {
                case .to:
                    seperateEmails(mail: cp, mailsArr: &mailsArr)
                    mailMModel.to = ""
                case .cc:
                    seperateEmails(mail: cp, mailsArr: &ccArr)
                    mailMModel.cc = ""
                case .bc:
                    seperateEmails(mail: cp, mailsArr: &bcArr)
                    mailMModel.bc = ""
                }
               
            }
        }
    }
        
}

enum ToType {
    case to, cc, bc
}
