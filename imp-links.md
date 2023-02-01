https://ethereum.stackexchange.com/questions/91520/how-to-read-the-return-object-of-call-to-function-in-a-contract

v   iew returns (...)
those functions are used to get the state (the value saved inside a variable in the contract). you cant change anything inside the contract and you cant emit events. those functions return the raw value to you so you will get true or false back.