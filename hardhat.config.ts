import { HardhatUserConfig } from 'hardhat/config'
import '@nomicfoundation/hardhat-toolbox'
import 'dotenv/config'
require('dotenv').config()

const config: HardhatUserConfig = {
  solidity: '0.8.19',
  networks: {
    sepolia: {
      url: process.env.SEPOLIARPC,
      //@ts-ignore
      accounts: [process.env.PRIVATEKEY1,
        process.env.PRIVATEKEY2,
        process.env.PRIVATEKEY3,
        process.env.PRIVATEKEY4,
        process.env.PRIVATEKEY5,
      
      ],
    },
  },

  etherscan: {
    // Your API key for Etherscan
    // Obtain one at https://etherscan.io/
    
    apiKey: process.env.ETHERSCAN_API_KEY,
  },
}

export default config