//
//  SpringAnimationController.swift
//  SpringAnimationController
//
//  Created by Pietro Rea on 6/8/18.
//  Copyright © 2018 Pietro Rea. All rights reserved.
//

import UIKit

/// The `SpringAnimationController` class. It conforms to `UIViewControllerAnimatedTransitioning` and plugs into the custom view controller transition infrastructure provided by iOS.
public class SpringAnimationController: NSObject {

    private static let defaultTransitionDuration: TimeInterval = 0.45
    private static let defaultSpringDamping: CGFloat = 0.70
    private static let defaultInitialSpringVelocity: CGFloat = 0.9

    /// Determines how long the animation will take. Defaults to 0.45 seconds.
    public var transitionDuration: TimeInterval = SpringAnimationController.defaultTransitionDuration

    /// Determines how smoothly the spring animation will decelerate to its final position. If `springDamping` is 1, there will be no bouncing. Damping ratios less than 1 will oscillate more and more before coming to a complete stop. The default value is 0.7. Only supported if `isPresenting` is true.
    public var springDamping: CGFloat = SpringAnimationController.defaultSpringDamping

    /// Determines how fast the view controller was traveling upwards before attaching to the invisible spring at the top of the screen. Higher velocities will result in more oscillation. The default value is 0.9. Only supported if `isPresenting` is true.
    public var springVelocity: CGFloat = SpringAnimationController.defaultInitialSpringVelocity

    let isPresenting: Bool

    /// Designated initializer for the class.
    ///
    /// - Parameter isPresenting: True if the view controller is being presented (upwards animation). False if the view controller is being dismissed (downwards animation). Spring-like bouncing is only supported if `isPresenting` is true.
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

            UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0.0, usingSpringWithDamping: springDamping, initialSpringVelocity: springVelocity,  options: [], animations: {

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
