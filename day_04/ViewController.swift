//
//  ViewController.swift
//  day_04
//
//  Created by John Hur on 2021/10/15.
//

// 왼쪽 피커뷰는 레이블만 바뀜
// 오른쪽 피커뷰는 이미지만 바뀜

import UIKit

class ViewController: UIViewController {
    
    let imgs = ["1.png", "favicon.ico", "Me1.PNG", "Me2.PNG", "Me3.PNG", "Me4.PNG", "Me5.PNG", "Me6.PNG", "Me7.PNG"]
    
    let imgs2 = [ UIImage(named: "1.png"), UIImage(named: "favicon.ico"), UIImage(named: "Me1.PNG"), UIImage(named: "Me2.PNG"), UIImage(named: "Me3.PNG"), UIImage(named: "Me4.PNG"),UIImage(named: "Me5.PNG"), UIImage(named: "Me6.PNG"), UIImage(named: "Me7.PNG")]
    
    @IBOutlet var selectLB: UILabel!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

//MARK: - Delegate Protocol 구현
// 이벤트 정의 프로토콜, 행동을 구현하는 프로토콜
extension ViewController: UIPickerViewDelegate {
    // 항목 설정 -> 문자열 반환
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return imgs[row]
//    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let res = UIImageView(image: imgs2[row])
        res.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        
        return res
    }
    
    // 열의 높이를 반환해서 픽해줌
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 80
    }
    
    
    // 선택된 열, 항목 선택했을때의 이벤트
    // 1. 미션 왼쪽 피커뷰는 텍스트 바뀜, 오른쪽 피커뷰는 이미지 변경
    // 해결방법 : 내부 값 component의 Int값과 조건문을 사용하여 문제 해결
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        print("항목 선택 \(row)")
        if component == 0 {
            selectLB.text = "선택 : \(imgs[row])"
        } else {
            imgView.image = UIImage(named: imgs[row])
        }
//        component == 0 ? selectLB.text = "선택 : \(imgs[row])" : imgView.image = UIImage(named: imgs[row])
        
//        selectLB.text = "선택 : \(imgs[row])"
//        imgView.image = UIImage(named: imgs[row])
    }
}

//MARK: - DataSource Protocol 구현
extension ViewController: UIPickerViewDataSource {
    
    // 피커뷰의 열
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    // 피커뷰의 행
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imgs.count
    }
}


