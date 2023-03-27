//
//  ViewController.swift
//  Expensiv Tracker
//
//  Created by Fabrizio Chiariello on 3/24/23.
//
// UI DESING

import UIKit

class HomeVC: UIViewController {
    
    // MARK: HeaderView
    private let headerView              = UIView()
    private let Statechanger            = UIView()
    private let messageLabel    = AlertTitleLabel(textAlignment: .center, fontSize: 20)
    
    // MARK: - HeaderView Item's
    
    private let welcomeLabel    = CustomLabel(textAlignment: .left, fontSize: 20, textWeight: .ultraLight, text: " Welcome")
    private let fullnameLabel           = CustomLabel(textAlignment: .left, fontSize: 18, textWeight: .regular)
    
    
    
    // MARK: - Card View
    private let balanceInfo             = CardView(frame: .zero)
    
    // MARK: - Transection Label & Table View Label
    private let transectionsLabel       = CustomLabel(textAlignment: .left, fontSize: 24, textWeight: .medium, text: "Transactions")
    
    // MARK: - Card View Balance
    private let totalBalanceLabel       = CustomLabel(textAlignment: .center, fontSize: 20, textWeight: .semibold, text: "Total Balance")
    
    private let balanceNumber           = CustomLabel(textAlignment: .center, fontSize: 66, textWeight: .bold)
    
    // MARK: - Card View Income and expenses image and labels
    
    
   
    
//    private let incomelbl   = CustomLabel(textAlignment: .left, fontSize: 13, textWeight: .light, text: "Income")
    private let expenseslbl   = CustomLabel(textAlignment: .left, fontSize: 13, textWeight: .light, text: "Expenses")
    private let lastIncome  = CustomLabel(textAlignment: .left, fontSize: CGFloat(DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 14 : 20))
    private let lastExpense = CustomLabel(textAlignment: .left, fontSize: CGFloat(DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 14 : 18))
    
    private let tableView = CustomTableView(indicator: false, separtorStyle: .singleLine, TransectionTableViewCell.self, forCellReuseIdentifier: TransectionTableViewCell.identifier)
    private let viewMoreButton = UIButton(type: .system)
    
    
    // MARK: - Transection data
    var transaction = [Transaction]()
    
