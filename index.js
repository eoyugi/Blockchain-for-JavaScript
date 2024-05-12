const { ethers } = require('ethers');
const fetch = require('node-fetch');

// Ethereum RPC provider URL
const providerUrl = 'http://localhost:8545'; // Update with your provider URL

// Contract address and ABI
const contractAddress = 'YOUR_CONTRACT_ADDRESS';
const contractABI = require('./lib/news-archive-abi.json'); // Update with your ABI file path

// Initialize Ethereum provider
const provider = new ethers.providers.JsonRpcProvider(providerUrl);

// Initialize contract
const contract = new ethers.Contract(contractAddress, contractABI, provider);

// Function to fetch news articles from the blockchain
async function fetchNewsArticles() {
  try {
    const articles = await contract.getAllArticles();
    return articles;
  } catch (error) {
    console.error('Error fetching news articles:', error);
    return [];
  }
}

// Main function to fetch and display news articles
async function main() {
  const articles = await fetchNewsArticles();
  articles.forEach((article, index) => {
    console.log(`Article ${index + 1}: ${article}`);
  });
}

// Run the main function
main();
