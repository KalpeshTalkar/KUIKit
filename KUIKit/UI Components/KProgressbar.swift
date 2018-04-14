//
//  KProgressbar.swift
//
//  Created by Kalpesh on 20/02/18.
//  Copyright © 2018 Kalpesh Talkar. All rights reserved.
//

import UIKit

@IBDesignable
public class KProgressbar: UIView {

    /// Prograss to show on the bar.
    @IBInspectable public var progress: Int = 0 {
        didSet {
            updateFrame(animated: false)
        }
    }

    /// Color for the progress.
    @IBInspectable public var progressColor: UIColor = UIColor.blue {
        didSet {
            updateColor()
        }
    }

    /// Background color of the progressbar.
    @IBInspectable public var placeHolderColor: UIColor = UIColor.groupTableViewBackground {
        didSet {
            updateColor()
        }
    }

    private var progressView: UIView?

    // MARK: - init methods
    override public init(frame: CGRect) {
        super.init(frame: frame)
        prepareUI()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepareUI()
    }

    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        prepareUI()
    }

    // MARK: - Prepare UI
    private func prepareUI() {
        if progressView == nil {
            progressView = UIView()
            addSubview(progressView!)
        }
        updateControl()
    }

    override public func layoutSubviews() {
        super.layoutSubviews()
        updateControl()
    }

    private func updateControl() {
        updateFrame(animated: false)
        updateColor()
    }

    private func updateFrame(animated: Bool) {
        var fr = frame
        fr.origin = CGPoint.zero
        fr.size.width = frame.width * CGFloat(progress)/100.0
        progressView?.frame = fr
    }

    private func updateColor() {
        backgroundColor = placeHolderColor
        progressView?.backgroundColor = progressColor
    }


    /// Set progress of the progressbar.
    ///
    /// - Parameters:
    ///   - value: progress in percentage. (max is 100)
    ///   - animated: true if animate progress change.
    ///   - animationDuration: duration for animation.
    ///   - completion: called after animation completes.
    public func setProgress(value: Int, animated: Bool = false, animationDuration: TimeInterval = 0.5, completion: ((Bool) -> Swift.Void)? = nil) {
        if !animated {
            progress = value
        } else {
            UIView.animate(withDuration: animationDuration, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
                self.progress = value
                self.layoutIfNeeded()
            }, completion: { (completed) in
                if completion != nil {
                    completion!(completed)
                }
            })
        }
    }

}
