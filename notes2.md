1) move ahead by seconds
2)  move ahead by blocks
3)  1 dday =>86,400
4)  auto mine hardhat blocks => mine blocks instad of waiting 
5)  development patterns
6)  we are just adding blocks ?? without txns???????? https://hardhat.org/hardhat-network/docs/reference
7)  Instead of Time dependent rewards , we can block nb based reward system
8)  sir you were giving pdf to understand maths of staking /basis points
9)  move forward in time dont want to wait
10) / sc is allowed only approved to manipulate stake Amount
11) bcz the balance remain same is due to staking token being same, we can have d/f token also , instead of rt we can have srt
12) time dependent unit tests
13) https://trufflesuite.com/blog/introducing-ganache-7/#6-fast-forward-time


### INfura
1) Infrastructure as a Service,Blockchain Nodes as a service,provid an api to connect to this blockchain 
2) alchemy and infura

#### 
Infura 
=> web appllication => https
=> iot websocket 
https://polygon-mumbai.infura.io/v3/
https://app.infura.io/dashboard/ethereum/

https://faucet.polygon.technology/
why we are not use infura api in wallet
https://mumbai.polygonscan.com/
https://matic-mumbai.chainstacklabs.com

chainid: mumbai testnet


### CTC
You are correct that IERC20 is an interface in Solidity, which means it is not a contract that can be instantiated on its own.<br>
 However, the IERC20() constructor takes an address of an already deployed ERC-20 contract as its argument. When the IERC20() <br>
 constructor is called, it creates a new instance of the IERC20 interface, and assigns the address of the deployed ERC-20 contract<br>
  to this instance of the interface. This allows the contract to interact with the functions and variables of the deployed ERC-20 <br>
  contract as if it were an instance of the IERC20 interface.<br>

This is a common pattern in solidity to interact with external contracts, when a contract A want to interact with contract B, <br>
contract A will use an interface that contract B should implement, and use the address of contract B to create a new instance of<br>
 the interface, this way contract A can interact with contract B by calling the functions defined in the interface.<br>
 ```solidity 
        s_stakingToken=IERC20(stakingToken);
        s_rewardsToken=IERC20(rewardsToken);
```

 ### UI

 #### Moralis

Provides module of ease devlopment in web3
- isWeb3Enabled
- Account Management
- +

### NFT
-unique owner and unique contract and unique nft
- but we can copy past the owner's contract
- a standard for aeip for blockchain wide uniquness
- proof ownership of assets
- kideny .com everuhting price in kidney mint your kidney
- unique ownership of uinque item with unique item to uniqe owner adn unique owner
-  nft


### IPfs
- working of ipfs
- ipfs vs http
- location vs content based addressing
- CID : file always have unique id
- pin avoid garbage collection(removed from cache) //for permanent storage
- file coin storage

Two components
- directed acyclic graph
- distributed hash table

---

---
- Merkle Dag: content storage system for ipfs 
- each node in IPFS has a unique identifier
- merkle root contains hash of all the contnet of the block
- unique identier is a hash of everything inside that node
- https://dag.ipfs.tech/
- git use merkle dags
- divides data into chunks of 32/512 bytse
- each chuck of data has uniqe cid
- like in torrenrt distributed data 
- Data will contain numerous chunk of different cided data 
- to form the whole data, this different chuncks are gathered 
- this chucks are distributed over the peers
- why divison of data?: incresed decentralisation , node loss shard repair.node
- availability
- sha256 used in cid/merkle dag
- mltihash?
- base58btc encoding

---
-DHT: content discovering mechanism 
-which peer is hosting the content
- table of key and values
- it is plit across all the peers
- to find which peers are hosting the content
- Dht split accorss all peers in distributed ipfs network
- peers ask dht to find data
br
- type of data in dht
- | Type || purpose | used by |
- provider records || maps a hash CID->peer containing the data a particular cntent and peerr wll ing to provide content based on request | ipfs network to find content
-type: ipns records || ipnskey => filepath(ipfs//.io//) purpose: hash of public key of the node, inter planetary name system, ipns creates pointer to cid's(similar to dns ) ipnskey => ipns record filepath  || used_by: ipns
- peer records || peer id => connected peers condected nodes to node || IPFS

-comparable to http protocol

what is dns 

adv and diadv of ipfs :=>
- adv: decentralised no spof
- adv:= faster content delivery/nft market place
- stores multiple copies of data in chuncks so faster acces thhrough closest nodes
- reduced host cost
- diadv: not great adoption as comapared to http
- disadv of p2p systems, security issues
- disadv limited scalability.no incentive



## Nft marketplace
# architecture

# webiste that tells peoople you were scammed , to raise a voice
scam DAo resolver public support to resovlve it
works on just donation only
multi sig wallet
new genre of democaracy
find who did it how they did it publish ariticle and do reverse engineering
social enginerring, gather real info expose them 
gather all proof to being them to scrutiny

