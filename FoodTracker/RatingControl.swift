import UIKit

@IBDesignable
class RatingControl: UIStackView {
    
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setupButtons()
        }
    }

    @IBInspectable var startCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }
    
    var ratingButtons = [UIButton]()
    var rating = 0 {
        didSet {
            updateButtonsSelectionStates()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    // MARK: - Private methods
    private func setupButtons() {
        // Remove any existing buttons
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        // Load Button Images
        let bundle = Bundle(for: type(of: self))
        let emptyStar = UIImage(named: "ICC_emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let filledStar = UIImage(named: "ICC_filledStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "ICC_highlightedStar", in: bundle, compatibleWith: self.traitCollection)

        for _ in 0..<startCount {
            // Create Button
            let button = UIButton()
            button.backgroundColor = UIColor.red
        
            // Add constrains
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
        
            // Setup button action
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
            // Set the button image
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
        
            // Add the button to the stack
            addArrangedSubview(button)
            
            // Add the new button to the rating button array
            ratingButtons.append(button)
        }
        
        updateButtonsSelectionStates()
    }
    
    // MARK: - Button Action
    @objc func ratingButtonTapped(button: UIButton) {
        guard let index = ratingButtons.index(of: button) else {
            fatalError("")
        }
        
        let selectedRating = index + 1
        
        if selectedRating == rating {
            rating = 0
        } else {
            rating = selectedRating
        }
    }
    
    private func updateButtonsSelectionStates() {
        for (index, button) in ratingButtons.enumerated() {
            button.isSelected = index < rating
        }
    }
}
