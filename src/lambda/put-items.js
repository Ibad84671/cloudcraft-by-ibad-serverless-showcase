// ─── PUT-ITEMS LAMBDA ───
exports.handler = async (event) => {
    console.log('Event:', JSON.stringify(event));

    try {
        const body = JSON.parse(event.body || '{}');
        const newItem = {
            id: Date.now().toString(),
            name: body.name || 'Unnamed',
            description: body.description || ''
        };

        return {
            statusCode: 201,
            headers: {
                'Content-Type': 'application/json',
                'Access-Control-Allow-Origin': '*'
            },
            body: JSON.stringify({ status: 'success', data: newItem })
        };
    } catch (error) {
        console.error('Error:', error);
        return {
            statusCode: 500,
            body: JSON.stringify({ status: 'error', message: error.message })
        };
    }
};