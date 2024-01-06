<script lang="ts">
	import { type ListBlobResultBlob } from '@vercel/blob';

	const BASE_URL = 'https://ipfs.io/ipfs/QmUiqEwdFzHXw7bYBhsLKWBZYBrSSPEcV15g9LB2Gwrqby/';

	let blobs: ListBlobResultBlob[] = [];
	let randomButterflyUrls = getRandomUrls();

	function getRandomUrls() {
		const urls = [];
		for (let i = 0; i < 6; i++) {
			const randomNumber = Math.floor(Math.random() * 2000);
			const imageUrl = `${BASE_URL}${randomNumber}.png`;
			urls.push(imageUrl);
		}
		return urls;
	}

	function updateRandomNumbers() {
		setInterval(() => {
			const newRandomNumber1 = Math.floor(Math.random() * 2000);
			const newRandomNumber2 = Math.floor(Math.random() * 2000);
			randomButterflyUrls[1] = `${BASE_URL}${newRandomNumber1}.png`;
			randomButterflyUrls[4] = `${BASE_URL}${newRandomNumber2}.png`;
		}, 2000);
	}

	updateRandomNumbers();
</script>

<div class="gallery">
	{#each randomButterflyUrls as url, index (index)}
		<div class="butterfly">
			<img src={url} alt={`Butterfly ${index}`} />
		</div>
	{/each}
</div>

{#if blobs.length > 1}
	{#each blobs as blob, index (index)}
		<div>{blob.url}</div>
	{/each}
{/if}

<style>
	.gallery {
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
		width: 170px;
		height: 170px;
		border-radius: 1rem;
	}

	@media (max-width: 900px) {
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
