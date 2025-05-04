exports.handler = async (event) => {
  console.log('Event:', event);
  const message = process.env.MESSAGE || 'Default message';
  const response = {
    statusCode: 200,
    body: JSON.stringify({ message: message }),
  };
  return response;
};
