//get chai and hardhat
const { expect } = require("chai");
const { ethers, waffle } = require("hardhat");

//describe("name", calback)
// calback = () => { it ("name", callback1) }

let andrea, bernardo, provider, mortal;

describe("Mortal deployer", async () => {
  beforeEach("Deploy the contract", async () => {
    provider = ethers.provider;

    const Mortal = await ethers.getContractFactory("Mortal");
    mortal = await Mortal.deploy();
    await mortal.deployed(); //mine the transaction
  });

  it("Should print andreas adrr", async () => {
    [andrea, bernardo] = await ethers.getSigners();
    expect(andrea.address).to.equals(
      "0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266"
    );
  });

  it("Should kill the contract, with love ", async () => {

    expect(await provider.getCode(mortal.address)).to.not.equal("0x");
    await mortal.kill();
    expect(await provider.getCode(mortal.address)).to.equal("0x");

  });
});



   // let initialBalance = await provider.getBalance(mortal.address);
    // initialBalance = ethers.utils.formatEther(initialBalance);
    // act( async () => { await mortal.kill(); });

    // let finalBalance = await provider.getBalance(mortal.address);
    // finalBalance = ethers.utils.formatEther(finalBalance);
    // expect(finalBalance).to.equal(0);
