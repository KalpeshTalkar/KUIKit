//
//  Copyright © 2017 Kalpesh Talkar. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
//  For support: https://gist.github.com/KalpeshTalkar/0f427d0fb13fa898cadc9cebe4f712c2
//

import UIKit

public typealias AnimationCompleted = (_ completed: Bool) -> (Void)

@IBDesignable
public class KCircularProgressbar: UIView, CAAnimationDelegate {

    // MARK: - IBInspectable properties

    /// Width of the progress bar.
    @IBInspectable public var lineWidth: CGFloat = 3 {
        didSet {
            placeholderLayer.lineWidth = lineWidth
            progressLayer.lineWidth = lineWidth
        }
    }

    /// Progress of the progressbar.
    @IBInspectable public var progress: Float = 0 {
        didSet {
            layoutSubviews()
            updateProgressLabelText()
        }
    }

    /// Color of the progress.
    @IBInspectable public var progressTint: UIColor? {
        didSet {
            progressLayer.strokeColor = progressTint?.cgColor ?? tintColor.cgColor
        }
    }

    /// Background color of the progressbar.
    @IBInspectable public var placeHolderTint: UIColor? {
        didSet {
            placeholderLayer.strokeColor = placeHolderTint?.cgColor ?? tintColor.cgColor
        }
    }

    /// Shows progress text in the center.
    @IBInspectable public var showsLabel: Bool = true {
        didSet {
            configureLabel()
        }
    }

    /// Color of the progress text.
    @IBInspectable public var progressLabelTint: UIColor? {
        didSet {
            label.textColor = progressLabelTint ?? tintColor
        }
    }

    // MARK: - Private
    private let placeholderLayer = CAShapeLayer()
    private let progressLayer = CAShapeLayer()
    private var label = UILabel()
    // Animation
    private var animationBlock: AnimationCompleted?
    private let DrawCircleAnimation = "drawCircleAnimation"

    // MARK: - init methods
    override public init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }

    // MARK: - layout subviews
    override public func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = UIColor.clear
        placeholderLayer.frame = bounds
        placeholderLayer.path = circlePath(progress: 1).cgPath
        progressLayer.frame = bounds
        progressLayer.path = circlePath(progress: progress).cgPath
        updateLabelFrame()
    }

    // MARK: - Configure view
    private func configure() {
        // Background color
        backgroundColor = UIColor.clear

        // Placeholder layer
        placeholderLayer.frame = bounds
        placeholderLayer.lineWidth = lineWidth
        placeholderLayer.fillColor = UIColor.clear.cgColor
        placeholderLayer.strokeColor = placeHolderTint?.cgColor ?? UIColor.groupTableViewBackground.cgColor
        layer.addSublayer(placeholderLayer)

        // Progress layer
        progressLayer.frame = bounds
        progressLayer.lineWidth = lineWidth
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = progressTint?.cgColor ?? tintColor.cgColor
        layer.addSublayer(progressLayer)

        // Progress label
        configureLabel()
    }

    // MARK: - Configure label
    private func configureLabel() {
        label.removeFromSuperview()
        label = UILabel()
        label.frame = bounds
        updateLabelFrame()
        addSubview(label)
        label.textColor = progressLabelTint ?? tintColor
        label.textAlignment = .center
        updateProgressLabelText()
    }

    private func updateLabelFrame() {
        label.frame = bounds
        label.font = UIFont.systemFont(ofSize: bounds.width/3.5)
    }

    private func updateProgressLabelText() {
        label.text = showsLabel ? String(format: "%.0f%@", progress*100,"%") : ""
    }

    // MARK: - UIBezierPath
    private func circlePath(progress: Float) -> UIBezierPath {
        let size = bounds.width - (lineWidth*2)
        let origin = size/2 + lineWidth
        let start_angle = CGFloat(2*Float.pi*0-Float.pi/2)
        let end_angle = CGFloat(2*Float.pi*progress-Float.pi/2)
        return UIBezierPath(arcCenter: CGPoint(x: origin, y: origin), radius: size/2, startAngle: start_angle, endAngle: end_angle, clockwise: true)

    }

    // MARK: - Set progress

    /// Set progress.
    ///
    /// - Parameters:
    ///   - progress: progress to set in percentage. (max is 100)
    ///   - animated: pass true to show progress change animation.
    ///   - animationDuration: duration for animation.
    ///   - completion: called after animation completion.
    public func setProgress(progress: Float, animated: Bool, animationDuration: CFTimeInterval, completion: AnimationCompleted?) {
        // Asign the animation completion block
        animationBlock = completion
        if animated {
            // Configure animation
            let drawAnimation = CABasicAnimation(keyPath: "strokeEnd")
            drawAnimation.duration              = animationDuration // Animation duration
            drawAnimation.repeatCount           = 0.0               // Animate only once..
            drawAnimation.isRemovedOnCompletion = false             // Remain stroked after the animation..

            // Animate from no part of the stroke being drawn to the entire stroke being drawn
            drawAnimation.fromValue = 0.0
            drawAnimation.toValue   = 1.0

            // Experiment with timing to get the appearence to look the way you want
            drawAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
            drawAnimation.delegate = self

            // Add the animation to the circle
            progressLayer.add(drawAnimation, forKey: DrawCircleAnimation)

            // Set progress
            self.progress = progress
        } else {
            self.progress = progress
        }
    }


    /// Set progress.
    ///
    /// - Parameters:
    ///   - progress: progress to set in percentage. (max is 100)
    ///   - animated: pass true to show progress change in animation.
    ///   - completion: called after animation is completed.
    func setProgress(progress: Float, animated: Bool, completion: AnimationCompleted?) {
        setProgress(progress: progress, animated: animated, animationDuration: 0.5, completion: completion)
    }

    // MARK: - CAAnimationDelegate
    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        // Remove animation
        progressLayer.removeAnimation(forKey: DrawCircleAnimation)
        // Call the animation completion block
        if nil != animationBlock {
            animationBlock!(true)
        }
    }

}
