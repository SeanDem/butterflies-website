<script lang="ts">
	import { mintedCount } from '$lib/store/mintedCount';
</script>

<main>
	{#if $mintedCount !== undefined}
		<p class="minted">{$mintedCount} / 2000 minted</p>
	{/if}
</main>

<style>
	.minted {
		font-size: 30px;
	}
</style>
