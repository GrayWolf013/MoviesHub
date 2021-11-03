//
//  BaseViewController.swift
//  MoviesHub
//
//  Created by Ahmed Besbes on 2/11/2021.
//

import UIKit
import Combine

class BaseViewController: UIViewController {

    lazy var banner: OfflineBannerView? = .fromNib()
    var isConnected: Bool = false
    private var connectivitySubscriber: AnyCancellable?

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "MoviesHub"
        setUpConnectivitySubscribers()
    }

    // MARK: Offline banner

    func setUpConnectivitySubscribers() {
        setUpOfflineView()
        connectivitySubscriber = ConnectivityMananger
            .shared()
            .$isConnected
            .sink(receiveValue: { [weak self] (isConnected) in
            self?.isConnected = isConnected
            self?.updateBanner()
        })
    }

    func setUpOfflineView() {
        guard let banner = banner else {return}
        banner.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(banner)

        NSLayoutConstraint.activate([
            banner.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            banner.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            banner.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            banner.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    func updateBanner() {
        banner?.isHidden = isConnected ? true : false
    }
}
