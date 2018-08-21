//
//  FormViewController.swift
//  Crudo
//
//  Created by Jason Grandelli on 8/17/18.
//

import UIKit
import URBNSwiftyConvenience

public struct Section {
    let headerView: UIView?
    let footerView: UIView?
    let inputs: [InputViewModel]
    
    public init(inputs: [InputViewModel], headerView: UIView? = nil, footerView: UIView? = nil) {
        self.headerView = headerView
        self.footerView = footerView
        self.inputs = inputs
    }
}

public class FormViewController: UIViewController {
    fileprivate let stackView = UIStackView()
    fileprivate var scrollView: UIScrollView?
    fileprivate let accessoryView = UIToolbar()

    private let scrollEnabled: Bool

    fileprivate(set) var sections = [Section]()
    fileprivate(set) var fields = [InputViewClass]()

    public init(sections: [Section], scrollEnabled: Bool = true) {
        self.sections = sections
        self.scrollEnabled = scrollEnabled
        
        super.init(nibName: nil, bundle: nil)
        
        update(sections: sections)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        if scrollEnabled {
            let scrollView = UIScrollView()
            view.embed(subview: scrollView)
            addStackView(toParent: scrollView)
            self.scrollView = scrollView
            
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        }
        else {
            addStackView(toParent: view)
        }
    }
    
    func update(sections: [Section]) {
        var index = 0

//        if let globalHeader = globalAccessoryViewConfiguration?.header {
//            stackView.addArrangedSubview(globalHeader)
//        }

        sections.forEach { (section) in
            if let header = section.headerView {
                stackView.addArrangedSubview(header)
            }
            
            fields += section.inputs.map({ (vm) -> InputViewClass in
                let ac = vm.inputType == .switch ? nil : accessoryView
                
                let inputView = vm.inputType.view(for: vm, displayOrder: index, delegate: self, inputAccessoryView: ac)
                // inputView.updateReturnKeyType(.next)
                inputView.accessibilityIdentifier = vm.identifier
                stackView.addArrangedSubview(inputView)
                
                index += 1
                return inputView
            })

            // fields.last?.updateReturnKeyType(.go)
            
            if let footer = section.footerView {
                stackView.addArrangedSubview(footer)
            }

            //        addSubmitButton()
            //
            //        if let globalFooter = globalAccessoryViewConfiguration?.footer {
            //            stackView.addArrangedSubview(globalFooter)
            //        }
        }
    }
    
    // MARK: - Layout Convenience
    private func addStackView(toParent parent: UIView) {
        stackView.axis = .vertical
        parent.addSubviewsWithNoConstraints(stackView)
        stackView.topAnchor.constraint(equalTo: parent.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: parent.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: parent.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: parent.bottomAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: parent.centerXAnchor).isActive = true
    }
    
    // MARK: - Keybaord Animations
    @objc private func keyboardWillShow(_ notification: NSNotification) {
        guard let keyboardFrameValue = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardHeight = keyboardFrameValue.cgRectValue.size.height
        scrollView?.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardHeight, right: 0.0)
    }
    
    @objc private func keyboardWillHide(_ notification: NSNotification) {
        scrollView?.contentInset = .zero
    }
}

// MARK: FloatingInputDelegate Conformance
extension FormViewController: InputDelegate {
    func inputDidBeginEditing(_ inputView: Inputtable) {
//        currentInput = inputView
//        updateInputAccessoryView()
    }
    
    func inputDidEndEditing(_ inputView: Inputtable) {
//        currentInput = nil
//        _ = validateField(inputView)
//        formInputUpdateHandler?(inputView, self, true)
    }
    
    func inputShouldReturn(_ inputView: Inputtable) -> Bool {
//        if inputView.displayOrder == fields.count - 1 {
//            submitForm()
//        }
//        else {
//            goToNextField(fromIndex: inputView.displayOrder)
//        }
        
        return true
    }
    
    func input(_ inputView: Inputtable, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    func editingChanged(_ inputView: Inputtable) {
//        formInputUpdateHandler?(inputView, self, false)
    }
    
    func buttonSelected(_ inputView: Inputtable, at index: Int) {
//        formInputUpdateHandler?(inputView, self, false)
    }
    
    func switchValueDidChange(_ inputView: Inputtable) {
//        formInputUpdateHandler?(inputView, self, false)
    }
}
