
//
// WeekdayWeatherCollectionViewCell.swift
// AstanaWeatherApp
//
// Created by sturdytea on 03.08.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import UIKit

class WeekdayWeatherCollectionViewCell: UICollectionViewCell {
    let identifier = "WeekdayWeatherCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 97/255, green: 81/255, blue: 195/255, alpha: 1)
        layer.cornerRadius = 30
        layer.masksToBounds = false
        setupViews()
        setConstraints()
    }
    
    lazy var weekDay: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 28)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var main: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var temp: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.numberOfLines = 1
        label.textAlignment = .right
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var icon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(_ weekDayName: String = "Today", tempText: Int, mainText: String, iconName: String) {
        weekDay.text = weekDayName
        main.text = mainText
        temp.text = "\(String(tempText))℃"
        icon.image = UIImage(named: iconName)
        
        switch iconName {
        case "04d":
            setImageColor(color: .gray)
        case "10d":
            setImageColor(color: .blue)
        case "01d":
            setImageColor(color: .yellow)
        default:
            setImageColor(color: .white)
        }
    }
    
    func setImageColor(color: UIColor) {
        let templateImage = icon.image?.withRenderingMode(.alwaysTemplate)
        icon.image = templateImage
        tintColor = color
    }
}

private extension WeekdayWeatherCollectionViewCell {
    func setupViews() {
        addSubview(weekDay)
        addSubview(main)
        addSubview(temp)
        addSubview(icon)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            weekDay.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            weekDay.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            main.leftAnchor.constraint(equalTo: weekDay.leftAnchor),
            main.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            temp.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            temp.bottomAnchor.constraint(equalTo: main.bottomAnchor),
            
            icon.widthAnchor.constraint(equalToConstant: 60),
            icon.heightAnchor.constraint(equalToConstant: 60),
            icon.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            icon.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
        ])
    }
}
