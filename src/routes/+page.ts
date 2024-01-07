import { ethers } from 'ethers';
import contractABI from '$lib/abi.json'; // Adjust the import path as needed
import { mintedCount } from '$lib/store/mintedCount';
import { CONTRACT_ADDRESS, RPC_PROVIDER } from '$lib/constants';

export async function load() {
	const provider = new ethers.JsonRpcProvider(RPC_PROVIDER);
	const contract = new ethers.Contract(CONTRACT_ADDRESS, contractABI.abi, provider);

	try {
		const count = await contract.currentTokenId();
		mintedCount.set(Number(count) - 1);
		return {};
	} catch (error) {
		console.error('Error fetching minted count:', error);
		return {};
	}
}
