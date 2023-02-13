import UIKit

final class PayScreenView: UIView {
    
    //MARK: Elements UI
    private lazy var paidApplicationLabel: UILabel = {
        let label = UILabel()
        label.text = "Приложение платное"
        label.font = UIFont(name: "SFProDisplay-Black", size: 26)
        label.textColor = UIColor(hexString: "#000000")
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var chooseRateLabel: UILabel = {
        let label = UILabel()
        label.text = "Выберите удобный для вас способ оплаты"
        label.font = UIFont(name: "SFProDisplay-Regular", size: 18)
        label.textColor = UIColor(hexString: "#6D7885")
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var firstScheet = ChooseScheet(textOfDuration: "6 месяцев",
                                                textOfCost: "1990 руб.",
                                                textOfDescription: "Пробный период три дня, бесплатная отмена",
                                                backgroundColorView: UIColor(hexString: "#24D977"),
                                                checkMarkIsHiden: false)
    
    private lazy var secondScheet = ChooseScheet(textOfDuration: "1 месяц",
                                                 textOfCost: "499 руб.",
                                                 textOfDescription: "Ежемесячная подписка",
                                                 backgroundColorView: UIColor(hexString: "#ECF0F3"),
                                                 checkMarkIsHiden: true)
    
    private lazy var thirdScheet = ChooseScheet(textOfDuration: "Навсегда",
                                                textOfCost: "4990 руб.",
                                                textOfDescription: "Один платеж",
                                                backgroundColorView: UIColor(hexString: "#ECF0F3"),
                                                checkMarkIsHiden: true)
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16.0
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var buySubscriptionButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(hexString: "#000000")
        button.setTitle("Оформить подписку", for: .normal)
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(buy), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.isHidden = true
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = UIColor(hexString: "#FFFFFF")
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    private lazy var restorePurchaseButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("Восстановить покупки", for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
        button.setTitleColor(UIColor(hexString: "#99A2AD"), for: .normal)
        button.addTarget(self, action: #selector(clicked), for: .touchUpInside)
        button.addTarget(self, action: #selector(unClicked), for: .touchDown)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.backgroundColor = UIColor(hexString: "#FFFFFF")
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: UI
    
    private func setupUI() {
        self.addSubview(paidApplicationLabel)
        
        NSLayoutConstraint.activate([
            paidApplicationLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 76),
            paidApplicationLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 9),
            paidApplicationLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            paidApplicationLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/15)
        ])
        
        
        self.addSubview(chooseRateLabel)
        
        NSLayoutConstraint.activate([
            chooseRateLabel.topAnchor.constraint(equalTo: paidApplicationLabel.bottomAnchor, constant: 16),
            chooseRateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            chooseRateLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            chooseRateLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/10)
        ])
        
        stackView.addArrangedSubview(firstScheet)
        stackView.addArrangedSubview(secondScheet)
        stackView.addArrangedSubview(thirdScheet)
        
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: chooseRateLabel.bottomAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -17),
            stackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/2.5)
        ])
        
        self.addSubview(buySubscriptionButton)
        
        NSLayoutConstraint.activate([
            buySubscriptionButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 98),
            buySubscriptionButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            buySubscriptionButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            buySubscriptionButton.heightAnchor.constraint(equalTo:self.heightAnchor, multiplier: 1/17 )
        ])
        
        self.addSubview(restorePurchaseButton)
        
        NSLayoutConstraint.activate([
            restorePurchaseButton.topAnchor.constraint(equalTo: buySubscriptionButton.bottomAnchor, constant: 25),
            restorePurchaseButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 64),
            restorePurchaseButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -64)
        ])
        
        buySubscriptionButton.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: buySubscriptionButton.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: buySubscriptionButton.centerYAnchor)
        ])
        
    }
    
    @objc private func buy() {
        
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        buySubscriptionButton.setTitle("", for: .normal)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.activityIndicator.isHidden = true
            self.activityIndicator.stopAnimating()
            self.buySubscriptionButton.setTitle("Оформить подписку", for: .normal)
        }
    }
    
    @objc private func clicked() {
        restorePurchaseButton.setTitleColor(UIColor(hexString: "#99A2AD"), for: .normal)
    }
    
    @objc private func unClicked() {
        restorePurchaseButton.setTitleColor(UIColor(hexString: "#808080"), for: .normal)
    }
    
}
