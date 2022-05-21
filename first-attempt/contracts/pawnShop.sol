//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

import '@uniswap/v2-periphery/contracts/libraries/UniswapV2Library.sol';

contract PawnShop is Ownable ERC20, Mortal  {

    struct Rational {
        uint numerator;
        uint denominator;
    }

    //terms and conditions
    IERC20 public token;
    Rational public loanAmount;
    Rational public payoffAmount;
    uint32 public loanDuration;

    constructor(
        address lender,
        IERC20 _token,
        uint _loanNumerator,
        uint _loanDenominator,
        uint payoffNumerator,
        uint payoffDenominator,
        uint _loanDuration
    ) public payable {
        owner = lender;
        token = _token;
        loanAmount = Rational(_loanNumerator, _loanDenominator);
        payoffAmount = Rational(payoffNumerator, payoffDenominator);
        loanDuration = _loanDuration;
    }

     function multiply(Rational r, uint256 x) internal pure returns (uint256) {
        if (x == 0) { return 0; }
        uint256 v = x * r.numerator;
        assert(v / x == r.numerator);
        return v / r.denominator;
    }

    event LoanStarted(
        address indexed lender,
        address indexed borrower,
        IERC20 token,
        uint loanAmount,
        uint creationDue,
        uint dueDate,
    );

    // function mint() {
    //     mint();
    // }

    //what does that mean?
    function pawnTokens(uint amount){

    }

    console.log("Deploying PawnShop");
}