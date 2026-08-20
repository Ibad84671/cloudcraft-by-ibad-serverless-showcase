const { DynamoDBClient } = require('@aws-sdk/client-dynamodb');
const { DynamoDBDocumentClient, PutCommand } = require('@aws-sdk/lib-dynamodb');

const db = DynamoDBDocumentClient.from(new DynamoDBClient({}));

exports.handler = async (event = {}, context) => {
  const headers = { 'content-type': 'application/json', 'cache-control': 'no-store' };
  try {
    const body = typeof event.body === 'string' ? JSON.parse(event.body || '{}') : (event.body || {});
    const name = String(body.name || '').trim();
    const description = String(body.description || '').trim();
    if (!name || name.length > 100 || description.length > 500) {
      return { statusCode: 400, headers, body: JSON.stringify({ status: 'error', message: 'Invalid item fields', requestId: context.awsRequestId }) };
    }
    const item = { id: context.awsRequestId, name, description, createdAt: new Date().toISOString() };
    await db.send(new PutCommand({ TableName: process.env.TABLE_NAME, Item: item }));
    return { statusCode: 201, headers, body: JSON.stringify({ status: 'success', data: item, requestId: context.awsRequestId }) };
  } catch (error) {
    console.error(JSON.stringify({ requestId: context.awsRequestId, error: error.message }));
    return { statusCode: 400, headers, body: JSON.stringify({ status: 'error', message: 'Invalid request', requestId: context.awsRequestId }) };
  }
};
