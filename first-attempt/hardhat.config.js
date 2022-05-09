require("@nomiclabs/hardhat-waffle");
const secret = require("./secrets.json");

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: "0.8.4",
  networks: {
    testnet: {
      url: "https://eth-rinkeby.alchemyapi.io/v2/Re4h3sIKHH-jE5b-98DRXiViLIDEPnTy",
      chainId: 4,
      accounts: [secret.key],
    },
  }
};
