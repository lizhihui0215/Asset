//
//  Created by Jake Lin on 3/14/16.
//  Copyright © 2016 IBAnimatable. All rights reserved.
//

import UIKit

open class PresentFadeWithDismissInteractionSegue: UIStoryboardSegue {
    override open func perform() {
        let transitionPresenterManager = TransitionPresenterManager.shared
        destination.transitioningDelegate = transitionPresenterManager.retrievePresenter(transitionAnimationType: .fade(direction: .cross),
                                                                                         interactiveGestureType: .default)
        source.present(destination, animated: true, completion: nil)
    }
}
