//
//  ViewController.swift
//  TableViewSort
//
//  Created by 梁雅軒 on 2017/2/22.
//  Copyright © 2017年 zoaks. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var arrData = [MyInfo]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "MyCell")
        let arrName = ["閃電俠","蝙蝠俠","小狗","小貓","小雞"]
        for name in arrName {
            let info = MyInfo()
            info.name = name
            info.age = Int(arc4random() % 30)
            arrData.append(info)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyCell
        let info = arrData[indexPath.row]
        cell.lblMessage.text = "姓名:\(info.name) 年齡:\(info.age)"
        return cell
    }
    
    @IBAction func btnOnClick(_ sender: UIButton) {
        if sender.tag == 0 {
            arrData.sort(by: { (info1, info2) -> Bool in
                return info1.age > info2.age
            })
            sender.tag = 1
        }else{
            arrData.sort(by: { (info1, info2) -> Bool in
                return info1.age < info2.age
            })
            sender.tag = 0
        }
        tableView.reloadData()
    }

}

class MyInfo: NSObject {
    var name:String!
    var age:Int!
}
