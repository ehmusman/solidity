// This script will be used deploy contracts to blockchain
// artifacts are basically your bytecode and ABI
const Demo = artifacts.require("Demo");

module.exports = function(deployer) {
  deployer.deploy(Demo);
};
