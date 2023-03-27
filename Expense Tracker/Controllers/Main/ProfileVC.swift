//
//  ProfileVC.swift
//  Expensiv Tracker
//
//  Created by Fabrizio Chiariello on 3/24/23.
//
// UI DESING

import UIKit

// MARK: - Sections
private struct Sections {
    let options: [SettingOpetions]
}

private struct SettingOpetions {
    let icon: UIImage?
    let title: String
    let handler: () -> Void?

}

class ProfileVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    enum logoutOptions: CaseIterable {
        case logout
        case cancel
    }

    private var models: [Sections] = []
    
    // MARK: - TableView
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()
    
    var eTrasactions: [Transaction] = []
    var userImage: String = ""
    var fullname: String = ""
    
    init(eStatement: [Transaction], userImage: String, fullname: String) {
        super.init(nibName: nil, bundle: nil)
        self.eTrasactions = eStatement
        self.fullname = fullname
        self.userImage = userImage
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configProfileVC()
        configTableView()
        setupTableHeaderView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        setupTableHeaderView()
    }
    
    private func configProfileVC() {
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        title = "Profile"
    }
    
    private func setupTableHeaderView() {
        let header = ProfileHeaderView(user: fullname, image: userImage)
        var size = header.systemLayoutSizeFitting(UIView.layoutFittingExpandedSize)
        size.width = UIScreen.main.bounds.width
        header.frame.size = size
        tableView.tableHeaderView = header
    }
    
    private func configTableView() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = model.title
        content.image = model.icon
        content.imageProperties.tintColor = .systemBlue
        cell.contentConfiguration = content
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = models[indexPath.section].options[indexPath.row]
        model.handler()
    }

}

