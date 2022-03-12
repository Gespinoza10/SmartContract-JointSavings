
//Joint Savings Account
//---------------------

pragma solidity ^0.5.0;

// Define a new contract named `JointSavings`
contract JointSavings {

    //Define the variable we are using for the contract
    address payable accountOne;
    address payable accountTwo;
    address public lastToWithdraw;
    uint public lastToWithdrawAmount;
    uint public contractBalance;

    //Createa a withdraw function that includes 2 arguements
    function withdraw(uint amount, address payable recipient) public {

        //require statements to varify 
        require(recipient == accountOne || recipient==accountTwo, "You don't own this account!");
        require(contractBalance>=amount, "Insufficient funds!");

        //last to withdraw has to be updated
        if(lastToWithdraw != recipient){
            lastToWithdraw = recipient;
        }

        //withdraw amount is being updated 
        recipient.transfer(amount);
        lastToWithdrawAmount=amount;
        contractBalance = address(this).balance;
    }

    //Create our deposit function 
    function deposit() public payable {
        contractBalance = address(this).balance;

    }

    //assign our joint accounts
    function setAccounts(address payable account1, address payable account2) public{

        accountOne = account1;
        accountTwo = account2;
    }

    //Fall back function
    function () external payable {}

}
