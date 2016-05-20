/*
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit

class AppearanceManager {
  class func setupAppearance() {
    let navbarAppearance = UINavigationBar.appearanceForTraitCollection(UITraitCollection(verticalSizeClass: .Unspecified))
    navbarAppearance.titleTextAttributes =
      [NSFontAttributeName: UIFont(name: "Avenir Next", size: 28)!,
        NSForegroundColorAttributeName: UIColor.redColor()]
    navbarAppearance.tintColor = UIColor.redColor()

    let navbarCompactAppearance = UINavigationBar.appearanceForTraitCollection(UITraitCollection(verticalSizeClass: .Compact))
    navbarCompactAppearance.titleTextAttributes =
      [NSFontAttributeName: UIFont(name: "Avenir Next", size: 20)!,
        NSForegroundColorAttributeName: UIColor.orangeColor()]
    navbarCompactAppearance.tintColor = UIColor.orangeColor()
    
    MyScrollView.appearanceForTraitCollection(UITraitCollection(verticalSizeClass: .Unspecified)).backgroundColor = UIColor.whiteColor()
    MyScrollView.appearanceForTraitCollection(UITraitCollection(verticalSizeClass: .Compact)).backgroundColor = UIColor.lightGrayColor()

    let randomAppearance = MyScrollView.appearanceWhenContainedInInstancesOfClasses([RandomViewController.self])
    randomAppearance.backgroundColor = UIColor.blackColor()
  }
}

class MyScrollView: UIScrollView { }
