//
//  ViewController.swift
//  OpenCombineTest
//
//  Created by Mecca on 2019/11/20.
//  Copyright © 2019 Mecca. All rights reserved.
//

import UIKit

// It not make a crash at line 26
//import Combine
// But this is making a crash at line 26 in XCode 11.2.1
import OpenCombine

class ViewController: UIViewController {
    
    let testSubject = CurrentValueSubject<Int, Never>(5)
    var testInt: Int = 0
    
    private var testSubscription: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // It must make a crash.
        // Crash happened at 'Subscribers.Sink.swift, line: 56, subscription.request(.unlimited), Error: EXC_BAD_ACCESS (code=2, address=0x10d96e889)
        self.testSubscription = self.testSubject.sink(receiveValue: { (value) in
            print("value received = \(value)")
        })
    }

    @IBAction
    func touchUpInsideOfTestButton(_ button: UIButton) {
        self.testInt += 1
        self.testSubject.value = self.testInt
    }
}

