<script>
	import '../global.css';
	import ImageGrid from '$lib/components/ImageGrid.svelte';
	import Socials from '$lib/components/Socials.svelte';
	import ProvidenceRecord from '$lib/components/ProvidenceRecord.svelte';
	import Minted from '$lib/components/Minted.svelte';
	import Mint from '$lib/components/Mint.svelte';
</script>

<body>
	<div class="flex-row">
		<div class="flex content-left">
			<h1>Blockchain Butterflies</h1>
			<Minted />
			<div class="text">
				<p>A unique collection of colorful NFTs fluttering through the Ethereum Blockchain</p>
			</div>
			<Mint />
			<Socials />
		</div>

		<div class="flex content-right">
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
	.content-left {
		margin-right: 30px;
	}

	.content-left h1 {
		margin-bottom: 0px;
	}

	@media (max-width: 900px) {
		.flex-row {
			flex-direction: column;
		}
	}
</style>