    var profileData: UserBalanceIncomeExpense?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configHomeVC()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
    }
    
    func configHomeVC() {
        view.backgroundColor = .systemBackground
        navigationController?.setNavigationBarHidden(true, animated: true)
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubViews(headerView, balanceInfo, transectionsLabel, viewMoreButton, tableView, Statechanger)
        
        ConfigureHeaderView()
        ConfigureHeaderElements()
        configTransectionLabel()
        configStateView()
    
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        ConfigureHeaderElements()
    }
    
    private func ConfigureHeaderView() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.layer.cornerRadius = 5
        headerView.layer.shouldRasterize = true
        headerView.layer.rasterizationScale = UIScreen.main.scale
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            headerView.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    @objc func didTapSetting() {
        guard let profileData = profileData else {
            return
        }
        let profileVC = UINavigationController(rootViewController: ProfileVC(eStatement: transaction, userImage: profileData.user.avatar, fullname: profileData.user.name))
        profileVC.modalPresentationStyle = .popover
        profileVC.modalTransitionStyle   = .coverVertical
        present(profileVC, animated: true, completion: nil)
    }
    
    private func configData(_ data: UserBalanceIncomeExpense){
        fullnameLabel.text = data.user.name
        
        balanceNumber.text = "$\(data.balance.formatNumber())"
        lastIncome.attributedText         = makeFormattedBalance(dollar: String(data.income.formatNumber()))
        lastExpense.attributedText        = makeFormattedBalance(dollar: String(data.expense.formatNumber()))
    }
    
    private func ConfigureHeaderElements() {
        headerView.addSubViews( welcomeLabel, fullnameLabel)
        
      
        
        
        balanceInfo.addSubViews(totalBalanceLabel, balanceNumber,
//                                incomelbl,
                                lastIncome, expenseslbl, lastExpense)
        
        lastIncome.textColor    = .white
//        incomelbl.textColor     = .white
        
        
        expenseslbl.textColor   = .white
        lastExpense.textColor   = .white
        
        balanceInfo.layer.shouldRasterize = true
        balanceInfo.layer.rasterizationScale = UIScreen.main.scale
        
        totalBalanceLabel.textColor = .white
        balanceNumber.textColor     = .white
        
        NSLayoutConstraint.activate([
           
            
            
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            welcomeLabel.heightAnchor.constraint(equalToConstant: 22),
            
            
            fullnameLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20),
            fullnameLabel.heightAnchor.constraint(equalToConstant: 26),
            
            
           
            
            balanceInfo.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
            balanceInfo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            balanceInfo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            balanceInfo.heightAnchor.constraint(equalToConstant: 230),
            
            totalBalanceLabel.topAnchor.constraint(equalTo: balanceInfo.topAnchor, constant: 30),
            totalBalanceLabel.trailingAnchor.constraint(equalTo: balanceInfo.trailingAnchor),
            totalBalanceLabel.leadingAnchor.constraint(equalTo: balanceInfo.leadingAnchor),
            totalBalanceLabel.heightAnchor.constraint(equalToConstant: 24),
            
            balanceNumber.topAnchor.constraint(equalTo: totalBalanceLabel.bottomAnchor, constant: 10),
            balanceNumber.trailingAnchor.constraint(equalTo: balanceInfo.trailingAnchor),
            balanceNumber.leadingAnchor.constraint(equalTo: balanceInfo.leadingAnchor),
            balanceNumber.heightAnchor.constraint(equalToConstant: 75),
            
           
        ])
        
    }
    
    
    private func configTransectionLabel() {
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "arrow.right.circle")
        config.imagePlacement = .trailing
        config.title = "More "
        viewMoreButton.configuration = config
        viewMoreButton.translatesAutoresizingMaskIntoConstraints = false
        viewMoreButton.addAction(UIAction(handler: { [unowned self] _ in
            let transactionVC = UINavigationController(rootViewController: AllTransaction(Transactions: self.transaction))
            transactionVC.modalPresentationStyle = .popover
            transactionVC.modalTransitionStyle   = .coverVertical
            self.present(transactionVC, animated: true, completion: nil)
        }), for: .touchUpInside)
        NSLayoutConstraint.activate([
            transectionsLabel.topAnchor.constraint(equalTo: balanceInfo.bottomAnchor, constant: 30),
            transectionsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            transectionsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            transectionsLabel.heightAnchor.constraint(equalToConstant: 26),
            
            viewMoreButton.topAnchor.constraint(equalTo: balanceInfo.bottomAnchor, constant: 30),
            viewMoreButton.centerYAnchor.constraint(equalTo: transectionsLabel.centerYAnchor),
            viewMoreButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            viewMoreButton.heightAnchor.constraint(equalTo: transectionsLabel.heightAnchor)
        ])
    }
    
    
    private func configTableView() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: Statechanger.topAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: Statechanger.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: Statechanger.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: Statechanger.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func configStateView() {
        Statechanger.addSubview(messageLabel)
        Statechanger.addSubview(tableView)
        Statechanger.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            Statechanger.topAnchor.constraint(equalTo: transectionsLabel.bottomAnchor, constant: 10),
            Statechanger.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            Statechanger.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            Statechanger.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    func layoutLable(_ msg: String) {
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.text = msg
        messageLabel.numberOfLines  = 3
        messageLabel.textColor      = .secondaryLabel
        
        NSLayoutConstraint.activate([
            messageLabel.centerYAnchor.constraint(equalTo: Statechanger.centerYAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: Statechanger.leadingAnchor, constant: 40),
            messageLabel.trailingAnchor.constraint(equalTo: Statechanger.trailingAnchor, constant: -40),
        ])
    }
    
}


extension HomeVC: BalanceFormatter, UITableViewDataSource, UITableViewDelegate {
    
    func makeFormattedBalance(dollar: String) -> NSMutableAttributedString {
        let dollarSignAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .callout), .baselineOffset: 8]
        let dollarAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .title1)]
        
        let rootString = NSMutableAttributedString(string: "$", attributes: dollarSignAttributes)
        let dollarString = NSAttributedString(string: dollar, attributes: dollarAttributes)
        
        
        rootString.append(dollarString)
        
        return rootString
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TransectionTableViewCell.identifier, for: indexPath) as! TransectionTableViewCell
        cell.selectionStyle = .none
        cell.display(transaction[indexPath.row])
        return cell
    }
    
}

