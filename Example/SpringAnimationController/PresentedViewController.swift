//
//  PresentedViewController.swift
//  SpringAnimationController
//
//  Created by Pietro Rea on 6/8/18.
//  Copyright © 2018 Pietro Rea. All rights reserved.
//

import UIKit

class PresentedViewController: UIViewController {

    @IBOutlet weak var closeBarButtonItem: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func close(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}
