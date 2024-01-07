interface EthereumProvider {
	request: ({ method }: { method: string }) => Promise<any>;
	ethereum: EthereumProvider;
	on: (event: string, callback: (accounts: ethers.JsonRpcSigner[]) => void) => void;
}

declare global {
	interface Window {
		ethereum: EthereumProvider;
	}

	namespace App {
		// interface Error {}
		// interface Locals {}
		// interface PageData {}
		// interface PageState {}
		// interface Platform {}
	}
}

export {};
