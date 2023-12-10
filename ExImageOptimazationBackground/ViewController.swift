//
//  ViewController.swift
//  ExImageOptimazationBackground
//
//  Created by 김종권 on 2023/12/10.
//

import UIKit

class ViewController: UIViewController {
    private let imageView: UIImageView = {
        let view = UIImageView()
//        view.image = UIImage(named: "img") /// <- 무작정 이미지를 대입시키지 않고 이미지가 보일때만 image를 사용하기
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
        
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
        ])
    }
    
    func bind() {
        NotificationCenter.default.addObserver(
            forName: UIApplication.willEnterForegroundNotification,
            object: nil,
            queue: .main
        ) { [weak self] (note) in
            print("foreground")
            self?.loadImage()
        }
        
        NotificationCenter.default.addObserver(
            forName: UIApplication.didEnterBackgroundNotification,
            object: nil,
            queue: .main
        ) { [weak self] (note) in
            print("background")
            self?.unloadImage()
        }
    }
    
    func loadImage() {
        imageView.image = UIImage(named: "high_resolution_img")
    }
    
    func unloadImage() {
        imageView.image = nil
    }
}
