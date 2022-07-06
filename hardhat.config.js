require('dotenv').config();
require("@nomiclabs/hardhat-waffle");

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

module.exports = {
    defaultNetwork: "hardhat",
    networks: {
      hardhat: {
      },
      baobab: {
        url: process.env.BAOBAB_URL,
        httpHeaders: {
          'Authorization': 'Basic ' + Buffer.from(process.env.ACCESS_KEY_ID + ':' + process.env.SECRET_ACCESS_KEY).toString('base64'),
          'x-chain-id': '1001',
        },
        accounts: [
          process.env.BAOBOB_DEPLOYER_PRIVATE_KEY || ''
        ],
        chainId: 1001,
        gas: 8500000,
      },
      cypress: {
        url: process.env.CYPRESS_URL,
        httpHeaders: {
          'Authorization': 'Basic ' + Buffer.from(process.env.ACCESS_KEY_ID + ':' + process.env.SECRET_ACCESS_KEY).toString('base64'),
          'x-chain-id': '8217',
        },
        accounts: [
          process.env.CYPRESS_DEPLOYER_PRIVATE_KEY || ''
        ],
        chainId: 8217,
        gas: 8500000,
      },
    },
    solidity: {
      version: "0.8.9",
      settings: {
        optimizer: {
          enabled: true,
          runs: 200
        }
      }
    },
    paths: {
      sources: "./contracts",
      tests: "./test",
      cache: "./cache",
      artifacts: "./artifacts"
    },
    mocha: {
      timeout: 40000
    }
  }