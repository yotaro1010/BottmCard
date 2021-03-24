//
//  ViewController.swift
//  buttomCard
//
//  Created by Yotaro Ito on 2020/12/02.
//

// 1

import BLTNBoard
import UIKit
class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate {
    @IBOutlet var tableView: UITableView!
    let textField = UITextField(frame: CGRect(x: 10, y: 10, width: 300, height: 30))
    
    
    var data:[String] = [
    "I am Batman","Bane","Joker","Gordon","Fox", "Alfred"
    ]
    var filteredData = [String]()
    var filtered = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = textField
//        //プレースホルダを設定
       textField.placeholder = "ここに記入"
//        // キーボードタイプを指定
//        textField.keyboardType = .default
//        // 枠線のスタイルを設定
//        textField.borderStyle = .roundedRect
//        // 改行ボタンの種類を設定記入して
//        textField.returnKeyType = .done
//        // テキストを全消去するボタンを表示
//        textField.clearButtonMode = .always
        // UITextFieldを追加
        view.addSubview(textField)
        tableView.dataSource = self
        tableView.delegate = self
        textField.delegate = self
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let text = textField.text {
            filterText(text+string)
        }
        
        return true
    }
    
//    2
    func filterText(_ query: String){
        filteredData.removeAll()
        for string in data {
            if string.lowercased().starts(with: query.lowercased()){
                filteredData.append(string)
            }
        }
        tableView.reloadData()
        filtered = true
    }

//    1 データを呼び出す関数を書く
//    func setUpData(){
//        data.append("Batman")
//        data.append("Bane")
//        data.append("Gim Gordon")
//        data.append("Alfred")
//        data.append("CatWoman")
//        data.append("Joker")
//        data.append("Two Face")
//        data.append("ScareClaw")
//        data.append("Mafia")
//        data.append("R's")
//
//
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !filteredData.isEmpty{
            return filteredData.count
        }
        return filtered ? 0:data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if !filteredData.isEmpty {
            cell.textLabel?.text = filteredData[indexPath.row]
        } else {
            cell.textLabel?.text = data[indexPath.row]
        }
        return cell
    }
    

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if data[indexPath.row] == "I am Batman"{
            card1.showBulletin(above: self)
        }
    }
  
    private lazy var card1: BLTNItemManager = {
        let item = BLTNPageItem(title: "")
//    ここでボタンや画像をカスタマイズできる
        item.image = UIImage(named: "imBatman")
        item.actionButtonTitle = "Play the Voice"
       item.descriptionText = "\"I'm Batman\" -Batman-"
        item.actionHandler = { _ in
           
        }
        item.appearance.actionButtonColor = .black
        item.appearance.actionButtonTitleColor = .white
        return BLTNItemManager(rootItem: item)
    }()
    private lazy var card2: BLTNItemManager = {
        let item = BLTNPageItem(title: "")
//    ここでボタンや画像をカスタマイズできる
        item.image = UIImage(named: "")
        item.actionButtonTitle = "play"
//        item.descriptionText = "HAHAHA"
        item.actionHandler = { _ in
            
        }
        return BLTNItemManager(rootItem: item)
    }()

}
