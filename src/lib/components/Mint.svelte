<script lang="ts">
	import { onMount } from 'svelte';
	import Web3, { Contract } from 'web3';
	import contractABI from '../abi.json';

	let web3: Web3;
	let contract: Contract<typeof contractABI.abi>;
	let recipient: string = '';
	let mintAmount: number = 1;
	let minting: boolean = false;

	onMount(() => {
		web3 = new Web3(window.ethereum);
		const contractAddress = '0x8545a272FAE7cdF7baB06844938d393BAeC639e6';
		contract = new web3.eth.Contract(contractABI.abi, contractAddress);
	});

	const connectWallet = async () => {
		try {
			await window.ethereum.request({ method: 'eth_requestAccounts' });
		} catch (error) {
			console.error('Error connecting to wallet:', error);
		}
	};

	const mintNFT = async () => {
		try {
			minting = true;
			const accounts = await web3.eth.getAccounts();
			await contract.methods.mintTo(recipient).send({ from: accounts[0] });
		} catch (error) {
			console.error('Error minting NFT:', error);
		} finally {
			minting = false;
		}
	};
</script>

<main>
	{#if web3}
		<div>
			<input type="text" bind:value={recipient} placeholder="Recipient Address" />
			<input type="number" bind:value={mintAmount} min="1" placeholder="Amount to Mint" />
			<button on:click={mintNFT} disabled={minting || !recipient}
				>{minting ? 'Minting...' : 'Mint NFT'}</button
			>
		</div>
	{:else}
		<button on:click={connectWallet}>Connect Wallet</button>
	{/if}
</main>
