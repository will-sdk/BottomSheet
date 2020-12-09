//
//  ViewController.swift
//  WillBottomSheet
//
//  Created by willshërë on 12/09/2020.
//  Copyright (c) 2020 willshërë. All rights reserved.
//

import UIKit
import WillBottomSheet

class ViewController: UIViewController {

    private var delegateManager = DelegateManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func viewDidSelect(_ sender: Any) {
        let controller = BottomsheetController()
        let contentView = UIView()
        let button = UIButton()
        button.frame.size = CGSize(width: 100, height: 40)
        button.center = contentView.center
        button.backgroundColor = .blue
        button.setTitle("close", for: .normal)
        button.addTarget(controller, action: #selector(BottomsheetController.dismiss(_:)), for: .touchUpInside)
        contentView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        contentView.addConstraints([NSLayoutConstraint(item: button, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 100),
                                    NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 40),
                                    NSLayoutConstraint(item: button, attribute: .centerX, relatedBy: .equal, toItem: contentView, attribute: .centerX, multiplier: 1, constant: 0),
                                    NSLayoutConstraint(item: button, attribute: .centerY, relatedBy: .equal, toItem: contentView, attribute: .centerY, multiplier: 1, constant: 0)])
        controller.viewActionType = .tappedPresent
        controller.overlayBackgroundColor = UIColor.black.withAlphaComponent(0.6)
        controller.addContentsView(contentView)
        DispatchQueue.main.async {
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func tableDidSelect(_ sender: Any) {
        let controller = BottomsheetController()
        controller.addNavigationbar { navigationBar in
            let item = UINavigationItem(title: "title")
            let rightButton = UIBarButtonItem(title: "dismiss", style: .plain, target: controller, action: #selector(BottomsheetController.dismiss(_:)))
            item.rightBarButtonItem = rightButton
            let leftButton = UIBarButtonItem(title: "present", style: .plain, target: controller, action: #selector(BottomsheetController.present(_:)))
            item.leftBarButtonItem = leftButton
            navigationBar.items = [item]
        }
        controller.addTableView { [weak self] tableView in
            tableView.delegate = self?.delegateManager
            tableView.dataSource = self?.delegateManager
            tableView.rowHeight = 100
            tableView.estimatedRowHeight = 100
            tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.cellIdentifier)
            tableView.contentInset.top = 64
            tableView.scrollIndicatorInsets.top = 64
        }
        controller.viewActionType = .tappedDismiss
        controller.overlayBackgroundColor = UIColor.black.withAlphaComponent(0.6)
        controller.initializeHeight = 200
        DispatchQueue.main.async {
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func collectionDidSelect(_ sender: Any) {
        let controller = BottomsheetController()
        controller.addNavigationbar { navigationBar in
            let item = UINavigationItem(title: "title")
            let rightButton = UIBarButtonItem(title: "dismiss", style: .plain, target: controller, action: #selector(BottomsheetController.dismiss(_:)))
            item.rightBarButtonItem = rightButton
            let leftButton = UIBarButtonItem(title: "present", style: .plain, target: controller, action: #selector(BottomsheetController.present(_:)))
            item.leftBarButtonItem = leftButton
            navigationBar.items = [item]
        }
        controller.addCollectionView { [weak self] collectionView in
            collectionView.delegate = self?.delegateManager
            collectionView.dataSource = self?.delegateManager
            collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.cellIdentifier)
            collectionView.backgroundColor = .white
            collectionView.contentInset.top = 64
            collectionView.scrollIndicatorInsets.top = 64
            let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
            let width = (UIScreen.main.bounds.width - 30) / 2
            layout?.itemSize = CGSize(width: width, height: width)
            layout?.minimumLineSpacing = 10
            layout?.minimumInteritemSpacing = 10
            layout?.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        }
        controller.viewActionType = .tappedDismiss
        controller.overlayBackgroundColor = UIColor.black.withAlphaComponent(0.6)
        controller.initializeHeight = UIScreen.main.bounds.height / 2
        DispatchQueue.main.async {
            self.present(controller, animated: true, completion: nil)
        }
    }
}


