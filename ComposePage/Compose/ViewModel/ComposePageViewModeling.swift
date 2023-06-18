//
//  ComposePageViewModeling.swift
//  ComposePage
//
//  Created by MEKHAK GHAPANTSYAN on 18.06.23.
//

import Foundation


protocol ComposePageViewModeling: ObservableObject {
    var mailsArr: [[String]] { get set }
    var ccArr: [[String]] { get set }
    var bcArr: [[String]] { get set }
    var mailMModel: MailModel { get set }
    
    func textFieldCHanged(newValue: String, toType: ToType)
    func removeFromMailsArr(str: String, type: ToType)
    func seperateEmails(mail: String, mailsArr: inout [[String]])
}
