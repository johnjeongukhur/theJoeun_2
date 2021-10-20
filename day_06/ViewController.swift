//
//  ViewController.swift
//  day_06
//
//  Created by John Hur on 2021/10/20.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var urlTextfield: UITextField!
    @IBOutlet weak var myWeb: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        strToWeb("https://m.naver.com/")
        
    }
    
    func strToWeb(_ addr: String) {
        // 주소를 string 형태로 입력 받음
        let url = URL(string: addr)!
        
        let req = URLRequest(url: url)
        
        
        myWeb.load(req)
        
        urlTextfield.text = addr

    }

    @IBAction func urlGo(_ sender: UIButton) {
        strToWeb(urlTextfield.text!)
    }
    
    @IBAction func naverGo(_ sender: UIButton) {
        strToWeb("https://m.naver.com")
    }
    
    @IBAction func googleGo(_ sender: UIButton) {
        strToWeb("https://google.com")

    }
    
    @IBAction func stringGo(_ sender: UIButton) {
//        https://github.com/johnjeongukhur
        
        let ttt = "<html><head><meta charset='UTF-8'>" +
                "</head><body><h1>와 문자열이다</h1>" +
                    "<p>문서 내용 입니다 <br> 우헬헬헬</p>" +
                    "<a href='https://cafe.naver.com/jx007s'>강사까페로 이동 </a>" +
                "</body></html>"
        
        myWeb.loadHTMLString(ttt, baseURL: nil)
        urlTextfield.text = "문자열"

        
    }
    
    @IBAction func fileGo(_ sender: UIButton) {
        
        let fPath = Bundle.main.path(forResource: "aaa", ofType: "html")!
        let url = URL(fileURLWithPath: fPath)
        
        let req = URLRequest(url: url)
        
        
        myWeb.load(req)
        
        urlTextfield.text = "파일"

    }
    
    //MARK: - 아래의 Toolbar
    @IBAction func stopGo(_ sender: UIBarButtonItem) {
        myWeb.stopLoading()
    }
    
    @IBAction func regreshGo(_ sender: UIBarButtonItem) {
        myWeb.reload()
    }
    
    @IBAction func backGo(_ sender: UIBarButtonItem) {
        myWeb.goBack()
        urlTextfield.text = "\(myWeb.url!)"
    }
    
    @IBAction func nextGo(_ sender: UIBarButtonItem) {
        myWeb.goForward()
        urlTextfield.text = "\(myWeb.url!)"
    }
    
}

