//
//  ViewController.swift
//  UserAppMVVMBindings
//
//  Created by Mine Rala on 9.09.2022.
//

import UIKit

// Obserable

class Observable<T> {
    var value: T? {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }

    private var listener: ((T?) -> Void)?
    
    private  func bind(_ listener: @escaping (T?) -> Void) {
        listener(value)
        self.listener = listener
    }
}

// Model

struct User: Decodable {
    let name: String
}

// ViewModels

struct UserListViewModel {
    var users: Observable<[UserTableViewCellViewModel]> = Observable([])
}

struct UserTableViewCellViewModel  {
    let name: String
}

// Controller

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
    
    private func fetchData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
    }
}

