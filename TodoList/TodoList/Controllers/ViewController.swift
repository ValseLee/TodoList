//
//  ViewController.swift
//  TodoList
//
//  Created by 이승준 on 2022/09/08.
//

import UIKit

final class ViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
    let coreDataManager = CoreDataManager.shared
	
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
		tableView.delegate = self
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
		let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodoCell
        let memoData = coreDataManager.getMemoListFromCoreData()
        cell.memoData = memoData[indexPath.row]
        
		cell.updateBtnTapped = { [weak self] sender in
			self?.performSegue(withIdentifier: "TO_MEMO", sender: indexPath)
		}
		
		cell.selectionStyle = .none
		return cell
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coreDataManager.getMemoListFromCoreData().count
	}
	
}

extension ViewController: UITableViewDelegate {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TO_MEMO" {
            let memoViewController = segue.destination as! MemoViewController
            
            guard let indexPath = sender as? IndexPath else { return }
            memoViewController.memoData = coreDataManager.getMemoListFromCoreData()[indexPath.row]
        }
    }
    
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//		performSegue(withIdentifier: "TO_MEMO", sender: indexPath)
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return UITableView.automaticDimension
	}
}
