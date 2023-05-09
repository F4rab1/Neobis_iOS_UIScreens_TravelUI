//
//  CityCell.swift
//  TravelUI
//
//  Created by Фараби Иса on 09.05.2023.
//

import UIKit

class CityCell: UICollectionViewCell {
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let cityImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let cityNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let redLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    func setupViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(cityImageView)
        containerView.addSubview(cityNameLabel)
        containerView.addSubview(redLineView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            cityImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            cityImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            cityImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            cityImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            cityNameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            cityNameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            cityNameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            
            redLineView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            redLineView.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 0),
            redLineView.heightAnchor.constraint(equalToConstant: 2),
            redLineView.widthAnchor.constraint(equalToConstant: 140),
        ])
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
        
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var frame = layoutAttributes.frame
        frame.size.height = ceil(size.height)
        layoutAttributes.frame = frame
        
        return layoutAttributes
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.layer.cornerRadius = 10
        containerView.layer.cornerRadius = 10
    }
    
    func configure(with cityName: String, image: UIImage) {
        cityNameLabel.text = cityName
        cityImageView.image = image
    }
}
