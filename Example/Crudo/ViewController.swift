//
//  ViewController.swift
//  Crudo
//
//  Created by Jason Grandelli on 08/16/2018.
//  Copyright (c) 2018 Jason Grandelli. All rights reserved.
//

import UIKit
import Crudo

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let section = Section.init(inputs: [InputViewModel(identifier: "Field1", inputConfig: InputConfig.init(title: "Field 1"), inputType: .textField, validator: nil),
                                            InputViewModel(identifier: "Field2", inputConfig: InputConfig.init(title: "Field 2"), inputType: .textField, validator: nil),
                                            InputViewModel(identifier: "Field3", inputConfig: InputConfig.init(title: "Field 3"), inputType: .textField, validator: nil),
                                            InputViewModel(identifier: "Field4", inputConfig: InputConfig.init(title: "Field 4"), inputType: .textField, validator: nil),
                                            InputViewModel(identifier: "Field5", inputConfig: InputConfig.init(title: "Field 5"), inputType: .textField, validator: nil),
                                            InputViewModel(identifier: "Field6", inputConfig: InputConfig.init(title: "Field 6"), inputType: .textField, validator: nil)
            ])
        
        let formVC = FormViewController(sections: [section])
        
        let nav = UINavigationController(rootViewController: formVC)
        present(nav, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

