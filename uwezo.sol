// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0; 


/* 

Our Primary fund allocator 
The bank caters for all transactions made 
Carries 3 Functions  (1) Donate  (2) CheckBalance (3) 

*/
contract Uwezo_Bank{ 
    address public Bank ; 
    uint256 public AccountBalance ; 


    constructor(uint256 _Balance) { 
        Bank = msg.sender ; 
        // Upon deployment , Youll be asked to key in this to feed dthe bank 
        AccountBalance = _Balance ; 
    }



// event emitted when a transaction is successfull 
event OnSuccess(address Rec , uint256 Amnt );

// Function to check account balance 
// Returns uint256 -- AccountBalance 
function Check_Account_Balance() public view returns(uint256){
    return AccountBalance ;
}


// Function to Donate Amount X to Person Y | Project Y-X 
// Returns Nothing | Requires 2 Parameters (Address | Amount) 
function Donate_Grant_Amount(address Receiver , uint256 Amount ) public {
    require(AccountBalance > Amount , "Sorry . Your account balance is to low . Please recharge your account then try again .");
    // Deducting Donations from our bank account 
    AccountBalance -= Amount ; 
    emit OnSuccess(Receiver ,Amount);


}
}
