<script lang="ts">
	import { onMount } from 'svelte';
	import Web3, { Contract } from 'web3';
	import contractABI from '../abi.json';

	let web3: Web3;
	let contract: Contract<typeof contractABI.abi>;
	let recipient: string = '';
	let minting: boolean = false;

	$: isEthAddress = isValidEthAddress(recipient);

	function isValidEthAddress(address: string) {
		const regex = /^0x[a-fA-F0-9]{40}$/;
		return regex.test(address);
	}
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

{#if web3}
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
