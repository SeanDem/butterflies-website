<script>
	import { OPENSEA_BASE_URL, IPFS_BASE_URL } from '$lib/constants';
	import { mintedCount } from '$lib/store/mintedCount';

	$: mintedList = Array.from(Array($mintedCount).keys());
</script>

<section class="provenance-header">
	<h2>PROVENANCE RECORD</h2>
	<p>Contract Details | 0x8545a272FAE7cdF7baB06844938d393BAeC639e6</p>
</section>

<div class="list-container">
	<div class="sub-header-group">
		<span class="sub-header">Butterfly ID</span>
		<span class="sub-header">OpenSea Link</span>
		<span class="sub-header">IPFS Link</span>
	</div>
	{#each mintedList as count (count)}
		<div class="list-item">
			<span>{count + 1}</span>
			<a href={`${OPENSEA_BASE_URL}/${count + 1}`}>View OpenSea</a>
			<a href={`${IPFS_BASE_URL}/${count + 1}.png`}>View IPFS</a>
		</div>
	{/each}
	<div class="total-count">Total Minted: {$mintedCount}</div>
</div>

<style>
	.provenance-header {
		text-align: center;
		color: white;
		padding: 20px;
	}

	.sub-header-group {
		display: grid;
		grid-template-columns: repeat(3, 1fr);
		gap: 15vw;
	}

	.sub-header {
		background: linear-gradient(to right, #fc7784, #f9a84c, #ffff71, #6efe8d, #4daffa);
		background-clip: text;
		color: transparent;
		text-decoration: none;
	}

	.list-container {
		color: white;
		padding: 20px;
	}

	.list-item {
		display: grid;
		grid-template-columns: repeat(3, 1fr);
		border-top: 1px solid white;
		padding: 10px 0;
		align-items: center;
		gap: 15vw;
	}

	.list-item a {
		text-decoration: none;
		gap: 15vw;
	}

	.total-count {
		margin-top: 10px;
		text-align: center;
	}
</style>
