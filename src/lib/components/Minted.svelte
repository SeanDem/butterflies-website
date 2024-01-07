<script lang="ts">
	import { mintedCount } from '$lib/store/mintedCount';
</script>

{#if $mintedCount !== undefined}
	<p class="minted">{$mintedCount} / 2000 Minted</p>
{/if}

<style>
	.minted {
		font-size: 34px;
	}
</style>
