//
//  AllTransactions.swift
//  Expensiv Tracker
//
//  Created by Fabrizio Chiariello on 3/24/23.
//

import UIKit

class AllTransaction: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let tableView = CustomTableView(indicator: false, separtorStyle: .singleLine, TransectionTableViewCell.self, forCellReuseIdentifier: TransectionTableViewCell.identifier)
    
    let transection: [Transections] = [
        .init(title: "Hayaat Market", description: "Waxaa soo Gatay 3 Shaati Anigoo iska maraayo taleex aa arkay suuqa xayaat. Waxaa soo Gatay 3 Shaati Anigoo iska maraayo taleex aa arkay suuqa xayaat", type: "Expense", ammount: 392.80),
        .init(title: "Gadasho Dhar", description: "Waxaan Maanta Soo ibsaday 2 Shaati 3 Surwaal iyo nigis", type: "Expense", ammount: 56.0),
        .init(title: "Mishaar", description: "waxaa Helay Mishaar Kasocda Company X", type: "Income", ammount: 6829.00),
    ]
    
    var transaction: [Transaction] = []
    
    init(Transactions tran: [Transaction]) {
        super.init(nibName: nil, bundle: nil)
        self.transaction = tran
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "ALL Transaction"
        configTableView()
    }
    
    private func configTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        transaction.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TransectionTableViewCell.identifier, for: indexPath) as! TransectionTableViewCell
        cell.selectionStyle = .none
        cell.display(transaction[indexPath.row])
        return cell
    }
}
