import UIKit

final class ChooseScheet: UIView {
    
    //MARK: Private property
    
    private let textOfDuration: String
    private let textOfCost: String
    private let textOfDescription: String
    private let backgroundColorView: UIColor
    private let checkMarkIsHiden: Bool
    
    //MARK: Elements UI
    
   private lazy var checkMark: UIImageView = {
        let checkMark = UIImageView()
        checkMark.image = UIImage(named: "checkMark.png")
        checkMark.translatesAutoresizingMaskIntoConstraints = false
        return checkMark
    }()
    
    private lazy var durationOfSubscriptionLabel: UILabel = {
        let label = UILabel()
        label.text = textOfDuration
        label.font = UIFont(name: "SFProDisplay-Bold", size: 20)
        label.textColor = UIColor(hexString: "#000000")
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var costOfSubscriptionLabel: UILabel = {
        let label = UILabel()
        label.text = textOfCost
        label.font = UIFont(name: "SFProDisplay-Heavy", size: 24)
        label.textColor = UIColor(hexString: "#000000")
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionOfSubscriptionLabel: UILabel = {
        let label = UILabel()
        label.text = textOfDescription
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.textColor = UIColor(hexString: "#6D7885")
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: Init
    
    required init(textOfDuration: String,
                  textOfCost: String,
                  textOfDescription: String,
                  backgroundColorView: UIColor,
                  checkMarkIsHiden: Bool)
    {
        
        self.textOfDuration = textOfDuration
        self.textOfCost = textOfCost
        self.textOfDescription = textOfDescription
        self.backgroundColorView = backgroundColorView
        self.checkMarkIsHiden = checkMarkIsHiden
        
        super.init(frame: .zero)
        
        self.backgroundColor = backgroundColorView
        
        setupView()
        setupUI()
        
        if !checkMarkIsHiden {
            descriptionOfSubscriptionLabel.textColor = UIColor(hexString: "#000000")
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: UI
    private func setupView() {
        self.layer.cornerRadius = 10
    }
    
    private func setupUI() {
        
        self.addSubview(durationOfSubscriptionLabel)
        
        if !checkMarkIsHiden {
            
            self.addSubview(checkMark)
            
            NSLayoutConstraint.activate([
                checkMark.topAnchor.constraint(equalTo: self.topAnchor, constant: 19),
                checkMark.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
                checkMark.heightAnchor.constraint(equalToConstant: 16),
                checkMark.widthAnchor.constraint(equalToConstant: 20)
            ])
            
            NSLayoutConstraint.activate([
                durationOfSubscriptionLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
                durationOfSubscriptionLabel.leadingAnchor.constraint(equalTo: checkMark.trailingAnchor, constant: 12),
                durationOfSubscriptionLabel.heightAnchor.constraint(equalToConstant: 22)
            ])
            
        } else {
            
            NSLayoutConstraint.activate([
                durationOfSubscriptionLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
                durationOfSubscriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
                durationOfSubscriptionLabel.heightAnchor.constraint(equalToConstant: 22)
            ])
        }
        
        self.addSubview(costOfSubscriptionLabel)
        
        NSLayoutConstraint.activate([
            costOfSubscriptionLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            costOfSubscriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
        
        self.addSubview(descriptionOfSubscriptionLabel)
        
        NSLayoutConstraint.activate([
            descriptionOfSubscriptionLabel.topAnchor.constraint(equalTo: durationOfSubscriptionLabel.bottomAnchor, constant: 16),
            descriptionOfSubscriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            descriptionOfSubscriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            descriptionOfSubscriptionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -13)
        ])
    }
}

