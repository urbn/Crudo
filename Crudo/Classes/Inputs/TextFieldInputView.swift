//
//  TextFieldInputView.swift
//  Crudo
//
//  Created by Jason Grandelli on 8/20/18.
//

import UIKit

class TextFieldInputView: UIView, Inputtable {
    let viewModel: InputViewModel
    let displayOrder: Int

    var error: String? {
        didSet {
            if error != oldValue {
                // Animate in error here
            }
        }
    }
    
    var respondable: Bool {
        return viewModel.isEditable
    }
    
    override var isFirstResponder: Bool {
        get {
            return textField.isFirstResponder
        }
        set {
            _ = newValue ? textField.becomeFirstResponder() : textField.resignFirstResponder()
        }
    }
    
    var returnKeyType: UIReturnKeyType {
        get {
            return textField.returnKeyType
        }
        set {
            textField.returnKeyType = returnKeyType
        }
    }
    
    private let textField = UITextField(frame: .zero)
    private let titleLabel = UILabel()
    private let errorLabel = UILabel()
    private let line = UIView()
    
    required init(viewModel: InputViewModel, displayOrder: Int, delegate: InputDelegate?, inputAccessoryView: UIView?) {
        self.viewModel = viewModel
        self.displayOrder = displayOrder
        
        super.init(frame: .zero)
        
        let horizontalStack = UIStackView(arrangedSubviews: [titleLabel, textField])
        horizontalStack.axis = .horizontal
        horizontalStack.alignment = .firstBaseline
        horizontalStack.distribution = .fill
        horizontalStack.spacing = 10
        
        let config = viewModel.inputConfig
        
        titleLabel.setContentHuggingPriority(.required, for: .horizontal)
        titleLabel.text = config.title
        
        textField.placeholder = config.hint
        
        errorLabel.text = config.error
        
        let verticalStack = UIStackView(arrangedSubviews: [horizontalStack, line, errorLabel])
        verticalStack.axis = .vertical
        verticalStack.alignment = .fill
        verticalStack.distribution = .fill
        verticalStack.spacing = 2
        
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        line.backgroundColor = .black
        
        addSubview(verticalStack)
        
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        verticalStack.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        verticalStack.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        verticalStack.topAnchor.constraint(equalTo: topAnchor).isActive = true
        verticalStack.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

