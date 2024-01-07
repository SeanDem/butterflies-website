<script lang="ts">
	import { IPFS_BASE_URL, OPENSEA_BASE_URL } from '$lib/constants';
	import { mintedCount } from '$lib/store/mintedCount';

	let randomButterflyUrls = getRandomUrls();
	const IMAGE_COUNT = 9;
	function getRandomUrls(): { url: string; id: number }[] {
		const urls = [];
		for (let i = 0; i < IMAGE_COUNT; i++) {
			const id = Math.floor(Math.random() * $mintedCount);
			const url = `${IPFS_BASE_URL}${id}.png`;
			urls.push({ url, id });
		}
		return urls;
	}

	function updateRandomImg() {
		setTimeout(() => {
			const randomImgIndex = Math.floor(Math.random() * IMAGE_COUNT);
			const newRandomNumber = Math.floor(Math.random() * $mintedCount);
			randomButterflyUrls[randomImgIndex].url = `${IPFS_BASE_URL}${newRandomNumber}.png`;
			updateRandomImg();
		}, 1000);
	}

	updateRandomImg();
</script>

<div class="gallery">
	{#each randomButterflyUrls as url, index (index)}
		<div class="butterfly">
			<a href={`${OPENSEA_BASE_URL}${url.id}`} target="_blank">
				<img src={url.url} alt={`Butterfly ${index}`} />
			</a>
		</div>
	{/each}
</div>

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
		width: 12vw;
		height: 12vw;
		border-radius: 1rem;
	}

	@media (max-width: 900px) {
		.gallery {
			grid-template-columns: 1fr;
			grid-template-rows: auto;
		}

		.butterfly img {
			width: 300px;
			height: 300px;
			max-width: none;
			border-radius: 1rem;
		}
	}
</style>
