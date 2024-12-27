//
//  ViewController.swift
//  Sidebar
//
//  Created by macmini on 12/27/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var titleName = ["profile","Settings","Payment"]
    var images = ["a","t","a"]
    var viewOpen:Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        registerTableCells()
        self.containerView.isHidden = true
        viewOpen = false
        tableView.backgroundColor = .gray
    }
    func registerTableCells(){
        tableView.register(UINib(nibName: "TitleTableViewCell", bundle: nil), forCellReuseIdentifier: "TitleTableViewCell")
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        containerView.isHidden = false
        tableView.isHidden = false
        if !viewOpen {
            viewOpen = true
            containerView.frame = CGRect(x: 0, y: 88, width: 0, height: 808)
            tableView.frame = CGRect(x: 0, y: 88, width: 0, height: 808)
        }
        else {
            containerView.isHidden = true
            tableView.isHidden = true
            viewOpen = false
            containerView.frame = CGRect(x: 0, y: 88, width: 0, height: 808)
            tableView.frame = CGRect(x: 0, y: 88, width: 0, height: 808)
        }
    }
    
}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleName.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitleTableViewCell")as! TitleTableViewCell
        cell.titleLabel.text = titleName[indexPath.row]
        cell.imageIcon.image = UIImage(named: images[indexPath.row])
        cell.backgroundColor = .gray
        return cell
    }
}

