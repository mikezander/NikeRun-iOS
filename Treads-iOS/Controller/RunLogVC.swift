//
//  RunLogVC.swift
//  Treads-iOS
//
//  Created by Michael Alexander on 12/12/17.
//  Copyright © 2017 Michael Alexander. All rights reserved.
//

import UIKit

class RunLogVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension RunLogVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Run.getAllRuns()?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "RunLogCell") as? RunLogCell {
            guard let run = Run.getAllRuns()?[indexPath.row] else {
                return RunLogCell()
            }
            cell.configureCell(run: run)
            return cell
        } else {
            return RunLogCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
}

