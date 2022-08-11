// Created on 09/08/2022
// Copyright © 2022 Rizwan

import UIKit

class AdminPageViewController: UIViewController {
    
    struct Constants {
        static let rowheight: CGFloat = 218
        static let sleepSeconds: Int = 2
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: ViewToViewModelContract?
    var applications: [ApplicationModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Admin Page"
        
        do {
            try viewModel = AdminPanelFactory().createAdminPanelViewModel(view: self)
        } catch {
            print("Error occured")
        }
        
        viewModel?.loadData()
    }
    
    func showChangeStatusSheet(index: Int) {
        let alert = UIAlertController(title: "Change Status", message: "Please select status of the application", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Created", style: .default , handler:{ (UIAlertAction) in
            self.updateStatus(status: "Created", index: index)
        }))
        
        alert.addAction(UIAlertAction(title: "Completed", style: .default , handler:{ (UIAlertAction) in
            self.updateStatus(status: "Completed", index: index)
        }))
        
        alert.addAction(UIAlertAction(title: "Accepted", style: .default , handler:{ (UIAlertAction) in
            self.updateStatus(status: "Accepted", index: index)
        }))
        
        alert.addAction(UIAlertAction(title: "Rejected", style: .destructive , handler:{ (UIAlertAction) in
            self.updateStatus(status: "Rejected", index: index)
        }))
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler:{ (UIAlertAction) in
            
        }))
        
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
    
    func updateStatus(status: String, index: Int) {
        applications[index].status = status
        tableView.reloadData()
    }
    
    func showDeleteDialog(index: Int) {
        let deleteAlert = UIAlertController(title: "Delete?", message: "Are you sure?", preferredStyle: .alert)

        deleteAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            self.applications.remove(at: index)
            self.tableView.reloadData()
        }))

        deleteAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            
        }))

        present(deleteAlert, animated: true, completion: nil)
    }
    
    func openCareerPage() {
        let storyBoard = UIStoryboard(name: "CareerPage", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "career-page")
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension AdminPageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.rowheight
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastIndex = self.applications.count - 1
        if indexPath.row == lastIndex {
            // api call and get next page
            viewModel?.loadData()
        }
    }
}

extension AdminPageViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return applications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "adminCell") as? AdminCell else {
            return UITableViewCell()
        }
        
        let application = applications[indexPath.row]
        
        cell.delegate = self
        cell.configure(application: application, index: indexPath.row)
        
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let changeStatusAction = UIContextualAction(style: .normal, title: "Change Status") {
            (action, sourceView, completionHandler) in
            self.showChangeStatusSheet(index: indexPath.row)
        }
        changeStatusAction.backgroundColor = .link
        
        let editAction = UIContextualAction(style: .normal, title: "Edit") {
            (action, sourceView, completionHandler) in
            self.openCareerPage()
        }
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {
            (action, sourceView, completionHandler) in
            self.showDeleteDialog(index: indexPath.row)
        }
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, editAction, changeStatusAction])
        // Delete should not delete automatically
        swipeConfiguration.performsFirstActionWithFullSwipe = false
        
        return swipeConfiguration
    }
}

extension AdminPageViewController: AdminPanelCellToViewControllerProtocol {
    func updateStatusTapped(index: Int) {
        showChangeStatusSheet(index: index)
    }
    
    func deleteTapped(index: Int) {
        showDeleteDialog(index: index)
    }
    
    func editTapped(index: Int) {
        openCareerPage()
    }
}

extension AdminPageViewController: ViewModelToViewContract {
    func loadDataSuccess(items: [ApplicationModel]) {
        applications.append(contentsOf: items)
        tableView.reloadData()
    }
    
    func loadDataFailure() {
        
    }
    
    
}
