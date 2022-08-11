// Created on 11/08/2022
// Copyright © 2022 Rizwan

import UIKit
import SDWebImage
import MobileCoreServices
import UniformTypeIdentifiers

class CareerPageViewController: UIViewController {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var occupationLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var linkedinUrl: UILabel!
    @IBOutlet weak var resumeUrl: UILabel!
    @IBOutlet weak var dateAppliedLabel: UILabel!
    @IBOutlet weak var uploadResumeButton: UIButton!
    
    @IBOutlet weak var collectionMainView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var application: CareerApplication?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionMainView.layer.masksToBounds = true
        collectionMainView.layer.borderWidth = 1
        collectionMainView.layer.borderColor = UIColor.black.cgColor
        collectionMainView.layer.cornerRadius = 8
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Skills", style: .plain, target: self, action: #selector(addTapped))
        
        let viewModel = CareerPageFactory().getCareerPageViewModel(view: self)
        viewModel.loadData()
    }

    @IBAction func uploadResumeTapped(_ sender: Any) {
        let types = UTType.types(tag: "pdf",
                                    tagClass: UTTagClass.filenameExtension,
                                    conformingTo: nil)
           let documentPickerController = UIDocumentPickerViewController(
                   forOpeningContentTypes: types)
           documentPickerController.delegate = self
           self.present(documentPickerController, animated: true, completion: nil)
    }
    
    @objc
    func addTapped() {
        let storyBoard = UIStoryboard(name: "CareerPage", bundle: nil)
        if let viewController = storyBoard.instantiateViewController(withIdentifier: "add-skills") as? AddSkillsViewController {
            viewController.careerViewDelegate = self
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func loadDataToView(application: CareerApplication) {
        userImageView.sd_setImage(with: URL(string: application.imageUrl), completed: nil)
        
        nameLabel.text = "\(application.firstName) \(application.lastName)"
        occupationLabel.text = application.occupation
        statusLabel.text = "Status: \(application.status)"
        scoreLabel.text = "Score: \(application.score)"
        
        collectionView.reloadData()
    }
}

extension CareerPageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 128, height: 128)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let application = self.application {
            return application.skills.count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "careerPageCell", for: indexPath) as? CareerPageCell else {
            return UICollectionViewCell()
        }
        
        cell.layer.masksToBounds = true
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.cornerRadius = 8
        
        cell.configure(skill: application?.skills[indexPath.row] ?? "")
        return cell
    }
}

extension CareerPageViewController: CareerPageViewModelToViewContract {
    func loadDataSuccess(application: CareerApplication) {
        self.application = application
        loadDataToView(application: application)
    }
    
    func loadDataFailure() {
        
    }
    
    
}

extension CareerPageViewController: UIDocumentPickerDelegate {
    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let myURL = urls.first else {
            return
        }
        print("import result : \(myURL)")
    }
          

    public func documentMenu(_ documentMenu: UIDocumentPickerViewController, didPickDocumentPicker documentPicker: UIDocumentPickerViewController) {
        documentPicker.delegate = self
        present(documentPicker, animated: true, completion: nil)
    }


    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print("view was cancelled")
        dismiss(animated: true, completion: nil)
    }
}

extension CareerPageViewController: AddSkillsToCareerPageContract {
    func skillSelected(skill: String) {
        application?.skills.append(skill)
        collectionView.reloadData()
    }
}