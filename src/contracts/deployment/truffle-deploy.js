const BlockchainButterflies = artifacts.require("BlockchainButterflies");

module.exports = function(deployer) {
  deployer.deploy(BlockchainButterflies, "http://mybaseuri.com/");
};
