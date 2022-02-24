//
//  ViewController.swift
//  CryptoCrazy
//
//  Created by Macbook on 22.02.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    private var cryptoListViewModal : CryptoListViewModal!
    
    var colorArray = [UIColor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.colorArray = [
            UIColor(red: 76/255, green: 55/255, blue: 54/255, alpha: 1.0),
            UIColor(red: 15/255, green: 15/255, blue: 76/255, alpha: 1.0),
            UIColor(red: 56/255, green: 77/255, blue: 87/255, alpha: 1.0),
            UIColor(red: 78/255, green: 45/255, blue: 87/255, alpha: 1.0),
            UIColor(red: 33/255, green: 67/255, blue: 98/255, alpha: 1.0),
            UIColor(red: 89/255, green: 89/255, blue: 43/255, alpha: 1.0)
        ]
        
        getData()
        
    }
    
    func getData() {
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        
        WebService().downloadCurrencies(url: url) { (cryptos) in
            if let cryptos = cryptos {
                self.cryptoListViewModal = CryptoListViewModal(cryptoCurrencyList: cryptos)
            
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModal == nil ? 0 : self.cryptoListViewModal.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoTableViewCell
        let cryptoViewModal = cryptoListViewModal.cryptoAtIndex(indexPath.row)
        cell.currencyText.text = cryptoViewModal.name
        cell.priceText.text = cryptoViewModal.price
        cell.backgroundColor = self.colorArray[indexPath.row % 6]
        return cell
    }
    

}

