<script lang="ts">
	import { BrowserProvider, ethers } from 'ethers';
	import { onMount } from 'svelte';
	import contractABI from '../abi.json';
	import { CONTRACT_ADDRESS } from '../constants';

	let provider: BrowserProvider;
	let signer: ethers.JsonRpcSigner;
	let contract: ethers.Contract;
	let recipient: string = '';
	let minting: boolean = false;
	let numToMint: number = 1;
	let network: ethers.Network;

	$: isEthAddress = ethers.isAddress(recipient);
	$: isSepolia = network && Number(network.chainId) === 11155111;

	onMount(async () => {
		if (window.ethereum) {
			provider = new ethers.BrowserProvider(window.ethereum);
			signer = await provider.getSigner();
			setNetworkInfo();
			setupEventListeners();
			try {
				const accounts = await provider.listAccounts();
				if (accounts.length > 0) {
					recipient = accounts[0].address;
				}
			} catch (error) {
				console.error('Error fetching accounts:', error);
			}

			contract = new ethers.Contract(CONTRACT_ADDRESS, contractABI.abi, signer);
		} else {
			console.error('Ethereum object not found, make sure MetaMask is installed.');
		}
	});

	const mintNFT = async () => {
		try {
			minting = true;
			const tx = await contract.mintNPublic(recipient, numToMint);
			await tx.wait();
		} catch (error) {
			console.error('Error minting NFT:', error);
		} finally {
			minting = false;
		}
	};

	const connectWallet = async () => {
		try {
			await provider.send('eth_requestAccounts', []);
			signer = await provider.getSigner();
			contract = new ethers.Contract(CONTRACT_ADDRESS, contractABI.abi, signer);
			setNetworkInfo();
		} catch (error) {
			console.error('Error connecting to wallet:', error);
		}
	};

	const setupEventListeners = () => {
		window.ethereum.on('chainChanged', setNetworkInfo);
		window.ethereum.on('accountsChanged', handleAccountsChanged);
	};

	const setNetworkInfo = async () => {
		provider = new ethers.BrowserProvider(window.ethereum);
		network = await provider.getNetwork();
	};

	const handleAccountsChanged = async (accounts: ethers.JsonRpcSigner[]) => {
		if (accounts.length > 0) {
			recipient = accounts[0].address;
		}
	};
</script>

{#if ethers}
	<div class="flex-row wrap">
		<input
			class="mr-15 text-input"
			type="text"
			bind:value={recipient}
			placeholder="Recipient Address"
		/>
		<div class="small-input">
			<input class="mr-15 number-input" max="20" min="0" type="number" bind:value={numToMint} />
			<button
				class="submit-button mint"
				on:click={mintNFT}
				disabled={minting || !recipient || !isEthAddress || !isSepolia}
				>{minting ? 'Minting...' : 'Mint NFT'}</button
			>
		</div>
	</div>
	{#if recipient && !isEthAddress}
		<div class="error">Enter Valid ETH Address</div>
	{/if}
	{#if !isSepolia}
		<div class="error">Connect to Sepolia Testnet</div>
	{/if}
{:else}
	<button class="submit-button" on:click={connectWallet}>Connect Wallet</button>
{/if}

<style>
	.error {
		color: rgb(255, 89, 89);
	}

	.mr-15 {
		margin-right: 15px;
	}

	.wrap {
		flex-wrap: wrap;
	}

	@media (max-width: 900px) {
		.small-input {
			width: 100%;
			display: flex;
			justify-content: center;
			align-items: center;
		}
	}
</style>
