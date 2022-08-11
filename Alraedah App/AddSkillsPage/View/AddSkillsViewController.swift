// Created on 11/08/2022
// Copyright © 2022 Rizwan

import UIKit

class AddSkillsViewController: UIViewController {

    var viewModel: AddSkillsViewModel?
    var careerViewDelegate: AddSkillsToCareerPageContract?
    
    var isFiltered: Bool = false
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(filterTapped))
        
        viewModel = AddSkillsViewModel()
    }
    
    @objc
    func filterTapped() {
        let storyBoard = UIStoryboard(name: "CareerPage", bundle: nil)
        if let viewController = storyBoard.instantiateViewController(withIdentifier: "filterView") as? FilterPageViewController {
            viewController.addSkillsDelegate = self
            viewController.isSkillSelected = self.isFiltered
            navigationController?.present(viewController, animated: true, completion: nil)
        }
    }
    
    func showAddSkillDialog() {
        let alert = UIAlertController(title: "Add Skill", message: "Mention the skill you want to add", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: {(textField: UITextField!) in
            textField.placeholder = "Enter skill:"
        })
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            if let textField = alert.textFields?[0] {
                if (textField.text?.count ?? 0) > 0 {
                    self.careerViewDelegate?.skillSelected(skill: textField.text ?? "")
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel , handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}

extension AddSkillsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getSkillsArray(isFiltered: isFiltered).count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "skillCell") as? AddSkillsCell else {
            return UITableViewCell()
        }
        
        cell.configure(skill: viewModel?.getSkillsArray(isFiltered: isFiltered)[indexPath.row] ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if (indexPath.row + 1) == viewModel?.getSkillsArray(isFiltered: isFiltered).count {
            showAddSkillDialog()
        } else {
            careerViewDelegate?.skillSelected(skill: viewModel?.getSkillsArray(isFiltered: isFiltered)[indexPath.row] ?? "")
            self.navigationController?.popViewController(animated: true)
        }
    }
}

extension AddSkillsViewController: FilterToAddSkillsPageContract {
    func filterApplyTapped(valueSelected: Bool) {
        isFiltered = valueSelected
        tableView.reloadData()
    }
}
