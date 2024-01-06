import Web3 from 'web3';
import contractABI from '$lib/abi.json'; // Adjust the import path as needed
import { mintedCount } from '$lib/store/mintedCount';

export async function load() {
	const web3 = new Web3('https://sepolia.infura.io/v3/55f68398841246c1bac9a528974889e7');
	const contract = new web3.eth.Contract(
		contractABI.abi,
		'0x8545a272FAE7cdF7baB06844938d393BAeC639e6'
	);

	try {
		const count: number = await contract.methods.currentTokenId().call();
		mintedCount.set(count ?? 0);
		return {};
	} catch (error) {
		return {};
	}
}
