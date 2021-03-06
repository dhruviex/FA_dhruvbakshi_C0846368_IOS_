//
//  ViewController.swift
//  FA_dhruvbakshi_C0846368_IOS_
//
//  Created by Dhruv Bakshi on 2022-05-30.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var activePlayer  = 1 //Cross
    var gameState = [0,0,0,0,0,0,0,0,0] //Initial Phase of Game
    //Default Values
    var win=0
    var tmp=0
    var x=0
    var y=0
    var endsender=0
    var noOfShake=0
    //Combinations For tic tac toe
    var winningCombinations =  [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var gameActive=true
    
    
   //Main Outlets
    
    
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var wonLabel: UILabel!
    @IBOutlet weak var playAgain: UIButton!
    
    @IBOutlet weak var scoreX: UILabel!
    @IBOutlet weak var scoreO: UILabel!
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    
    //Action Outlets
    @IBAction func actionBtn(_ sender: AnyObject)
    {
        if (gameState[sender.tag-1]==0 && gameActive==true)
        {
        endsender=sender.tag
        gameState[sender.tag-1]=activePlayer
            
           if (activePlayer == 1)
            {
               sender.setImage(UIImage(named:"cross.jpg" ), for: UIControl.State.normal)
               activePlayer = 2
               noOfShake=0
             }
           else
           {
               sender.setImage(UIImage(named: "zero.jpg"), for: UIControl.State.normal)
               activePlayer = 1
               noOfShake=0
            }
        }
        
     // Procedure for the Winning Combinations
      for w in winningCombinations {
             if gameState[w[0]] != 0 && gameState[w[0]] == gameState[w[1]] && gameState[w[1]] == gameState[w[2]]{
             gameActive=false
                 if gameState[w[0]] == 1
                 {
                     
                     wonLabel.text="Cross WON the game ????"
                    if tmp==0
                     {
                         x += 1
                         tmp+=1
                         win=1
                     }
                     scoreX.text=String(x)
                     savedata(sc: x, key: "x")
                     
                 }
                 else
                 {
                     wonLabel.text="Zero WON the game ????"
                     if tmp==0
                     {
                         y += 1
                         tmp+=1
                         win=1
                     }
                 
                    scoreO.text=String(y)
                     savedata(sc: y, key: "y")
                     
                 
                 }
                 playAgain.isHidden=false
                 wonLabel.isHidden=false

             }
         }
        //Draw Condition
        if gameState[0] != 0 && gameState[1] != 0 && gameState[2] != 0 && gameState[3] != 0 && gameState[4] != 0 && gameState[5] != 0 && gameState[6] != 0 && gameState[7] != 0 && gameState[8] != 0 && win == 0
        {
            wonLabel.text="Game Draw!!"
            gameActive=false
            playAgain.isHidden=false
            wonLabel.isHidden=false
        }
        
    }
//Action function to Play Again
    @IBAction func playAgain(_ sender: UIButton) {
        gameState=[0,0,0,0,0,0,0,0,0]
        gameActive=true
        activePlayer=1
        playAgain.isHidden=true
        wonLabel.isHidden=true
        tmp=0
        win=0
        noOfShake=0
        for i in 1...9
        {
            let button=view.viewWithTag(i) as! UIButton
            button.setImage(nil, for:.normal)
        }
        
}// PlayAgain UI Button Closing Brace

    //Function of View on Load
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        playAgain.isHidden=true
        wonLabel.isHidden=true
        scoreX.text = "0"
        scoreO.text = "0"
        win = 0
        noOfShake=0
        fetchdata(context)
        let RswipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(Swipe(_:)))
        RswipeGesture.direction = .right
        self.view.addGestureRecognizer(RswipeGesture)
        let LswipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(Swipe(_:)))
        LswipeGesture.direction = .left
        self.view.addGestureRecognizer(LswipeGesture)
        let UswipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(Swipe(_:)))
        UswipeGesture.direction = .up
        self.view.addGestureRecognizer(UswipeGesture)
        let DswipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(Swipe(_:)))
        DswipeGesture.direction = .down
        self.view.addGestureRecognizer(DswipeGesture)
        
        
        
    } // ViewDidLoad Closing Brace

    
