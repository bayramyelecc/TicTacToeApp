//
//  ViewController.swift
//  TicTacToeApp
//
//  Created by Bayram Yeleç on 20.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    enum Siradaki {
        case iks
        case sifir
    }
    
    var ikss = "X"
    var sifirr = "O"
    
    var firstGamer = Siradaki.iks
    var currentGamer = Siradaki.iks
    
    var butonlar = [UIButton]()
    
    @IBOutlet weak var siradakiText: UILabel!
    
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        ilkAcilinca()
    }
    
    private func ilkAcilinca() {
        butonlar.append(a1)
        butonlar.append(a2)
        butonlar.append(a3)
        butonlar.append(b1)
        butonlar.append(b2)
        butonlar.append(b3)
        butonlar.append(c1)
        butonlar.append(c2)
        butonlar.append(c3)
        siradakiText.text = ikss
    }
    
    @IBAction func butonTiklandi(_ sender: UIButton) {
        btnTikla(sender)
        
        if kazananGamer(ikss) {
            resultAlert(title: "X kazandı")
        } else if kazananGamer(sifirr) {
            resultAlert(title: "O kazandı")
        } else if tumButonlar() {
            resultAlert(title: "Beraberlik")
        }
    }
    
    func kazananGamer(_ smbl: String) -> Bool {
        return (btnSembol(a1, smbl) && btnSembol(a2, smbl) && btnSembol(a3, smbl)) ||
               (btnSembol(b1, smbl) && btnSembol(b2, smbl) && btnSembol(b3, smbl)) ||
               (btnSembol(c1, smbl) && btnSembol(c2, smbl) && btnSembol(c3, smbl)) ||
               (btnSembol(a1, smbl) && btnSembol(b1, smbl) && btnSembol(c1, smbl)) ||
               (btnSembol(a2, smbl) && btnSembol(b2, smbl) && btnSembol(c2, smbl)) ||
               (btnSembol(a3, smbl) && btnSembol(b3, smbl) && btnSembol(c3, smbl)) ||
               (btnSembol(a1, smbl) && btnSembol(b2, smbl) && btnSembol(c3, smbl)) ||
               (btnSembol(a3, smbl) && btnSembol(b2, smbl) && btnSembol(c1, smbl))
    }
    
    func btnSembol(_ button: UIButton, _ sembol: String) -> Bool {
        return button.title(for: .normal) == sembol
    }
    
    func resultAlert(title: String) {
        let ac = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Tamam", style: .default, handler: { _ in
            self.resetButton()
        }))
        self.present(ac, animated: true)
    }
    
    func resetButton() {
        for button in butonlar {
            button.setTitle("", for: .normal)
            button.isEnabled = true
        }
        
        firstGamer = Siradaki.iks
        currentGamer = firstGamer
        siradakiText.text = ikss
    }
    
    private func tumButonlar() -> Bool {
        for button in butonlar {
            if button.title(for: .normal) == nil || button.title(for: .normal) == "" {
                return false
            }
        }
        return true
    }
    
    private func btnTikla(_ sender: UIButton) {
        if sender.title(for: .normal) == nil || sender.title(for: .normal) == "" {
            if currentGamer == Siradaki.sifir {
                sender.setTitle(sifirr, for: .normal)
                currentGamer = Siradaki.iks
                siradakiText.text = ikss
            } else {
                sender.setTitle(ikss, for: .normal)
                currentGamer = Siradaki.sifir
                siradakiText.text = sifirr
            }
        }
    }
}
