//  PROGRAMMER: Evan Monroy
//  PANTHERID:  4199103
//  CLASS:      COP4655
//  INSTRUCTOR: Steve Luis
//  ASSIGNMENT: #2
//  DUE:        01/30/18
//
import Foundation

class Gameboard
{
    var victory: Bool = false
    var victorState: Int = 0
    
    var currentStates: [Int] = [0, 0, 0,
                                0, 0, 0,
                                0, 0, 0]
    var buttonStates: [String] = [" ", "X", "O"]
    
    func stateShift(loc: Int) -> String
    {
        //enforces the loop of " ", "X", and then "O" as per design specs
        //main issue is that everytime "O" goes to block 2 "X" from becoming
        //3 in a row, "X" is declared winner. thats pretty lame, but oh well.
        //recommend the program alternates between writing X and O rather than
        //looping to avoid. 
        
        //loop back to 0 for array
        if currentStates[loc] < 2
        {
            currentStates[loc] += 1
        }
        else
        {
            currentStates[loc] = 0
        }
        return buttonStates[currentStates[loc]]
    }
    
    func evaluate() -> Bool
    {
        //horizontal cases for victory
        if currentStates[0] == currentStates[1]  && currentStates[0] == currentStates[2] && currentStates[0] != 0
        || currentStates[3] == currentStates[4]  && currentStates[3] == currentStates[5] && currentStates[3] != 0
        || currentStates[6] == currentStates[7]  && currentStates[6] == currentStates[8] && currentStates[6] != 0
        {
            victory = true
        }
        //vertical cases for victory
        else if currentStates[0] == currentStates[3]  && currentStates[0] == currentStates[6] && currentStates[0] != 0
        || currentStates[1] == currentStates[4]  && currentStates[1] == currentStates[7] && currentStates[1] != 0
        || currentStates[2] == currentStates[5]  && currentStates[2] == currentStates[8] && currentStates[2] != 0
        {
            victory = true
        }
        //diagnol cases for victory
        else if currentStates[0] == currentStates[4]  && currentStates[0] == currentStates[8] && currentStates[0] != 0
        || currentStates[2] == currentStates[4]  && currentStates[2] == currentStates[6] && currentStates[2] != 0
        {
            victory = true
        }
        else
        {
            victory = false
        }
        
        return victory
    }
    
    func victorStatus(loc: Int) -> String
    {
        //simple read for the victor string of X or O
        return buttonStates[currentStates[loc]]
    }
    
    func resetText() -> String?
    {
        //my controller doesn't even know how to write " "
        //leave it to the model buddy
        return buttonStates[0]
    }
    
    func resetData()
    {
        for i in 0...8
        {
            //need to flush the array or else wierd victories start happening
            currentStates[i] = 0
        }
    }
}
