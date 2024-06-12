const BlockchainButterflies = artifacts.require("BlockchainButterflies");

module.exports = function(deployer) {
  deployer.deploy(BlockchainButterflies, "http://0xC2DB2fA3f5D21D8aE1376cE1d560FCC6F3EE4c41.com/");
};
