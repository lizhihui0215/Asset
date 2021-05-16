//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 IBAnimatable. All rights reserved.
//

import UIKit

open class PresentNatGeoSegue: UIStoryboardSegue {
    override open func perform() {
        destination.transitioningDelegate = TransitionPresenterManager.shared.retrievePresenter(transitionAnimationType: .natGeo(to: .left))
        source.present(destination, animated: true, completion: nil)
    }
}
