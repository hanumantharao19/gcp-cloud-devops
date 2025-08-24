/**
 * Triggered from a message on a Cloud Pub/Sub topic.
 * Logs the message to the console.
 */
exports.helloPubSub = (event, context) => {
  const message = event.data
    ? Buffer.from(event.data, 'base64').toString()
    : 'Hello, World';

  console.log(`Received message: ${message}`);
};
