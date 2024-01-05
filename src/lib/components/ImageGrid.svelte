<script>
	const BASE_URL = 'https://ipfs.io/ipfs/QmUiqEwdFzHXw7bYBhsLKWBZYBrSSPEcV15g9LB2Gwrqby/';

	function getRandomUrls() {
		const urls = [];
		for (let i = 0; i < 12; i++) {
			const randomNumber = Math.floor(Math.random() * 2000);
			const imageUrl = `${BASE_URL}${randomNumber}.png`;
			urls.push(imageUrl);
		}
		return urls;
	}

	let randomButterflyUrls = getRandomUrls();

	function shuffleImages() {
		randomButterflyUrls = getRandomUrls();
	}
</script>

<!-- svelte-ignore a11y-click-events-have-key-events -->
<!-- svelte-ignore a11y-no-static-element-interactions -->
<div class="gallery" on:click={shuffleImages}>
	{#each randomButterflyUrls as url, index (index)}
		<div class="butterfly">
			<img src={url} alt={`Butterfly ${index}`} />
		</div>
	{/each}
</div>

<style>
	.gallery {
		width: 50%;
		display: grid;
		grid-template-columns: repeat(3, 1fr);
		grid-template-rows: repeat(3, auto);
		gap: 1rem;
		margin: auto;
	}

	.butterfly {
		max-width: 100%;
		height: auto;
	}

	.butterfly img {
		width: 230px;
		height: 230px;
		border-radius: 1rem;
	}

	@media (max-width: 700px) {
		.gallery {
			grid-template-columns: 1fr;
			grid-template-rows: auto;
		}

		.butterfly img {
			width: 400px;
			height: 400px;
			max-width: none;
			border-radius: 1rem;
		}
	}
</style>
