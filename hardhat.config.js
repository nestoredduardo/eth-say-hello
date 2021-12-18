require("@nomiclabs/hardhat-waffle")
require("dotenv").config()

module.exports = {
  solidity: "0.8.0",
  networks: {
    rinkeby: {
      url: process.env.REACT_APP_ALCHEMY_API_URL,
      accounts: [process.env.REACT_APP_PRIVATE_RINKEBY_ACCOUNT_KEY],
    },
  },
}
