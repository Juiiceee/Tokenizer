# Tokenizer Project Documentation

## Project Overview

The **Tokenizer** project is a Solidity smart contract that implements a customizable ERC-20 token with mint and burn functionalities. It uses OpenZeppelin for security and Foundry for development.

### Key Features
- **ERC-20 Compliance**: Compatible with the ERC-20 standard
- **Controlled Minting**: Only the owner can create new tokens
- **Public Burning**: Any holder can burn their own tokens
- **Approve and Allowance**: Token holders can approve others to spend tokens on their behalf using the `approve` function, and delegated transfers are performed with `transferFrom`.
- **Customizable Parameters**: Name, symbol, and initial supply are configurable

### Deployed Contract
- **Network**: Arbitrum Sepolia Testnet
- **Address**: `0x6ed79985e8bc3891de6a4bdf866656b5ecba90de`
- **Explorer**: [View on Arbiscan](https://sepolia.arbiscan.io/token/0x6ed79985e8bc3891de6a4bdf866656b5ecba90de)

## Project Structure

```
Tokenizer/
├── code/tokenizer.sol              # Original contract source
├── deployment/                     # Foundry configuration
│   ├── foundry.toml               # Foundry configuration
│   ├── deploy.sh                  # Deployment script
│   ├── src/tokenizer.sol          # Contract for deployment
│   └── lib/                       # External dependencies
└── documentation/documentation.md  # This documentation
```

## Installation and Setup

### Prerequisites
```bash
# Install Foundry
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

### Installation
```bash
git clone <repository-url>
cd Tokenizer/deployment
forge install
forge build
```

## Smart Contract Analysis

### Main Functions

```solidity
// Constructor
constructor(string memory name, string memory symbol, uint256 initialSupply)

// Mint (owner only)
function mint(address to, uint256 amount) public onlyOwner

// Burn (public)
function burn(uint256 amount) public
```

### Inheritance
- **ERC20**: Standard OpenZeppelin implementation
- **Ownable**: Access control through ownership

## Deployment

### Environment Variables
```bash
ARBITRUM_SEPOLIA=https://api.zan.top/arb-sepolia
PRIVATE_KEY=your_private_key_here
ETHERSCAN_API_KEY=your_etherscan_api_key_here
```

### Deployment Methods

#### Automatic script
```bash
chmod +x deploy.sh
./deploy.sh
```

#### Manual deployment
```bash
forge create ./src/tokenizer.sol:Tokenizer \
  --rpc-url https://api.zan.top/arb-sepolia \
  --private-key $PRIVATE_KEY \
  --constructor-args "TokenName" "SYMBOL" 1000000 \
  --verify
```