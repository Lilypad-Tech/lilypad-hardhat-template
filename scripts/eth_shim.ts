import axios from 'axios';

interface JsonRpcRequest {
    jsonrpc: string;
    method: string;
    params: any[];
    id: number;
}

interface JsonRpcResponse {
    jsonrpc: string;
    id: number;
    result: string;
}

async function getMaxPriorityFeePerGas(): Promise<string> {
    const url = `http://127.0.0.1:8545/v3/`;
    const requestData: JsonRpcRequest = {
        jsonrpc: '2.0',
        method: 'eth_maxPriorityFeePerGas',
        params: [],
        id: 1,
    };

    try {
        const response = await axios.post<JsonRpcResponse>(url, requestData, {
            headers: {
                'Content-Type': 'application/json',
            },
        });

        if (response.data && response.data.result) {
            return response.data.result;
        } else {
            throw new Error('Invalid response from RPC service');
        }
    } catch (error) {
        console.error('Error fetching max priority fee per gas:', error);
        throw error;
    }
}

// Example usage
async function main() {
    try {
        const result = await getMaxPriorityFeePerGas();
        console.log('Max Priority Fee Per Gas:', result);
    } catch (error) {
        console.error('Failed to get max priority fee per gas:', error);
    }
}

main().catch((error) => {
    console.error('Unexpected error:', error);
});
