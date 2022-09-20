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
    
    private var tempColorNum: Int64? = 1
    private let coreDataManager = CoreDataManager.shared
    private var memoData: MemoDataModel? {
        didSet {
            tempColorNum = memoData?.backgroundColor
        }
    }
	
	// MARK: LifeCycle
	override func viewDidLoad() {
        super.viewDidLoad()
		configBackgroundView()
		configTextView()
        configSaveBtn()
    }
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		btns.forEach { btns in
			btns.clipsToBounds = true
			btns.layer.cornerRadius = btns.bounds.height / 2
		}
	}
	
	// MARK: Methods
	@IBAction func saveBtnTapped(_ sender: UIButton) {
        if let memoData = self.memoData {
            memoData.memoText = self.memoTextView.text
            memoData.backgroundColor = self.tempColorNum ?? 1
            coreDataManager.updateMemoData(newData: memoData) {
                dump("DEBUG : Update Completed")
                self.navigationController?.popViewController(animated: true)
            }
        } else {
            let memoText = self.memoTextView.text
            coreDataManager.saveMemoData(memoText: memoText, colorInt: tempColorNum ?? 1) {
                dump("DEBUG : Save Compelted")
                self.navigationController?.popViewController(animated: true)
            }
        }
	}
	
	private func configBackgroundView() {
		backgroundColorView.clipsToBounds = true
		backgroundColorView.layer.cornerRadius = 8
	}
	
	private func configTextView() {
        if let memoData = self.memoData {
            self.title = "Updating Memo"
            memoTextView.becomeFirstResponder()
            
            guard let memo = memoData.memoText else { return }
            memoTextView.text = memo
            memoTextView.textColor = .black
            saveBtn.setTitle("Update", for: .normal)
            
        } else {
            self.title = "New Memo"
            memoTextView.becomeFirstResponder()
            memoTextView.text = "메모할 내용이 뭐였더라.."
            memoTextView.textColor = .systemGray4            
        }
	}
    
    private func configSaveBtn() {
        saveBtn.setTitle("Save", for: .normal)
        saveBtn.clipsToBounds = true
        saveBtn.layer.cornerRadius = 8
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
