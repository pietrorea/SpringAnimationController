//
//  SpringAnimationController.swift
//  SpringAnimationController
//
//  Created by Pietro Rea on 6/8/18.
//  Copyright © 2018 Pietro Rea. All rights reserved.
//

import UIKit

public class SpringAnimationController: NSObject {

    private static let defaultTransitionDuration: TimeInterval = 0.45
    private static let defaultDelay: TimeInterval = 0.0
    private static let defaultSpringDamping: CGFloat = 0.70
    private static let defaultInitialSpringVelocity: CGFloat = 0.9

    private let isPresenting: Bool

    var transitionDuration: TimeInterval = SpringAnimationController.defaultTransitionDuration
    var delay: TimeInterval = SpringAnimationController.defaultDelay
    var springDamping: CGFloat = SpringAnimationController.defaultSpringDamping
    var springVelocity: CGFloat = SpringAnimationController.defaultInitialSpringVelocity

    public init(isPresenting: Bool) {
        self.isPresenting = isPresenting
    }
}


extension SpringAnimationController: UIViewControllerAnimatedTransitioning {

    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return transitionDuration
    }

    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        guard let presentingVC = transitionContext.viewController(forKey: .from),
            let presentedVC = transitionContext.viewController(forKey: .to) else {
                return
        }

        if isPresenting {

            transitionContext.containerView.addSubview(presentedVC.view)

            var newFrame = presentedVC.view.frame
            newFrame.origin.y = presentedVC.view.frame.size.height
            presentedVC.view.frame = newFrame

            UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: delay, usingSpringWithDamping: springDamping, initialSpringVelocity: springVelocity,  options: [], animations: {

                let finalFrame = transitionContext.finalFrame(for: presentedVC)
                presentedVC.view.frame = finalFrame

            }) { (finished) in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }

        } else {

            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {

                let finalFrame = presentingVC.view.frame.offsetBy(dx: 0, dy: presentingVC.view.frame.size.height)
                presentingVC.view.frame = finalFrame

            }) { (finished) in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        }
    }
}