// Swipes Gesture Function for the application
    @objc func Swipe(_ gesture:UISwipeGestureRecognizer){
        
        let swipeRGesture = gesture as UISwipeGestureRecognizer
        switch swipeRGesture.direction
        {
        case .right:
            x=0
            y=0
            win=0
            scoreO.text=String("0")
            scoreX.text=String("0")
            gameState=[0,0,0,0,0,0,0,0,0]
            gameActive=true
            activePlayer=1
            for i in 1...9
               {
                let button=view.viewWithTag(i) as! UIButton
                button.setImage(nil, for: .normal)
               }
       case .left:
            x=0
            y=0
            win=0
            scoreX.text=String("0")
            scoreO.text=String("0")
            gameState=[0,0,0,0,0,0,0,0,0]
            gameActive=true
            activePlayer=1
            for i in 1...9
                {
                let button=view.viewWithTag(i) as! UIButton
                    button.setImage(nil, for:.normal)
                }
        case .up:
            x=0
            y=0
            win=0
            scoreX.text=String("0")
            scoreO.text=String("0")
            gameState=[0,0,0,0,0,0,0,0,0]
            gameActive=true
            activePlayer=1
            for i in 1...9
                {
                let button=view.viewWithTag(i) as! UIButton
                    button.setImage(nil, for:.normal)
                }
        case .down:
            x=0
            y=0
            win=0
            scoreX.text=String("0")
            scoreO.text=String("0")
            gameState=[0,0,0,0,0,0,0,0,0]
            gameActive=true
            activePlayer=1
            for i in 1...9
                {
                let button=view.viewWithTag(i) as! UIButton
                    button.setImage(nil, for:.normal)
                }
        default:
            break
        }
    
    }
    
    // Shake function to Redo the Change
    override var canBecomeFirstResponder: Bool{return true}
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {

        if(motion == .motionShake && noOfShake == 0 && win==0 ){
            
            print(endsender)
            let alertController = UIAlertController(title: "Phone Shake!!", message: "??????Undo Last move!!", preferredStyle: UIAlertController.Style.alert)
        
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in alertController.dismiss(animated: true, completion: nil)
                
            }))
            self.present(alertController ,animated: true , completion: nil)
            switch endsender
            {
            case 1:
                print("1")
                btn1.setImage(nil, for: .normal)
                gameState[endsender-1]=0
                if activePlayer == 2 {activePlayer=1}else {activePlayer=2}
                noOfShake=1
            case 2:
                print("2")
                btn2.setImage(nil, for: .normal)
                gameState[endsender-1]=0
                if activePlayer == 2 {activePlayer=1}else {activePlayer=2}
                noOfShake=1
            case 3:
                print("3")
                btn3.setImage(nil, for: .normal)
                gameState[endsender-1]=0
                if activePlayer == 2 {activePlayer=1}else {activePlayer=2}
                noOfShake=1
            case 4:
                print("4")
                btn4.setImage(nil, for: .normal)
                gameState[endsender-1]=0
                if activePlayer == 2 {activePlayer=1}else {activePlayer=2}
                noOfShake=1
            case 5:
                print("5")
                btn5.setImage(nil, for: .normal)
                gameState[endsender-1]=0
                if activePlayer == 2 {activePlayer=1}else {activePlayer=2}
                noOfShake=1
            case 6:
                print("6")
                btn6.setImage(nil, for: .normal)
                gameState[endsender-1]=0
                if activePlayer == 2 {activePlayer=1}else {activePlayer=2}
                noOfShake=1
            case 7:
                print("7")
                btn7.setImage(nil, for: .normal)
                gameState[endsender-1]=0
                if activePlayer == 2 {activePlayer=1}else {activePlayer=2}
                noOfShake=1
            case 8:
                print("8")
                btn8.setImage(nil, for: .normal)
                gameState[endsender-1]=0
                if activePlayer == 2 {activePlayer=1}else {activePlayer=2}
                noOfShake=1
            case 9:
                print("9")
                btn9.setImage(nil, for: .normal)
                gameState[endsender-1]=0
                if activePlayer == 2 {activePlayer=1}else {activePlayer=2}
                noOfShake=1
            default:
                break
            }
        }
    }//closing brace for shake function
    
    
    //Functions to Store data and Fetch Data
    
    func savedata(sc:Int , key:String)
    {
        let newData=NSEntityDescription.insertNewObject(forEntityName: "Values", into: self.context)
        newData.setValue(sc, forKey: key)
        appdelegate.saveContext()
    }
    
    func fetchdata(_ context: NSManagedObjectContext)
    {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Values")
        do{
            var xData:Int
            var yData:Int
            
            let result = try context.fetch(request)
            if result.count > 0
            {
                for res in result as! [NSManagedObject]
                {
                    if let x=res.value(forKey: "x")
                    {
                        xData=x as! Int
                        print(xData)
                    }
                    if let y=res.value(forKey: "y")
                    {
                        yData=y as! Int
                        print(yData)
                    }
                    
                }
                
                
            }
            
        }catch{
            
            
        }

}
    
}


