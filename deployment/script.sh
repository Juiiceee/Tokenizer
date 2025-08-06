#!/bin/bash
source .env
forge create ../code/src/tokenizer.sol:Tokenizer --rpc-url ARBITRUM_SEPOLIA --private-key PK --constructor-args salut feur 9
forge create ../code/src/tokenizer.sol:Tokenizer --rpc-url https://api.zan.top/arb-sepolia --private-key PK --constructor-args salut feur 9