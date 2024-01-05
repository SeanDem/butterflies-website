<script>
	const BASE_URL = 'https://ipfs.io/ipfs/QmUiqEwdFzHXw7bYBhsLKWBZYBrSSPEcV15g9LB2Gwrqby/';

	function getRandomUrls() {
		const urls = [];
		for (let i = 0; i < 9; i++) {
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

<div class="gallery" on:click={shuffleImages}>
	{#each randomButterflyUrls as url, index (index)}
		<div class="butterfly">
			<img src={url} alt={`Butterfly ${index}`} />
		</div>
	{/each}
</div>

<style>
	.gallery {
		display: grid;
		grid-template-columns: repeat(3, 1fr);
		grid-template-rows: repeat(3, auto);
		gap: 1rem;
		width: 33%;
		margin: auto;
	}
	.butterfly {
		max-width: 100%;
		height: auto;
	}
	.butterfly img {
		width: 100%;
		height: auto;
	}
</style>
