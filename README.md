# Escrow Smart Contract
The Escrow Smart Contract provides a secure platform for holding funds or assets in digital transactions, ensuring parties' adherence to contract terms before releasing them. Utilizing blockchain's precision, it minimizes human intervention and enhances trust in online transactions.

## Usage
1. **Buyer-Seller Agreement:** The buyer and seller agree to use the Escrow smart contract for their transaction. The buyer deposits funds, and the seller commits to delivering the product.

2. **Escrow Initiation:** The Escrow smart contract is deployed with the addresses of the buyer, seller, and an arbiter (if required). The contract specifies the agreed price for the item.

3. **Payment and Fulfillment:** The buyer initiates payments through the sendPayment function, incrementally contributing funds until the total amount matches the item's price.

4. **Confirmation of Payment:** Once the total payment matches the price, the buyer uses the confirmPayment function to validate the payment and move to the await_delivery state.

5. **Delivery Confirmation:** After the buyer receives the product or service, they use the confirmDelivery function to authorize the release of funds to the seller.

6. **Refund (Optional):** In cases where the transaction cannot be completed, the seller can initiate a refund by using the returnPayment function, returning funds to the buyer.

## Contributions
Contributions are welcomed through pull requests. For significant changes, please start by opening an issue to discuss your proposed alterations.

## Acknowledgements
- ["From Idea to Execution: Developing Your First Escrow Smart Contract as a Beginner" by Daniel Pham](https://medium.com/coinmonks/from-idea-to-execution-developing-your-first-escrow-smart-contract-as-a-beginner-41d4ba278842)
- [Solidity docs](https://docs.soliditylang.org/en/v0.8.21/)
- [Remix IDE](https://remix.ethereum.org/)
