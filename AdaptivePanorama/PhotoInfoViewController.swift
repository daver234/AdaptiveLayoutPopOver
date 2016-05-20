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
 * 
 * modified by Dave Rothschild May 18, 2016
*/

import UIKit

class PhotoInfoViewController: UIViewController {
  var photoInfoText = ""
  @IBOutlet weak var label: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()

    modalPresentationStyle = .Popover
    popoverPresentationController?.delegate = self
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    label.text = photoInfoText
    
    let padding: CGFloat = 30
    let baseWidth: CGFloat = 260
    let textRect = (photoInfoText as NSString).boundingRectWithSize(
        CGSize(width: baseWidth, height: 0),
        options: .UsesLineFragmentOrigin,
        attributes: [NSFontAttributeName: label.font], context: nil)
    preferredContentSize = CGSize(width: baseWidth + padding, height: CGRectGetHeight(textRect) + padding)
  }

  func dismissModal() {
    dismissViewControllerAnimated(true, completion: nil)
  }
}

extension PhotoInfoViewController: UIPopoverPresentationControllerDelegate {
  func adaptivePresentationStyleForPresentationController(controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
    if traitCollection.verticalSizeClass == .Regular { return .None
    } else {
        return .FullScreen
    }
  }

  func presentationController(controller: UIPresentationController, viewControllerForAdaptivePresentationStyle style: UIModalPresentationStyle) -> UIViewController? {

    if adaptivePresentationStyleForPresentationController(controller, traitCollection: controller.traitCollection) == .None {
      return nil
    }

    let nav = UINavigationController(rootViewController: controller.presentedViewController)
    let doneButton = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: #selector(PhotoInfoViewController.dismissModal))
    controller.presentedViewController.navigationItem.leftBarButtonItem = doneButton
    return nav
  }
}
