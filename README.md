# Advanced-Solidity-Crowdsale
My company has decided to crowdsale their PupperCoin token in order to help fund the network development.
This network will be used to track the dog breeding activity across the globe in a decentralized way, and allow humans to track the genetic trail of their pets. I have already worked with the necessary legal bodies and have the green light on creating a crowdsale open to the public. We are required to enable refunds if the crowdsale is successful and the goal is met, and you are only allowed to raise a maximum of 300 Ether. The crowdsale will run for 24 weeks.
I created an ERC20 token that will be minted through a Crowdsale contract that I leveraged from the OpenZeppelin Solidity library.
This crowdsale contract will manage the entire process, allowing users to send ETH and get back PUP (PupperCoin).
This contract will mint the tokens automatically and distribute them to buyers in one transaction.
It will need to inherit Crowdsale, CappedCrowdsale, TimedCrowdsale, RefundableCrowdsale, and MintedCrowdsale.
The crowdsale will use Kovan testnet in order to get a real-world pre-production test in.

Using Remix, PupperCoin.sol was used to create a standard ERC20Mintable token. 
Another contract named PupperCoinCrowdsale.sol was created for a standard crowdsale.
OpenZepplin Crowdsale, MintedCrowdsale, CappedCrowdsale, TimedCrowdsale and RefundablePosteDeliveryCrowdsale were used to help create the PuppercoinCrowdsale

The contract was deployed but not all aspects of the contract worked and had trouble interacting with MyCryptoWallet; On etherscan one can see that the contract was deployed but was unable to troubleshoot further.
