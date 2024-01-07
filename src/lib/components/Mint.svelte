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

	$: isEthAddress = ethers.isAddress(recipient);

	onMount(async () => {
		if (window.ethereum) {
			provider = new ethers.BrowserProvider(window.ethereum);
			signer = await provider.getSigner();

			try {
				const accounts = await provider.listAccounts();
				console.log(accounts);
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

	const connectWallet = async () => {
		try {
			await provider.send('eth_requestAccounts', []);
		} catch (error) {
			console.error('Error connecting to wallet:', error);
		}
	};

	const mintNFT = async () => {
		try {
			minting = true;
			const tx = await contract.mintTo(recipient);
			await tx.wait();
		} catch (error) {
			console.error('Error minting NFT:', error);
		} finally {
			minting = false;
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
				disabled={minting || !recipient || !isEthAddress}
				>{minting ? 'Minting...' : 'Mint NFT'}</button
			>
		</div>
	</div>
	{#if recipient && !isEthAddress}
		<div class="error">Enter Valid ETH Address</div>
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
