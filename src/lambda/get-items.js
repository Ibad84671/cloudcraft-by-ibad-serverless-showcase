// ─── GET-ITEMS LAMBDA ───
exports.handler = async (event) => {
    console.log('Event:', JSON.stringify(event));

    try {
        const items = [
            { id: '1', name: 'Item 1', description: 'Sample item from Lambda' },
            { id: '2', name: 'Item 2', description: 'Another sample item' }
        ];

        return {
            statusCode: 200,
            headers: {
                'Content-Type': 'application/json',
                'Access-Control-Allow-Origin': '*'
            },
            body: JSON.stringify({ status: 'success', data: items })
        };
    } catch (error) {
        console.error('Error:', error);
        return {
            statusCode: 500,
            body: JSON.stringify({ status: 'error', message: error.message })
        };
    }
};