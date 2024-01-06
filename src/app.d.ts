interface EthereumProvider {
	request: ({ method }: { method: string }) => Promise<any>;
	ethereum: EthereumProvider;
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
