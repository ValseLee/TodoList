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
	
	public var updateBtnTapped: (TodoCell) -> Void = { (sender) in }
    public var memoData: MemoDataModel? {
        didSet {
            configMemoData()
        }
    }
	
	// MARK: LifeCycle
	override func awakeFromNib() {
		super.awakeFromNib()
		configUI()
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
	}
	
	// MARK: Methods
	private func configUI() {
		backgroundColorView.clipsToBounds = true
		backgroundColorView.layer.cornerRadius = 8
		
		updateBtn.clipsToBounds = true
		updateBtn.layer.cornerRadius = 8
	}
    
    private func configMemoData() {
        memoTextLabel.text = memoData?.memoText
        dataTextLabel.text = memoData?.dateString
        guard let colorNum = memoData?.backgroundColor else { return }
        let color = BackgroundColor(rawValue: colorNum)
        updateBtn.backgroundColor = color?.getBtnColor
        backgroundColorView.backgroundColor = color?.getBackgroundColor
    }
	
	@IBAction func updateBtnTapped(_ sender: UIButton) {
		updateBtnTapped(self)
	}
	
}
