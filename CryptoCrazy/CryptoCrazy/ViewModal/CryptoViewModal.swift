//
//  CryptoViewModal.swift
//  CryptoCrazy
//
//  Created by Macbook on 22.02.2022.
//

import Foundation

struct CryptoListViewModal {
    let cryptoCurrencyList : [CryptoCurrency]
    
    func numberOfRowsInSection() -> Int {
        return self.cryptoCurrencyList.count
    }
    func cryptoAtIndex (_ index : Int) -> CryptoViewModal {
        let crypto = self.cryptoCurrencyList[index]
        return CryptoViewModal(cryptoCurrency: crypto)
    }
}

struct CryptoViewModal {
    let cryptoCurrency : CryptoCurrency
    
    var name : String {
        return self.cryptoCurrency.currency
    }
    var price : String {
        return self.cryptoCurrency.price
    }
}
