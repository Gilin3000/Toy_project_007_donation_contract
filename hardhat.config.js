/** @type import('hardhat/config').HardhatUserConfig */
require("@nomiclabs/hardhat-waffle");
require('dotenv').config();


module.exports = {
  solidity: "0.8.0",
  networks: {
    goerli: {
      url: `https://ethereum-goerli-rpc.allthatnode.com/${process.env.ALLTHATNODEAPI}`,
      accounts: [`${process.env.PRIVATE_KEY}`],
    }
  }
};
