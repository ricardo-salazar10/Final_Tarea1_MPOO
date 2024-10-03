//
//  ViewController.swift
//  mpoo_06
//
//  Created by:
//  - Salazar Olivares Ricardo
//  - Yonatan Martín Galicia Serrano
//  on 11/09/24.

import UIKit

class UsersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var students:[Student] = [
        Student(name: "Pedro", image: "uno"),
        Student(name: "Diana", image: "dos"),
        Student(name: "Luis", image: "tres")
    ]
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let user = students[indexPath.row]
        cell.textLabel?.text = user.name
        cell.imageView?.image = UIImage(named: user.image)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userDetailVC = UserDetaillViewController()
        userDetailVC.user = students[indexPath.row]
        navigationController?.pushViewController(userDetailVC, animated: true)
    }
    
}

class UserDetaillViewController: UIViewController {
    var user: Student?
    
    let imageView = UIImageView()
    let nameLabel = UILabel()
    
    override func viewDidLoad() {
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .green
        
        imageView.image = UIImage(named: user?.image ?? "")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 150
        imageView.layer.borderWidth = 5
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.clipsToBounds = true
        
        view.addSubview(imageView)
        view.addSubview(nameLabel)
        
        nameLabel.text = user?.name
        nameLabel.textAlignment = .center
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            imageView.widthAnchor.constraint(equalToConstant: 300),
            imageView.heightAnchor.constraint(equalToConstant: 300),
            
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
