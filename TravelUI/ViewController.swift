//
//  ViewController.swift
//  TravelUI
//
//  Created by Фараби Иса on 09.05.2023.
//

import UIKit

class ViewController: UIViewController {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Путешествуйте\nПочувствуйте прилив энергии"
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let titleLabel2: UILabel = {
        let label = UILabel()
        label.text = "Мы поможем вам исследовать, сравнить и \nзабронировать впечатления - все в одном \nместе."
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let searchTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: "Куда хотите поехать?",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.link]
        )
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        let magnifyingGlassImageView = UIImageView(image: UIImage(systemName: "magnifyingglass"))
            magnifyingGlassImageView.tintColor = .tintColor
            textField.rightView = magnifyingGlassImageView
            textField.rightViewMode = .always
        return textField
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    let cityImages: [UIImage] = [UIImage(named: "abudhabi")!, UIImage(named: "sanantonio")!, UIImage(named: "abudhabi")!]
    let cityNames: [String] = ["ABU DHABI", "SAN ANTONIO", "ABU DHABI"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupViews()
        setupConstraints()
        configureCollectionView()
    }
    
    func setupViews() {
        view.addSubview(titleLabel)
        view.addSubview(titleLabel2)
        view.addSubview(searchTextField)
        view.addSubview(collectionView)
    }
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CityCell.self, forCellWithReuseIdentifier: "CityCell")
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            
            titleLabel2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel2.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            
            searchTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchTextField.topAnchor.constraint(equalTo: titleLabel2.bottomAnchor, constant: 10),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 10),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cityImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CityCell", for: indexPath) as? CityCell else {
            return UICollectionViewCell()
        }
        
        let cityName = cityNames[indexPath.item]
        let cityImage = cityImages[indexPath.item]
        
        cell.configure(with: cityName, image: cityImage)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width - 20
        let height = 270.00
        return CGSize(width: width, height: height)
    }
}
