import { ethers } from 'ethers';
import contractABI from '$lib/abi.json'; // Adjust the import path as needed
import { mintedCount } from '$lib/store/mintedCount';

export async function load() {
	const provider = new ethers.JsonRpcProvider(
		'https://sepolia.infura.io/v3/55f68398841246c1bac9a528974889e7'
	);
	const contractAddress = '0x8545a272FAE7cdF7baB06844938d393BAeC639e6';
	const contract = new ethers.Contract(contractAddress, contractABI.abi, provider);

	try {
		const count = await contract.currentTokenId();
		mintedCount.set(Number(count));
		return {};
	} catch (error) {
		console.error('Error fetching minted count:', error);
		return {};
	}
}
