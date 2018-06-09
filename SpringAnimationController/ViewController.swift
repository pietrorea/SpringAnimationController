//
//  ViewController.swift
//  BouncyModalTransition
//
//  Created by Pietro Rea on 6/8/18.
//  Copyright © 2018 Pietro Rea. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var presentButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func presentViewController(_ sender: UIButton) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let presentedViewController = storyboard.instantiateViewController(withIdentifier: "PresentedViewController") as? PresentedViewController else {
            return
        }

        presentedViewController.transitioningDelegate = self
        presentedViewController.modalPresentationStyle = .custom
        present(presentedViewController, animated: true)
    }
}

extension ViewController: UIViewControllerTransitioningDelegate {

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {

        let bouncyTransition = SpringAnimationController(isPresenting: true)
        return bouncyTransition
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {

        let bouncyTransition = SpringAnimationController(isPresenting: false)
        return bouncyTransition
    }
}

