<script lang="ts">
	import { IPFS_BASE_URL, OPENSEA_BASE_URL } from '$lib/constants';

	let randomButterflyUrls = getRandomUrls();

	function getRandomUrls(): { url: string; id: number }[] {
		const urls = [];
		for (let i = 0; i < 6; i++) {
			const id = Math.floor(Math.random() * 2000);
			const url = `${IPFS_BASE_URL}${id}.png`;
			urls.push({ url, id });
		}
		return urls;
	}

	function updateRandomNumber1() {
		setTimeout(
			() => {
				const newRandomNumber = Math.floor(Math.random() * 2000);
				randomButterflyUrls[1].url = `${IPFS_BASE_URL}${newRandomNumber}.png`;
				updateRandomNumber1();
			},
			1000 + Math.floor(Math.random() * 2000)
		);
	}

	function updateRandomNumber4() {
		setTimeout(
			() => {
				const newRandomNumber = Math.floor(Math.random() * 2000);
				randomButterflyUrls[4].url = `${IPFS_BASE_URL}${newRandomNumber}.png`;
				updateRandomNumber4();
			},
			1000 + Math.floor(Math.random() * 2000)
		);
	}
	updateRandomNumber1();
	updateRandomNumber4();
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
