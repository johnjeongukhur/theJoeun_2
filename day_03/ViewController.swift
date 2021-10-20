//
//  ViewController.swift
//  day_03
//
//  Created by John Hur on 2021/10/13.
//

// 1. 실행할 함수 정의
// 2. 시간의 흐름을 설정 정의 -> 1.에서 정의한 함수 지정
// 3. 프로그램 시작과 함께ㅔ 2번 객체 호출


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var currentLB: UILabel!
    @IBOutlet var selectLB: UILabel!
    
    var i = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: ts, userInfo: nil, repeats: true)

        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    // 1.번 실행할 obj 함수 정의
    @objc func asdf() {
        i += 1
        currentLB.text = "asdf 실행이여 \(i)"
    }
    // 2.시간의 흐름을 설정 정의 -> 1에서 정의한 함수 지정
    let ts = #selector(asdf)
    
    
    
    
    @IBAction func changeDP(_ sender: UIDatePicker) {
        
        
        print("\(sender.date)")
        let fmt = DateFormatter()
        fmt.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        print("\(sender.date)")
        print(fmt.string(from: sender.date))
        
//        selectLB.text = "선택시간 : \(sender.date)"
        
        selectLB.text = "선택시간 : " + fmt.string(from: sender.date)
        
        
    }
    
}

