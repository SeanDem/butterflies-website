<script>
	import '../global.css';
	import ImageGrid from '$lib/components/ImageGrid.svelte';
	import Socials from '$lib/components/Socials.svelte';
	import ProvidenceRecord from '$lib/components/ProvidenceRecord.svelte';
	import Minted from '$lib/components/Minted.svelte';
	import Mint from '$lib/components/Mint.svelte';
</script>

<body class="body">
	<div class="flex-row">
		<div class="flex content-left">
			<h1>Blockchain Butterflies</h1>
			<div class="by-sean">
				<span>By: </span>
				<span class="by">Sean Demeritt</span>
			</div>
			<Minted />
			<div class="text">
				A unique collection of colorful NFTs fluttering through the Ethereum Blockchain
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
	.by-sean {
		font-size: 3vw;
	}
	.by {
		font-weight: bold;
	}
	.text {
		margin: 20px 10px;
		text-align: center;
	}
	.content-right {
		margin: 30px;
	}

	.content-left h1 {
		margin-bottom: 0px;
		margin-top: 5px;
	}

	.body {
		margin-top: 40px;
	}

	@media (max-width: 900px) {
		.flex-row {
			flex-direction: column;
		}
		.content-left {
			margin-right: 0px;
		}
		.by-sean {
			font-size: 20px;
		}
	}
</style>
