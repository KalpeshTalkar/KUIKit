// Copyright © 2017 Kalpesh Talkar. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
//  For support: https://gist.github.com/KalpeshTalkar/ce095588221c011f31c04c34d691584f
//

import UIKit

@IBDesignable
public class KButton: UIButton {
    
    // MARK: - IBInspectable properties
    /// Renders vertical gradient if true else horizontal
    @IBInspectable public var verticalGradient: Bool = true {
        didSet {
            updateUI()
        }
    }
    
    /// Start color of the gradient
    @IBInspectable public var startColor: UIColor = .clear {
        didSet {
            updateUI()
        }
    }
    
    /// End color of the gradient
    @IBInspectable public var endColor: UIColor = .clear {
        didSet {
            updateUI()
        }
    }
    
    /// Border color of the view
    @IBInspectable public var borderColor: UIColor? = nil {
        didSet {
            updateUI()
        }
    }
    
    /// Border width of the view
    @IBInspectable public var borderWidth: CGFloat = 0 {
        didSet {
            updateUI()
        }
    }
    
    /// Corner radius of the view
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            updateUI()
        }
    }
    
    // MARK: - Variables
    
    /// Closure is called on click event of the button
    public var onClick = { () }
    
    private var gradientlayer = CAGradientLayer()
    
    // MARK: - init methods
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupUI()
    }
    
    // MARK: - Layout
    override public func layoutSubviews() {
        super.layoutSubviews()
        updateFrame()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        gradientlayer = CAGradientLayer()
        updateUI()
        layer.addSublayer(gradientlayer)
    }
    
    // MARK: - Update frame
    private func updateFrame() {
        gradientlayer.frame = bounds
    }
    
    // MARK: - Update UI
    private func updateUI() {
        addTarget(self, action: #selector(clickAction(button:)), for: UIControlEvents.touchUpInside)
        gradientlayer.colors = [startColor.cgColor, endColor.cgColor]
        if verticalGradient {
            gradientlayer.startPoint = CGPoint(x: 0, y: 0)
            gradientlayer.endPoint = CGPoint(x: 0, y: 1)
        } else {
            gradientlayer.startPoint = CGPoint(x: 0, y: 0)
            gradientlayer.endPoint = CGPoint(x: 1, y: 0)
        }
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor?.cgColor ?? tintColor.cgColor
        if cornerRadius > 0 {
            layer.masksToBounds = true
        }
        updateFrame()
    }
    
    // MARK: - On Click
    @objc private func clickAction(button: UIButton) {
        onClick()
    }
    
}
