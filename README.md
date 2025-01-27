x### README for CosmoFund Smart Contract

---

# **ClarityFund: Decentralized Crowdfunding for Space Exploration**

ClarityFund is a decentralized crowdfunding platform designed to support space exploration initiatives. Built using the Clarity smart contract language, it enables project creators to raise funds, contributors to support their favorite projects, and community voting to ensure transparency and accountability.

---

## **Features**

- **Project Submission**: Creators can submit projects with a name, funding goal, and deadline.
- **Contributions**: Contributors can fund projects, with funds securely managed within the smart contract.
- **Voting System**: Contributors vote on whether projects should release funds.
- **Refunds**: If a project fails to meet its funding goals or voting thresholds, contributors can claim refunds.
- **Extensions**: Projects can request deadline extensions under strict conditions.
- **Project Cancellation**: Creators can cancel projects if no funds have been raised.

---

## **Contract Structure**

### **Constants**
The contract includes pre-defined error codes, thresholds, and configurations:
- `ERR_UNAUTHORIZED`: Unauthorized access (Error Code: 100).
- `ERR_NOT_FOUND`: Resource not found (Error Code: 101).
- `ERR_INSUFFICIENT_FUNDS`: Insufficient funds provided (Error Code: 103).
- `ERR_DEADLINE_PASSED`: Deadline for the project or action has passed (Error Code: 104).
- Voting and extension thresholds, such as:
  - **Extension Threshold**: 75% of the funding goal must be met.
  - **Max Extension Days**: Up to 30 days.
  - **Voting Period**: 7 days.

---

### **Data Structures**

1. **`projects` Map**: Stores project details.
   - Fields: `name`, `creator`, `goal`, `deadline`, `total-raised`, `is-active`, `extensions-used`, `vote-end-time`, `total-votes`, `votes-in-favor`.

2. **`contributions` Map**: Tracks contributions to projects.
   - Fields: `project-id`, `contributor`, `amount`.

3. **`votes` Map**: Tracks votes on projects.
   - Fields: `project-id`, `voter`, `in-favor`.

4. **`project-nonce` Data Variable**: Auto-increments to assign unique IDs to projects.

---

## **Public Functions**

### **Project Management**
- **`submit-project`**: Submits a new project with the specified name, goal, and deadline.
- **`cancel-project`**: Allows the project creator to cancel a project if no funds have been raised.
- **`extend-deadline`**: Extends the project deadline under specific conditions.

### **Contributions**
- **`contribute`**: Enables users to contribute STX tokens to a project.

### **Voting**
- **`vote`**: Contributors vote to approve or reject the project funding release.

### **Funds Management**
- **`withdraw-funds`**: Allows the project creator to withdraw funds if the project meets funding and voting thresholds.
- **`refund`**: Refunds contributors if the project fails to meet funding goals or voting thresholds.

---

## **Read-Only Functions**

- **`get-project`**: Fetch details of a specific project.
- **`get-contribution`**: Fetch a contributor's contribution to a project.
- **`get-vote`**: Fetch voting details for a specific voter on a project.
- **`get-voting-status`**: View the project's voting status, including total votes, votes in favor, and whether thresholds are met.

---

## **Helper Functions**

1. **`project-exists`**: Checks if a project exists.
2. **`calculate-vote-percentage`**: Calculates the percentage of votes in favor for a project.

---

## **Usage**

### **1. Submitting a Project**
A project creator submits a project with:
```clarity
(submit-project "Mission to Mars" u1000000 u1700000)
```
Where `u1000000` is the funding goal, and `u1700000` is the deadline block height.

---

### **2. Contributing to a Project**
Users contribute funds using:
```clarity
(contribute u1 u5000)
```
Where `u1` is the project ID, and `u5000` is the amount of STX to contribute.

---

### **3. Voting on a Project**
Contributors vote using:
```clarity
(vote u1 true)
```
Where `u1` is the project ID, and `true` means they are in favor.

---

### **4. Withdrawing Funds**
Once the project meets the funding and voting thresholds:
```clarity
(withdraw-funds u1)
```
Where `u1` is the project ID.

---

### **5. Claiming a Refund**
If the project fails:
```clarity
(refund u1)
```
Where `u1` is the project ID.

---

## **Testing**

To test this contract:
1. Deploy the contract using Clarinet or any other Stacks-compatible development environment.
2. Interact with the public functions and verify the data maps and state transitions.

