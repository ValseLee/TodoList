# TodoList
---

## 개괄

---

- **아키텍쳐 패턴 : `MVC`**
- **UI : `Storyboard` + `Programmatically`**
- **Date : 22.09.08. ~ (지속 업데이트 중)**
- **Frameworks : `none`**

## 소개

---

내가 원하는 메모를 원하는 배경 색의 메모에 작성할 수 있는 `Memo App` 입니다.

메모를 작성하고, 수정하고, 삭제하여 하루를 더 알차게 보내보아요!

## features

---

1. `MVC` 아키텍쳐 패턴
    - `Model` : 코어데이터 모델 싱글톤으로 전체 CRUD 기능
    - `View`,`Controller` : 클로저를 활용한 객체 간 소통 구현
        
        ```swift
        // View
        final class TodoCell: UITableViewCell {
        	@IBOutlet weak var updateBtn: UIButton!
        	
        	public var updateBtnTapped: (TodoCell) -> Void = { (sender) in }
        	
        	@IBAction func updateBtnTapped(_ sender: UIButton) {
        		updateBtnTapped(self)
        	}
        	
        }
        
        // Controller
        final class ViewController: UIViewController, UITableViewDataSource {
        		@IBOutlet weak var tableView: UITableView!
        		
        		override func viewDidLoad() {
        				super.viewDidLoad()
        				configTableView()
        				configNavBar()
        		}
        
        		private func configTableView() {
        				tableView.dataSource = self
        				tableView.delegate = self
        				tableView.separatorStyle = .none
        		}
        
        		func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        				let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodoCell
        				cell.updateBtnTapped = { [weak self] sender in
        					self?.performSegue(withIdentifier: "TO_MEMO", sender: indexPath)
        				}
        		}
        }
        ```
        

1. `CoreData` 를 활용한 유저 정보 관리
