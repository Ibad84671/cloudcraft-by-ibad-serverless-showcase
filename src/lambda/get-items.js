const { DynamoDBClient } = require('@aws-sdk/client-dynamodb');
const { DynamoDBDocumentClient, ScanCommand } = require('@aws-sdk/lib-dynamodb');

const db = DynamoDBDocumentClient.from(new DynamoDBClient({}));

exports.handler = async (event = {}, context) => {
  const headers = { 'content-type': 'application/json', 'cache-control': 'no-store' };
  try {
    const result = await db.send(new ScanCommand({ TableName: process.env.TABLE_NAME, Limit: 50 }));
    return {
      statusCode: 200,
      headers,
      body: JSON.stringify({ status: 'success', data: result.Items || [], requestId: context.awsRequestId })
    };
  } catch (error) {
    console.error(JSON.stringify({ requestId: context.awsRequestId, error: error.message }));
    return {
      statusCode: 500,
      headers,
      body: JSON.stringify({ status: 'error', message: 'Unable to read items', requestId: context.awsRequestId })
    };
  }
};
