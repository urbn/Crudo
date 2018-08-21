//
//  InputConfig.swift
//  Crudo
//
//  Created by Jason Grandelli on 8/20/18.
//

import Foundation

public struct InputConfig {
    let title: String?
    let hint: String?
    let error: String?
    let leftIcon: UIImage?
    let autocapitalizationType: UITextAutocapitalizationType
    let autocorrectionType: UITextAutocorrectionType
    let spellCheckingType: UITextSpellCheckingType
    let keyboardType: UIKeyboardType
    let enablesReturnKeyAutomatically: Bool
    let isSecureTextEntry: Bool
//    let datePickerConfiguration: DatePickerConfiguration?
//    let customPickerConfiguration: CustomPickable?
//    let customInputViewConfiguration: CustomInputViewable?
//    let leftBottomButtonConfig: FormInputBottomButtonConfig?
//    let rightBottomButtonConfig: FormInputBottomButtonConfig?
    let multilineFormHeight: CGFloat
    let characterLimit: Int?
    let imageSizeLimit: Int // In MB
    let imageCountLimit: Int
    let contentType: UITextContentType?
    let buttonTitles: [String]
//    let sliderConfiguration: SliderInputConfig?
    
    public init(title: String?,
         hint: String? = nil,
         error: String? = nil,
         leftIcon: UIImage? = nil,
         autocapitalizationType: UITextAutocapitalizationType = .sentences,
         autocorrectionType: UITextAutocorrectionType = .default,
         spellCheckingType: UITextSpellCheckingType = .default,
         keyboardType: UIKeyboardType = .default,
         enablesReturnKeyAutomatically: Bool = false,
         isSecureTextEntry: Bool = false,
//         datePickerConfiguration: DatePickerConfiguration? = nil,
//         customPickerConfiguration: CustomPickable? = nil,
//         customInputViewConfiguration: CustomInputViewable? = nil,
//         leftBottomButtonConfig: FormInputBottomButtonConfig? = nil,
//         rightBottomButtonConfig: FormInputBottomButtonConfig? = nil,
         multilineFormHeight: CGFloat = 100,
         characterLimit: Int? = nil,
         imageSizeLimit: Int = 5,
         imageCountLimit: Int = 3,
         contentType: UITextContentType? = nil,
         buttonTitles: [String] = []/*,
         sliderConfiguration: SliderInputConfig? = nil*/) {
        
        self.title = title
        self.hint = hint
        self.error = error
        self.leftIcon = leftIcon
        self.autocapitalizationType = autocapitalizationType
        self.autocorrectionType = autocorrectionType
        self.spellCheckingType = spellCheckingType
        self.keyboardType = keyboardType
        self.enablesReturnKeyAutomatically = enablesReturnKeyAutomatically
        self.isSecureTextEntry = isSecureTextEntry
//        self.datePickerConfiguration = datePickerConfiguration
//        self.customPickerConfiguration = customPickerConfiguration
//        self.customInputViewConfiguration = customInputViewConfiguration
//        self.leftBottomButtonConfig = leftBottomButtonConfig
//        self.rightBottomButtonConfig = rightBottomButtonConfig
        self.multilineFormHeight = multilineFormHeight
        self.characterLimit = characterLimit
        self.imageSizeLimit = imageSizeLimit
        self.imageCountLimit = imageCountLimit
        self.contentType = contentType
        self.buttonTitles = buttonTitles
//        self.sliderConfiguration = sliderConfiguration
    }
}
