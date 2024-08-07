//
//
// HomeViewController.swift
// AstanaWeatherApp
//
// Created by sturdytea on 03.08.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import UIKit

class HomeViewController: UIViewController {

    private let homeView = HomeView()
    private let viewModel = HomeViewModel()

    override func loadView() {
        view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        loadWeatherData()
    }

    private func setupCollectionView() {
        homeView.collectionView.delegate = self
        homeView.collectionView.dataSource = self
        homeView.collectionView.register(WeekdayWeatherCollectionViewCell.self, forCellWithReuseIdentifier: WeekdayWeatherCollectionViewCell().identifier)
    }

    private func loadWeatherData() {
        Task(priority: .high) {
            await viewModel.fetchWeatherRecords()
            print("The fetched data: \(viewModel.weekWeatherRecords)")
            DispatchQueue.main.async {
                self.homeView.collectionView.reloadData()
            }
        }
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.weekWeatherRecords.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeekdayWeatherCollectionViewCell().identifier, for: indexPath) as? WeekdayWeatherCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let weatherRecord = viewModel.weekWeatherRecords[indexPath.row]
        let day = indexPath.row == 0 ? "Today" : "\(weatherRecord.weekDay)"
        
        cell.configureCell(day, tempText: weatherRecord.tempInt, mainText: weatherRecord.weather[0].main, iconName: weatherRecord.weather[0].icon)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind, withReuseIdentifier: "HeaderSupplementaryView", for: indexPath)
            as! HeaderSupplementaryView
            header.configureHeader(name: "Forcats for 7 days")
            return header
        default:
            return UICollectionReusableView()
        }
    }
}
