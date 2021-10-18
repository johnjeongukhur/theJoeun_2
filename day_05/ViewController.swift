//
//  ViewController.swift
//  day_05
//
//  Created by John Hur on 2021/10/18.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var myImg: UIImageView!
    
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    let imgRemove = UIImage(named: "remove.png")
    
    // 전구 상태를 나타내는 변수, 전구가 꺼져있음
    var isLampOn = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 배경색을 리터럴로 지정
        self.view.backgroundColor = #colorLiteral(red: 0.1054889588, green: 0.104215208, blue: 0.1073579114, alpha: 1)
        // Do any additional setup after loading the view.
    }

    @IBAction func turnOn(_ sender: UIButton) {
        
        if isLampOn {
            
            // 경고창 선언 및 생성
            let alert = UIAlertController(title: "불이 이미 켜졌습니다.", message: "불이 켜진 상태", preferredStyle: .alert)
            
            // 경고창에 들어갈 액션(버튼) 선언 및 생성
            let ac = UIAlertAction(title: "ㅇㅋ", style: .cancel, handler: nil)
            
            // 경고창에 액션 추가
            alert.addAction(ac)
            
            present(alert, animated: true, completion: nil)
            
        } else {
            myImg.image = imgOn
            isLampOn = true
        }
        
    }
    
    func asdf(_ aa: UIAlertAction) { // goOff-> offA일 때 실행시킬 함수
        
        myImg.image = imgOff
        print("전구를 꺼요")
        
    }
    
    @IBAction func turnOff(_ sender: UIButton) {
        
        if isLampOn {
            
            let alert = UIAlertController(title: "전구 끄기", message: "정말로 전구를 끄시겠습니까?", preferredStyle: .alert)
            
            let cancelA = UIAlertAction(title: "아니오", style: .default, handler: nil)
            let offA = UIAlertAction(title: "네", style: .default, handler: asdf) // handler -> 이 버튼을 눌렀을 때 실행할 함수 지정
            
            alert.addAction(offA)
            alert.addAction(cancelA)
            
            present(alert, animated: true, completion: nil)
        } else {
            myImg.image = imgOff
            isLampOn = false
        }
        
    }
    
    @IBAction func remove(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "전구 제거", message: "전구를 제거하시겠습니까?", preferredStyle: .alert)
        
        let onA = UIAlertAction(title: "아니오, 켭니다.", style: .default) { xx in
            print("전구통 켜려구요?")
            self.myImg.image = self.imgOff
            self.isLampOn = true
        }
        
        let offA = UIAlertAction(title: "그냥 끄겠습니다", style: .default, handler: asdf) // handler -> 이 버튼을 눌렀을 때 실행할 함수 지정
        
        let removeA = UIAlertAction(title: "네, 제거합니다.", style: .destructive) { xx in
            self.myImg.image = self.imgRemove
            self.isLampOn = false
        }
        
        alert.addAction(onA)
        alert.addAction(offA)
        alert.addAction(removeA)
        
        present(alert, animated: true, completion: nil)
        
//        if isLamp
        
        
    }
    
}

extension ViewController: CAAnimationDelegate {
    
    
    
}
