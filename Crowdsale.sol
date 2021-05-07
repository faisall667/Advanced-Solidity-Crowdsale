pragma solidity ^0.5.0;

import "./PupperCoin.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/CappedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/TimedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/distribution/RefundablePostDeliveryCrowdsale.sol";

// @TODO: Inherit the crowdsale contracts
contract PupperCoinSale is Crowdsale, MintedCrowdsale, CappedCrowdsale, TimedCrowdsale, RefundablePostDeliveryCrowdsale{
  //  uint256 public investorMinCap = 2000000000000000;
   // uint256 public investorMaxCap = 300000000000000000000;
  //  mapping(address=>uint256) public investment;
    
    constructor(
        // @TODO: Fill in the constructor parameters!
        uint256 rate,
        address payable wallet,
        PupperCoin token,
        uint cap,
        uint openingTime,
        uint closingTime
    ) public
        // @TODO: Pass the constructor parameters to the crowdsale contracts.
        
        Crowdsale(rate, wallet, token)
        CappedCrowdsale(cap)
        TimedCrowdsale(openingTime, closingTime)
        RefundableCrowdsale(cap) 
    {
        // constructor can stay empty
    }
}


    //function minmaxcap(
     //   address investor, 
       // uint256 amount) 
    //    internal
      //  {
        //    super.minmaxcap(investor, amount); //super gives direct access to the function
         //   uint256 existingamount = investment[investor];
          //  uint256 newamount = existingamount.add(amount);
        //    require(newamount >= investorMinCap && newamount <= investorMaxCap);
    //    }
contract PupperCoinSaleDeployer {

    address public token_sale_address;
    address public token_address;

    constructor(
        // @TODO: Fill in the constructor parameters!
        string memory name,
        string memory symbol,
        address payable wallet,
        uint goal
    )
        public
    {
         // @TODO: create the PupperCoin and keep its address handy
        PupperCoin token = new PupperCoin(name, symbol, 0);
        token_address = address(token);

        // @TODO: create the PupperCoinSale and tell it about the token, set the goal, and set the open and close times to now and now + 24 weeks.
       
        PupperCoinSale Pupper_Sale = new PupperCoinSale (1, wallet, token, goal, now, now + 24 weeks);
        token_sale_address = address(Pupper_Sale);

        // make the PupperCoinSale contract a minter, then have the PupperCoinSaleDeployer renounce its minter role
        token.addMinter(token_sale_address);
        token.renounceMinter();
    }
}
