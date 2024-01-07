<script lang="ts">
	import { onMount } from 'svelte';
	import { ethers } from 'ethers';
	import contractABI from '../abi.json';

	let provider: any;
	let signer: any;
	let contract: ethers.Contract;
	let recipient: string = '';
	let minting: boolean = false;

	$: isEthAddress = ethers.isAddress(recipient);

	onMount(() => {
		provider = new ethers.BrowserProvider(window.ethereum);
		signer = provider.getSigner();
		const contractAddress = '0x8545a272FAE7cdF7baB06844938d393BAeC639e6';
		contract = new ethers.Contract(contractAddress, contractABI.abi, signer);
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
	<div class="flex-row">
		<input class="input-field" type="text" bind:value={recipient} placeholder="Recipient Address" />
		<button
			class="submit-button"
			on:click={mintNFT}
			disabled={minting || !recipient || !isEthAddress}
			>{minting ? 'Minting...' : 'Mint NFT'}</button
		>
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

	.input-field {
		margin-right: 15px;
	}
</style>
