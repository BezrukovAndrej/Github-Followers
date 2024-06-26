//
//  GFAlertVC.swift
//  GithubFollowers
//
//  Created by Andrey Bezrukov on 29.04.2024.
//

import UIKit

final class GFAlertVC: UIViewController {
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 16
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.white.cgColor
        return view
    }()
    
    private let messageLabel: GFBodyLabel = {
        let label = GFBodyLabel(textAlignment: .center)
        label.numberOfLines = 4
        return label
    }()
    
    private lazy var actionButton: GFButton = {
        let button = GFButton(backgroundColor: .systemPink,
                              title: Constants.ButtonName.actionButtonOk)
        button.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        return button
    }()
    
    private let titleLabel =  GFTitleLabel(textAlignment: .center, size: 20)
    
    private var alertTitle: String?
    private var message: String?
    private var buttonTitle: String?
    private let padding: CGFloat = 20
    
    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = title
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        addSubviews()
        setConstraints()
        configure()
    }
    
    private func configure() {
        titleLabel.text = alertTitle ?? Constants.AlertText.wrongMessage
        actionButton.setTitle(buttonTitle ?? Constants.ButtonName.actionButtonOk, for: .normal)
        messageLabel.text = message ??  Constants.AlertText.unableMessage
    }
    
    @objc
    private func dismissVC() {
        dismiss(animated: true)
    }
}

// MARK: - Add subviews / Set constraints

extension GFAlertVC {
    
    private func addSubviews() {
        view.addViewWithNoTAMIC(containerView)
        [titleLabel,actionButton,
         actionButton,messageLabel].forEach { containerView.addViewWithNoTAMIC($0) }
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 220),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 28),
            
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44),
            
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12)
        ])
    }
}
