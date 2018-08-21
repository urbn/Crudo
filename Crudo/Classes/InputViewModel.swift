//
//  FormInputViewModel.swift
//  Crudo
//
//  Created by Jason Grandelli on 8/17/18.
//

import UIKit

// TODO: We would basically assume if string is nil that there is no error. Is that what we want to do? We could use LocalizedError but that forces them to provide that and we still need to check the error description. Seems like that is a hidden dependency.
public typealias ErrorMessage = String
public typealias InputValidationHandler = (Any?) -> ErrorMessage?
typealias InputViewClass = Inputtable & UIView

public enum InputType {
    case textField
    case floating
    case multiline
    case `switch`
//
//    var viewClass: FormInputtable.Type {
//        switch self {
//        case .floating:
//            return FloatingInputView.self
//        case .multiline:
//            return MultilineInputView.self
//        case .switch:
//            return SwitchInputView.self
//        case .image:
//            return ImageInputView.self
//        case .button:
//            return ButtonInputView.self
//        case .slider:
//            return SliderInputView.self
//        case .starRating:
//            return StarRatingInputView.self
//        }
//    }
    var viewClass: InputViewClass.Type {
        switch self {
        case .textField:
            return TextFieldInputView.self
        default:
            return TextFieldInputView.self
        }
    }
    
    func view(for vm: InputViewModel, displayOrder: Int, delegate: InputDelegate?, inputAccessoryView: UIView?) -> InputViewClass {
        switch self {
        case .textField:
            return TextFieldInputView.init(viewModel: vm, displayOrder: displayOrder, delegate: delegate, inputAccessoryView: inputAccessoryView)
        default:
            return TextFieldInputView.init(viewModel: vm, displayOrder: displayOrder, delegate: delegate, inputAccessoryView: inputAccessoryView)
        }
    }
}

public class InputViewModel {
    let identifier: String // String to uniquely identify the underlying view model of a FormInputtable type
    let inputConfig: InputConfig  // Configuration options for the form field
    let inputType: InputType    // the type of form field.. i.e. switch, multiline, floating
    private var validator: InputValidationHandler   // a validation handler for the form
    var input: InputRespresentable? // protocol type that represents underlying input data
    var isEditable: Bool = true // boolen used to flagging the textfield if it is disabled or not
    
    public init(identifier: String,
         inputConfig: InputConfig,
         inputType: InputType,
         validator: InputValidationHandler?,
         input: InputRespresentable? = nil,
         isEditable: Bool = true) {
        
        self.identifier = identifier
        self.inputConfig = inputConfig
        self.validator = validator ?? { (_) in return nil }
        self.inputType = inputType
        self.input = input
        self.isEditable = isEditable
    }
    
    // MARK: Validation Funcs
    func validate() -> ErrorMessage? {
        //return validator(input?.value)
        return nil
    }
    
    func clearValidator() {
        validator = { (_) in return nil }
    }
    
    func updateValidator(_ validator: @escaping InputValidationHandler) {
        self.validator = validator
    }
}
