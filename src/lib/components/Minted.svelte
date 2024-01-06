<script lang="ts">
	import { mintedCount } from '$lib/store/mintedCount';
</script>

<main>
	{#if $mintedCount !== undefined}
		<p>{$mintedCount} / 2000</p>
	{/if}
</main>
