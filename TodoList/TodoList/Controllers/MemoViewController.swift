//
//  MemoViewController.swift
//  TodoList
//
//  Created by 이승준 on 2022/09/10.
//

import UIKit

final class MemoViewController: UIViewController {
	@IBOutlet weak var redBtn: UIButton!
	@IBOutlet weak var greenBtn: UIButton!
	@IBOutlet weak var blueBtn: UIButton!
	@IBOutlet weak var purpleBtn: UIButton!
	
	lazy var btns: [UIButton] = {
		return [redBtn, greenBtn, blueBtn, purpleBtn]
	}()
	
	@IBOutlet weak var backgroundColorView: UIView!
	@IBOutlet weak var memoTextView: UITextView!
	
	@IBOutlet weak var saveBtn: UIButton!
	
	// MARK: LifeCycle
	override func viewDidLoad() {
        super.viewDidLoad()

    }
	
	// MARK: Methods
	@IBAction func saveBtnTapped(_ sender: UIButton) {
	}
	
}
