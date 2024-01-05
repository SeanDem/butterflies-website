<script>
	import '../global.css';
	import ImageGrid from '$lib/components/ImageGrid.svelte';
	import Socials from '$lib/components/Socials.svelte';
	import ProvidenceRecord from '$lib/components/ProvidenceRecord.svelte';
	let x = 1123;
	let y = 2000;
</script>

<body>
	<div class="flex">
		<h1>Blockchain Butterflies</h1>
		<p class="text">
			A unique collection of colorful NFTs fluttering though the Ethereum Blockchain
		</p>
		<p class="text">{x}/{y} minted</p>
		<Socials />
	</div>

	<div class="flex">
		<ImageGrid />
	</div>
	<div class="flex">
		<ProvidenceRecord />
	</div>
</body>

<style>
	.flex {
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
	}

	.text {
		text-align: center;
	}
</style>
