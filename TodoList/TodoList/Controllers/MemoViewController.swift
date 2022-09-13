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
		configUI()
    }
	
	// MARK: Methods
	@IBAction func saveBtnTapped(_ sender: UIButton) {
	}
	
	private func configUI() {
		backgroundColorView.clipsToBounds = true
		backgroundColorView.layer.cornerRadius = 8
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		view.endEditing(true)
	}
}

extension MemoViewController: UITextViewDelegate {
	func textViewDidBeginEditing(_ textView: UITextView) {
		if textView.text == "텍스트를 여기에 입력하세요." {
			textView.text = nil
			textView.textColor = .black
		}
	}
	
	func textViewDidEndEditing(_ textView: UITextView) {
		if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
			textView.text = "텍스트를 여기에 입력하세요."
			textView.textColor = .lightGray
		}
	}
}
