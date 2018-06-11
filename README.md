# SpringAnimationController

[![Version](https://img.shields.io/cocoapods/v/SpringAnimationController.svg?style=flat)](https://cocoapods.org/pods/SpringAnimationController)
[![License](https://img.shields.io/cocoapods/l/SpringAnimationController.svg?style=flat)](https://cocoapods.org/pods/SpringAnimationController)
[![Platform](https://img.shields.io/cocoapods/p/SpringAnimationController.svg?style=flat)](https://cocoapods.org/pods/SpringAnimationController)

![Demo](https://user-images.githubusercontent.com/1264371/41214965-f2636130-6d1b-11e8-8ac3-5e415d56664c.gif)

## About

`SpringAnimationController` provides a subtle way to spice up the default modal presentation style on iOS using spring animations. Simply implement the `UIViewControllerTransitioningDelegate`  protocol and return this animation controller to add some bounce at the top of your modal presentation.

## Usage

First, set up the view controller that you want to present modally and trigger the model presentation as you normally would.

```swift
let viewControllerToPresent = PresentedViewController()
viewControllerToPresent.transitioningDelegate = self
viewControllerToPresent.modalPresentationStyle = .custom

present(viewControllerToPresent, animated: true)
```

Next, implement `UIViewControllerTransitioningDelegate`  to return an instance of `SpringyAnimationController`

```swift
func animationController(forPresented presented: UIViewController,
presenting: UIViewController,
source: UIViewController) -> UIViewControllerAnimatedTransitioning? {

    let bouncyTransition = SpringAnimationController(isPresenting: true)
    return bouncyTransition
}

func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {

    let bouncyTransition = SpringAnimationController(isPresenting: false)
    return bouncyTransition
}
```
You can also customize the animation duration, spring damping and spring velocity before returning the animation controller.

```swift
let bouncyTransition = SpringAnimationController(isPresenting: true)
bouncyTransition.transitionDuration = 0.35
bouncyTransition.springDamping = 0.5
bouncyTransition.springVelocity = 0.7
```

## Example

To run the example project,  simply run `pod try SpringAnimationController` .

## Requirements

iOS 10 and above

## Installation Instructions

SpringAnimationController is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SpringAnimationController'
```

## License

SpringAnimationController is available under the MIT license. See the LICENSE file for more info.
