<script>
	import '../global.css';
	import ImageGrid from '$lib/components/ImageGrid.svelte';
	import Socials from '$lib/components/Socials.svelte';
	import ProvidenceRecord from '$lib/components/ProvidenceRecord.svelte';
	import Minted from '$lib/components/Minted.svelte';
	import Mint from '$lib/components/Mint.svelte';
</script>

<body>
	<h1>Blockchain Butterflies</h1>
	<div class="flex-row">
		<div class="flex left-text">
			<p class="text">
				A unique collection of colorful NFTs fluttering through the Ethereum Blockchain
			</p>
			<Minted />
			<Mint />
			<Socials />
		</div>

		<div class="flex">
			<ImageGrid />
		</div>
	</div>
	<div class="flex">
		<ProvidenceRecord />
	</div>
</body>

<style>
	.text {
		text-align: center;
	}
	.left-text {
		margin-right: 30px;
	}

	@media (max-width: 900px) {
		.flex-row {
			flex-direction: column;
		}
	}
</style>
