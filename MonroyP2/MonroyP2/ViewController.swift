//  PROGRAMMER: Evan Monroy
//  PANTHERID:  4199103
//  CLASS:      COP4655
//  INSTRUCTOR: Steve Luis
//  ASSIGNMENT: #2
//  DUE:        01/30/18
//
import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet var gameButtons: [UIButton]!
    @IBOutlet var resetButton: UIButton!
    
    let GB = Gameboard()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //clear the "button" text from the field
        for element in gameButtons
        {
            element.setTitle(GB.resetText(), for: .normal)
        }
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPressed(_ sender: Any)
    {
        //multi button reading
        let myButton = sender as! UIButton
        
        //tells the model which button to look at for info
        //this might violate MVC if you squint hard enough
        //but look at each button as its own data container and its fine
        let position = gameButtons.index(of: myButton)
        myButton.setTitle(GB.stateShift(loc: position!), for: .normal)
        
        //checking for victor after each turn, naturally
        if(GB.evaluate())
        {
            //pop-up alert code, very basic. wish I could us swift 4 syntax for this. really poor readability in swift 3.
            let alertController = UIAlertController(title: "Victory!",
                                                    message: GB.victorStatus(loc: position!) + " wins!",
                                                    preferredStyle: UIAlertControllerStyle.alert)
            
            alertController.addAction(UIAlertAction(title: "Ok",
                                                    style: UIAlertActionStyle.default,
                                                    handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func resetPressed()
    {
        //I still don't get why people love these enhanced for loops so much
        //maybe i just prefer the classics.
        
        //sets text to " " but calls the model for more heavy lifting.
        //Don't be fooled by the simplicty.
        for element in gameButtons
        {
            element.setTitle(GB.resetText(), for: .normal)
        }
        
        GB.resetData()
    }
}

