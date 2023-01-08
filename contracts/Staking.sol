pragma solidity >0.8.6;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
// import "openzeppelin-solidity-2.3.0/contracts/token/ERC20/ERC20Detailed.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

// Inheritance
import "@openzeppelin/contracts/security/Pausable.sol";
// import "./interfaces/IStakingRewards.sol";
// import "./RewardsDistributionRecipient.sol";
// SPDX-License-Identifier: GPL-3.0

error TransferFailed();
error NeedsMoreThanZero();

contract Staking is ReentrancyGuard {
    /* ========== STATE VARIABLES ========== */
    // it will cater to only onw token
    //  chainlink for multiple tokens
    // s_ means its in storage
    IERC20 public s_stakingToken;
    IERC20 public s_rewardsToken;
    // bassis point
    // minimal  rate  change
    // 1bp minimal change in interst rate
    // in INdia it is 0.01
    //  1basis point is 0.01%
    // 1 bp = 0.01%
    // 200bp = 2%

    // this is reward token per second

    uint256 public constant REWARD_RATE = 100;
    uint256 public s_lastUdateTime;
    uint256 public s_rewardPerTokenStored;

    mapping(address => uint256) public s_userRewardPerTokenPaid;
    // total rewards
    mapping(address => uint256) public s_rewards;

    mapping(address => uint256) public s_balances;
    uint256 private s_totalSuply;

    event Staked(address indexed user, uint256 indexed amount);
    // multi token staking contract
    event withdrewnStake(address indexed user, uint256 indexed amount);
    event RewardsClaimed(address indexed user, uint256 indexed amount);

    /* ========== CONSTRUCTOR ========== */

    // interface, to write own code custom function
    constructor(address stakingToken, address rewardsToken) {
        s_stakingToken = IERC20(stakingToken);
        s_rewardsToken = IERC20(rewardsToken);
    }

    /* ========== VIEWS ========== */

    function totalSupply() external view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address account) external view returns (uint256) {
        return s_balances[account];
    }

    function rewardsPerToken() public view returns (uint256) {
        //  100 bp as reward rate
        // block.timestamp
        // global method to calculate time
        if (s_totalSuply == 0) {
            return s_rewardPerTokenStored;
        }
        uint256 time_diff = block.timestamp - s_lastUdateTime;
        uint256 token_rewads_per_unit = ((time_diff * REWARD_RATE * 1e18) /
            s_totalSuply);
        return s_rewardPerTokenStored + token_rewads_per_unit;
    }

    function earned(address account) public view returns (uint256) {
        uint address_bal = s_balances[account];
        uint userRewardPerTokenPaid = s_userRewardPerTokenPaid[account];
        return
            (address_bal * (rewardsPerToken() - userRewardPerTokenPaid)) /
            1e18 +
            s_rewards[account];
    }

    /* ========== MUTATIVE FUNCTIONS ========== */

    function stake(
        uint256 amount
    )
        external
        nonReentrant
        notPaused
        updateReward(msg.sender)
        moreThanZero(amount)
    {
        // does order of modifiers matter?
        s_totalSuply += amount;
        s_balances[msg.sender] += amount;
        emit Staked(msg.sender, amount);
        // how contract has autority to transfer tokens?
        bool success = s_stakingToken.transferFrom(
            msg.sender,
            address(this),
            amount
        );
        if (!success) {
            revert TransferFailed();
        }
    }

    function withdraw(
        uint amount
    ) external updateReward(msg.sender) nonReentrant {
        s_totalSuply -= amount;
        s_balances[msg.sender] -= amount;
        emit withdrewnStake(msg.sender, amount);
        bool success = s_stakingToken.transfer(msg.sender, amount);
        if (!success) {
            revert TransferFailed();
        }
    }

    function claimReward() external updateReward(msg.sender) {
        uint256 reward = s_rewards[msg.sender];
        s_rewards[msg.sender] = 0;

        emit RewardsClaimed(msg.sender, reward);
        bool success = s_rewardsToken.transfer(msg.sender, reward);
        if (!success) {
            revert TransferFailed();
        }
    }

    // agends
    // modifiers 7-1-23
    // retrancy guard
    // sc => reward token => erc20
    // hardhat -> sc deployment
    // 100 tokens per seconds
    // total 100 tokens
    // 100 rbp rewards

    //|||| percentage of tokens staked  * reward_rate
    // percentage_staked * duration * reward per duration
    // depends on supply and demand
    // total_tokens = staked tokens +  percentage_staked * duration * reward per duration

    modifier updateReward(address account) {
        s_rewardPerTokenStored = rewardsPerToken();
        s_lastUdateTime = block.timestamp;
        s_rewards[account] = earned(account);
        s_userRewardPerTokenPaid[account] = s_rewardPerTokenStored;
        _;
    }

    modifier moreThanZero(uint amount) {
        // returning a string cost 32 bytesof data and
        // so calling a function is cost efficient.
        if (amount == 0) {
            revert NeedsMoreThanZero();
        }
        _;
    }

    function getStakedAmount(address account) public view returns (uint) {
        return s_balances[account];
    }
    // reentrancy guard? im portatnt for inteveris
    // very dangerous completely drain sc balancnce
    // expolot fallback function loop hole

    // In reentracy attack a SC function makes an external call to
    // untrusted sc.
    // there time b/w function call and state transisition
    // recursive call to withdraw

    // SC make call A
    // untrusted sc B
    // where SC A fails to update its state before sneding funds
    // B can continously call withdraw function to drain A's funds
    // no way to know b is malicious

    // contrat A
    // scehcking sc balance
    // sending funds
    // update balance

    // contract B
    // fallback function

    // reentracy scenario
    // 1) A - > 10 ethers
    // 2) B -> stake, deposit 1 ether in A
    // time lag b/w 2 and 3
    // 3 ) attacker => will call A's withdraw fucntion  and points to malicious recipent/contract
    //   recipient is malicious recipient contract b
    // 4) A's withdraw function will verify ezxecution,
    //   -A does attacker has one 1 ether bal -> yes
    //  A -> tranfer 1 eth to B( attacker bal not updated yet)
    // fallback function => fallback on ,recived eth call withdraw call again
    //      it fallback function on reveice again call same function
    // so pexectuion is never comleted so no state updation

    // it could have been avoided if balnce was updated before??
    // ? advantage of operation delay
    // execution stack never returned?
}
