<script>
	const openseaLink = 'https://testnets.opensea.io/collection/blockchain-butterflies';
</script>

<footer>
	<a href={openseaLink} class="opensea-button">Buy on OpenSea</a>
	<div class="social-links"></div>
</footer>

<style>
	.opensea-button {
		display: inline-block;
		padding: 0.5rem 1rem;
		background-color: white; /* Set background to white */
		color: transparent;
		border-radius: 0.5rem;
		font-size: 1rem; /* Adjust the font size as needed */
		font-weight: bold;
		background-image: linear-gradient(to right, #fc7784, #f9a84c, #ffff71, #6efe8d, #4daffa);
		background-clip: text;
	}
	.social-links {
		display: flex;
		flex-direction: row;
		justify-content: center;
		align-items: center;
	}
</style>
