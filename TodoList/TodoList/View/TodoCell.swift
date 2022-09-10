//
//  TodoCell.swift
//  TodoList
//
//  Created by 이승준 on 2022/09/10.
//

import UIKit

final class TodoCell: UITableViewCell {
	
	@IBOutlet weak var backgroundColorView: UIView!
	@IBOutlet weak var memoTextLabel: UILabel!
	
	@IBOutlet weak var dataTextLabel: UILabel!
	@IBOutlet weak var updateBtn: UIButton!
	
	// MARK: LifeCycle
	override func awakeFromNib() {
		super.awakeFromNib()
		configUI()
	}
	
	private func configUI() {
		backgroundColorView.clipsToBounds = true
		backgroundColorView.layer.cornerRadius = 8
		
		updateBtn.clipsToBounds = true
		updateBtn.layer.cornerRadius = 8
	}
	
	@IBAction func updateBtnTapped(_ sender: Any) {
		
	}
}
