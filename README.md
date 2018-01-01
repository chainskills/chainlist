# Chainlist - Your classifieds on Ethereum

Sample Ethereum Dapp to create your classifieds on Ethereum.

This Dapp is linked to the course available on Udemy: https://www.udemy.com/getting-started-with-ethereum-solidity-development

Follow the steps described below to install, deploy and run the Dapp.

## Warning
**Make sure you don't run tests on Ethereum's main net otherwise you will use real ether with no chance to get them back**

## Prerequisites: Install tools and frameworks

To build, deploy and test your Dapp locally, you need to install the following tools and frameworks:
* **node.js and npm**: https://nodejs.org
  * Node.js can be installed using an installation package or through some package managers like Homebrew on a Mac.

* **Truffle**: https://github.com/trufflesuite/truffle
  * Create and deploy your Dapp with this build framework for Ethereum.

* **testrpc**: https://github.com/ethereumjs/testrpc
  * Simulates an Ethereum node.

* **Metamask**: https://metamask.io/
  * Transforms Chrome into a Dapp browser

## Step 1. Clone the project

`git clone https://github.com/chainskills/chainlist.git`

## Step 2. Install all dependencies

```
$ cd chainlist
$ npm install
```

## Step 3. Start your Ethereum node

Start testrpc with a set of predefined accounts and an initial balance:
```
$ ./starttestrpc.sh
```

The first account will be the **coinbase**, the account that will deploy the contracts.

## Step 4. Configure your project

If you didn't use the `starttestrpc.sh` script and started your own private chain instead, you should edit the `truffle.js` file and set the port number according to your Ethereum node.

## Step 5. Compile and deploy your smart contract

```
$ truffle migrate --reset
```

You will have to migrate (deploy) your smart contract each time your restart **testrpc**.

## Step 6. Metamask: connect to your local Ethereum node

Unlock the Metamask extension in Chrome, and switch it to the network "Localhost 8545".

## Step 7. Metamask: import your accounts

Import accounts defined in your testrpc Ethereum node.

If you used `starttestrpc.sh`, here are the 3 private keys defined in the script:
* 0x351494a5ae8f9b70a2a2fd482146ab4578f61d4d796685c597ec6683635a940e
* 0x4cd491f96e6623edb52719a8d4d1110a87d8d83e3fa86f8e14007cb3831c0a2b
* 0x0ef40e0d6ada046010b6965d73603cabae1a119ca804f5d9e9a9ce866b0bea7d

In Metamask, rename these accounts respectively:
* testrpc-coinbase
* testrpc-account1
* testrpc-account2

## Step 8. Run your frontend application

```
$ npm run dev
```

In your browser, open the following URL: http://localhost:3000

## Step 9. Metamask: switch to the `testrpc-account1` account

When you switch accounts or networks in Metamask, you have to refresh your  page to let your frontend application know about it.

## Step 10. Sell and buy articles

You can sell and buy articles using accounts imported in Metamask.

Metamask will ask you to confirm the transaction before selling or buying articles.

## Step 11. Interact with the smart contract:

From your console window, you can use the Truffle console to inspect the status of your contract.

Here are a few examples:

### Open the console:
```
$ truffle console truffle(development)>
```

### Get an instance of the smart contract:
```
truffle(development)> ChainList.deployed().then(function(instance) {app = instance; })
```
From now on, you can use the `app` variable to interact with your smart contract.

### List your accounts:
```
truffle(development)> web3.eth.accounts
[ '0x00d1ae0a6fc13b9ecdefa118b94cf95ac16d4ab0',   '0x1daa654cfbc28f375e0f08f329de219fff50c765',   '0xc2dbc0a6b68d6148d80273ce4d6667477dbf2aa7' ]
```

### Get the balance of your accounts:
```
truffle(development)> web3.fromWei(web3.eth.getBalance(web3.eth.accounts[1]), "ether").toNumber()
truffle(development)> web3.fromWei(web3.eth.getBalance(web3.eth.accounts[2]), "ether").toNumber()
```

### Watch for events:
```
truffle(development)> var sellEvent = app.sellArticleEvent({}, {fromBlock: 0,toBlock: 'latest'}).watch(function(error, event) {console.log(event);})
truffle(development)> var buyEvent = app.buyArticleEvent({}, {fromBlock: 0,toBlock: 'latest'}).watch(function(error, event) {console.log(event);})
```

### Get the list of articles:
```
truffle(development)> app.getArticlesForSale()
```

### Sell an article (using the account 1):
```
truffle(development)> app.sellArticle("Article 1", "Description for Article 1", web3.toWei(10, "ether"), {from: web3.eth.accounts[1]})
```

### Get the number of articles:
```
truffle(development)> app.getNumberOfArticles()
```

### Get the detail of an article (identified by its ID):
```
truffle(development)> app.articles(1)
```

### Buy an article as the account 2
```
truffle(development)> app.buyArticle(1, {from: web3.eth.accounts[2], value: web3.toWei(10, "ether")})
```

### Deactivate you smart contract:
Only required if you want to "kill" your smart contract.
This function is only allowed to the contract owner.
```
truffle(development)> app.kill({from: web3.eth.accounts[0]})
```

## Tips

* Is Metamask slow ? try to disable and enable the extension. This happens sometimes, especially when we work with a private chain.
* When you switch accounts in Metamask, don't forget to refresh the page to make sure you get the current account set in Metamask.
* When you restart your local node, Metamask caches the old contract and its data. You have to switch Metamask network to any other network then back to the local node to see changes.

## Learn more

If you want to know more about all the steps required to install, build and  deploy a Dapp, you can subscribe to our course available on Udemy: https://www.udemy.com/getting-started-with-ethereum-solidity-development

Have fun !!!

ChainSkills Team - 2017
