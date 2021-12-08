This smart contract was created for an assignment according to the following specification:

In this assignment you will create your own custom token. Your contract should define the following
public API (plus any other functions/variables you deem necessary):

● tokenPrice: a uint256 that defines the price of your token in wei; each token can be
purchased with tokenPrice wei
● Purchase(address buyer, uint256 amount): an event that contains an address and a
uint256
● Transfer(address sender, address receiver, uint256 amount): an event that contains
two addresses and a uint256
● Sell(address seller, uint256 amount): an event that contains an address and a uint256
● Price(uint256 price): an event that contains a uint256
● buyToken(uint256 amount): a function via which a user purchases amount number of
tokens by paying the equivalent price in wei; if the purchase is successful, the function
returns a boolean value (true) and emits an event Purchase with the buyer’s address and
the purchased amount
● transfer(address recipient, uint256 amount): a function that transfers amount number of
tokens from the account of the transaction’s sender to the recipient; if the transfer is
successful, the function returns a boolean value (true) and emits an event Transfer, with the
sender’s and receiver’s addresses and the transferred amount
● sellToken(uint256 amount): a function via which a user sells amount number of tokens
and receives from the contract tokenPrice wei for each sold token; if the sell is successful,
the sold tokens are destroyed, the function returns a boolean value (true) and emits an
event Sell with the seller’s address and the sold amount of tokens
● changePrice(uint256 price): a function via which the contract’s creator can change the
tokenPrice; if the action is successful, the function returns a boolean value (true) and emits
an event Price with the new price (Note: make sure that, whenever the price changes, the
contract’s funds suffice so that all tokens can be sold for the updated price)
● getBalance(): a view that returns the amount of tokens that the user owns

Additionally, this contract uses a deployed instance of the SafeMath library for its uint256 calculations. A report of the security considerations and gas costs/fairness was also required.
