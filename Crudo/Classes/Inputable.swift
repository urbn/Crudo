//
//  Input.swift
//  Crudo
//
//  Created by Jason Grandelli on 8/17/18.
//

import UIKit

protocol InputDelegate {
    func inputDidBeginEditing(_ inputView: Inputtable)
    func inputDidEndEditing(_ inputView: Inputtable)
    func inputShouldReturn(_ inputView: Inputtable) -> Bool
    func inputShouldClear(_ inputView: Inputtable) -> Bool
    func input(_ inputView: Inputtable, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    func switchValueDidChange(_ inputView: Inputtable)
    func buttonSelected(_ inputView: Inputtable, at index: Int)
}

extension InputDelegate {
    func inputDidBeginEditing(_ inputView: Inputtable) {}
    func inputDidEndEditing(_ inputView: Inputtable) {}
    func inputShouldReturn(_ inputView: Inputtable) -> Bool { return true }
    func inputShouldClear(_ inputView: Inputtable) -> Bool { return true }
    func input(_ inputView: Inputtable, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool { return true }
    func switchValueDidChange(_ inputView: Inputtable) {}
}

protocol Inputtable {//where Self: UIView {
    var error: String? { get set }
    var viewModel: InputViewModel { get }
    
    /// Used to move to next/previous fields on tab
    var displayOrder: Int { get }

    /// Whether or not the field can become the next responder. For instance a switch field can not
    var respondable: Bool { get }
    
    /// Makes the input the first responder or resigns the input from being the first responder
    var isFirstResponder: Bool { get set }

    /// Sets and updates the return key type
    var returnKeyType: UIReturnKeyType { get set }
    
    init(viewModel: InputViewModel, displayOrder: Int, delegate: InputDelegate?, inputAccessoryView: UIView?)
}
