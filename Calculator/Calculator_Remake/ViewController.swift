//
//  ViewController.swift
//  Calculator_Remake
//
//  Created by Nguyen Huu An Nhien on 9/26/20.
//  Copyright © 2020 Nguyen Huu An Nhien. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Cách đặt tên biến tường minh, đúng chuẩn
    // UI đẹp, có khiếu design đây
    
    // Vẫn có biến đặt = chữ hoa đầu tiên .... Input
    
    var firstNum = "0"
    var secondNum = ""
    var function = "" //de luu dang xai phep tinh nao
    var Input = ""  //luu so hang nhap vao
    var result:Double = 0.0
    var clickTimes_decimal:Int = 0
    var clickTimes_plus:Int = 0 //bien dem so lan
    
    @IBOutlet weak var calculatorDisplay: UILabel! // label thì nên đặt tên là lblDisplay...
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorDisplay.text = "0"
        // Do any additional setup after loading the view.
    }

    // Biến nên gom về đầu tiên.... ko phải vừa code hàm vừa code biến... đưa nó lên trên hàm viewDidLoad
    
    @IBOutlet weak var display: UILabel!
    
    //lam tron so
    
    // Hàm là thưc hiện 1 chức năng nên nó phải là đông từ, ko phải danh từ
    // nên đặt nó là clearBtnClicked...
    @IBAction func btnClear(_ sender: Any)
    {
        firstNum = ""
        secondNum = ""
        Input = ""
        function = ""
        calculatorDisplay.text="0"
        result = 0
        clickTimes_decimal = 0
        clickTimes_plus = 0
        
    }
    
    @IBAction func btnDivide(_ sender: Any)
    {
        if clickTimes_plus < 1
        {
        function = "/"
        firstNum = Input
        Input = ""
        clickTimes_plus += 1
        }
        else if clickTimes_plus >= 1
        {
            function = "/"
            firstNum = String(result)
            Input = ""
        }
        
        
    }
    
    @IBAction func btnMultiple(_ sender: Any)
    {
       if clickTimes_plus < 1
       {
        function = "*"
        firstNum = Input
        Input = ""
        clickTimes_plus += 1
        }
        else if clickTimes_plus >= 1
       {
        function = "*"
        firstNum = String(result)
        Input = ""
        }
        
    }
    @IBAction func btnMinus(_ sender: Any)
    {
       if clickTimes_plus < 1
       {
        function = "-"
        firstNum = Input
        Input = ""
        clickTimes_plus += 1
        }
        else if clickTimes_plus >= 1
       {
        function = "-"
        firstNum = String(result)
        Input = ""
        }
        
    }
    // Thụt vào thụt ra ko gọn gàng...chỗ if vs else.

    //chú ý bên swift thì dấu mở ngoặc { bắt đầu ở cuối dòng...ko phải xuống dòng mới viết dấu mở ngoặc....
//    @IBAction func btnPlus(_ sender: Any) {
//
//    }
    @IBAction func btnPlus(_ sender: Any){
        if clickTimes_plus < 1{
            function = "+"
            firstNum = Input
            Input = ""
            clickTimes_plus += 1
        }else if clickTimes_plus >= 1 {
            function = "+"
            firstNum = String(result)
            Input = ""
        }
//       if clickTimes_plus < 1
//        {
//        function = "+"
//        firstNum = Input
//        Input = ""
//        clickTimes_plus += 1
//        }
//        else if clickTimes_plus >= 1
//       {
//        function = "+"
//        firstNum = String(result)
//        Input = ""
//
//        }
    }
    @IBAction func btnEqual(_ sender: Any)
    {
        secondNum=Input
        let first = Double(firstNum)!
        let second = Double(secondNum)!
        if function == "+"
        {
            result = first + second
            
            if result == Double(Int(result))
            {
                let Rounded = String(format:"%.0f",result)
                calculatorDisplay.text = Rounded
            }
            else{
            calculatorDisplay.text = String(result)
            }
           
        }
        else if function == "-"
        {
            result = first - second
            if result == Double(Int(result))
            {
                let Rounded = String(format:"%.0f",result)
                calculatorDisplay.text = Rounded
            }
            else{
            calculatorDisplay.text = String(result)
            }
        }
        
        else if function == "*"
        {
            result = first * second
            if result == Double(Int(result))
            {
                let Rounded = String(format:"%.0f",result)
                calculatorDisplay.text = Rounded
            }
            else{
                calculatorDisplay.text = String(result)
            }
        }
        else if function == "/"
        {
            result = first / second
            if result == Double(Int(result))
            {
                let Rounded = String(format:"%.0f",result)
                calculatorDisplay.text = Rounded
            }
            else{
            calculatorDisplay.text = String(format:"%.2f",result)
            
            }
        }
        
    }
    @IBAction func btnDecimal(_ sender: Any)
    {
        if clickTimes_decimal == 0
        {
        Input += "."
            calculatorDisplay.text! += "."
            clickTimes_decimal += 1
        }
        else
        {
            clickTimes_decimal += 1
        }
    }
    
    @IBAction func btn0(_ sender: Any)
    {
        calculatorDisplay.text=""
        Input += "0"
        calculatorDisplay.text! += Input
    }
    
    @IBAction func btn1(_ sender: Any)
    {
        calculatorDisplay.text=""
        Input += "1"
        calculatorDisplay.text! += Input
    }
    
    @IBAction func btn2(_ sender: Any)
    {
        calculatorDisplay.text=""
        Input += "2"
        calculatorDisplay.text! += Input
    }
    
    @IBAction func btn3(_ sender: Any)
    {
        calculatorDisplay.text=""
        Input += "3"
        calculatorDisplay.text! += Input
    }
    
    @IBAction func btn4(_ sender: Any)
    {
        calculatorDisplay.text=""
        Input += "4"
        calculatorDisplay.text! += Input
    }
    @IBAction func btn5(_ sender: Any)
    {
        calculatorDisplay.text=""
        Input += "5"
        calculatorDisplay.text! += Input
    }
    @IBAction func btn6(_ sender: Any)
    {
        calculatorDisplay.text=""
        Input += "6"
        calculatorDisplay.text! += Input
    }
    @IBAction func btn7(_ sender: Any)
    {
        calculatorDisplay.text=""
        Input += "7"
        calculatorDisplay.text! += Input
    }
    @IBAction func btn8(_ sender: Any)
    {
        calculatorDisplay.text=""
        Input += "8"
        calculatorDisplay.text! += Input
    }
    @IBAction func btn9(_ sender: Any)
    {
        calculatorDisplay.text=""
        Input += "9"
        calculatorDisplay.text! += Input
    }
    
}

