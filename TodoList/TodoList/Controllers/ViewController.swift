//
//  ViewController.swift
//  TodoList
//
//  Created by 이승준 on 2022/09/08.
//

import UIKit

final class ViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	
	// MARK: LifeCycle
	override func viewDidLoad() {
		super.viewDidLoad()
		configTableView()
		configNavBar()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		tableView.reloadData()
	}
	
	// MARK: Methods
	private func configTableView() {
		tableView.dataSource = self
		tableView.separatorStyle = .none
	}
	
	private func configNavBar() {
		self.title = "Memo"
		let plusBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusBtnTapped))
		plusBtn.tintColor = .systemBlue
		navigationItem.rightBarButtonItem = plusBtn
	}
	
	@objc func plusBtnTapped() {
		performSegue(withIdentifier: "TO_MEMO", sender: nil)
	}

}

extension ViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "TODO_CELL", for: indexPath)
		return cell
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
}

extension ViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		performSegue(withIdentifier: "TO_MEMO", sender: indexPath)
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return UITableView.automaticDimension
	}
}
