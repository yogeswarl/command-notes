# MongoDB with Node.js
## Install MongoDB
- `npm install mongodb --save`

## Connect to MongoDB
-  connect to mongoDB with the mongo client and connect to the database
- use an env variable to store the url
- use the mongo client to connect to the database

```javascript
const { MongoClient, ObjectId } = require("mongodb");
require('dotenv').config();
const url = process.env.MONGO_URL;
const dbName = process.env.MONGO_DB_NAME;
const collection_name = process.env.MONGO_COLLECTION_NAME;
const client = new MongoClient(url, { useNewUrlParser: true });
const collectionName = client.db(dbName).collection(collection_name);
// Connect to the database
const connectToDatabase = async () => {
  try {
    await client.connect();
    console.log(
      `Connected to the ${dbname} database 🌍 \nFull connection string: ${safeURI}`
    );
  } catch (err) {
    console.error(`Error connecting to the database: ${err}`);
  }
}
```

 ## Insert
- Insert a single document
``` javascript
const document = {name: "John Doe", age: 42, status: "A"};
const insertOne = async (document) => {
  try {
    const result = await collectionName.insertOne(document);
    console.log(`Inserted document with _id: ${result.insertedId}`);
  } catch (err) {
    console.error(`Error occurred while inserting document: ${err}`);
  }
};
```
- Insert multiple documents
``` javascript
const documents = [
  { name: "John Doe", age: 42, status: "A" },
  { name: "Jane Doe", age: 36, status: "D" },
];
const insertMany = async (documents) => {
  try {
    const result = await collectionName.insertMany(documents);
    console.log(`${result.insertedCount} documents were inserted`);
  } catch (err) {
    console.error(`Error occurred while inserting documents: ${err}`);
  }
};
```
## Find
- Find a single document
``` javascript
const documentsToFind = { balance: { $gt: 4700 } }
const findOne = async (documentsToFind) => {
  try {
    const result = await collectionName.findOne(documentsToFind);
    console.log(`Found a listing in the collection with the name '${result.name}'`);
  } catch (err) {
    console.error(`Error occurred while finding document: ${err}`);
  }
};
```
- Find multiple documents
``` javascript
const documentsToFind = { balance: { $gt: 4700 } }
const findMany = async (documentsToFind) => {
  try {
    const cursor = await collectionName.find(documentsToFind);
    const results = await cursor.toArray();
    console.log(`Found ${results.length} documents`);
  } catch (err) {
    console.error(`Error occurred while finding documents: ${err}`);
  }
};
```
## Update
- Update a single/many document(s)
``` javascript
const filter = { name: "John Doe" };
const updateDoc = {
  $set: {
    status: "D",
  },
};
const updateOne = async (filter, updateDoc) => {
  try {
    const result = await collectionName.updateOne(filter, updateDoc); //update one
    const result = await collectionName.updateMany(filter, updateDoc); // update many
    console.log(`${result.matchedCount} document(s) matched the filter, updated ${result.modifiedCount} document(s)`);
  } catch (err) {
    console.error(`Error occurred while updating document: ${err}`);
  }
};
```
## Delete
- Delete a single/many document(s)
``` javascript
const filter = { name: "John Doe" };
const delete = async ( filter) => {
  try {
    const result = await collectionName.deleteOne(filter); //delete one
    const result = await collectionName.deleteMany(filter);  //delete many
    console.log(`${result.deletedCount} document(s) was/were deleted`);
  } catch (err) {
    console.error(`Error occurred while deleting document: ${err}`);
  }
}
```

## multi document transactions
- Transactions are used to make sure that all the operations succeed or fail as a whole.
- By default, all operations inside a transaction are applied atomically, meaning that either all succeed or all fail.
- multi document Transactions have a time limit of 60 seconds.
```javascript

const { MongoClient } = require("mongodb");
require("dotenv").config();

const uri = process.env.MONGODB_URI;
const client = new MongoClient(uri);

// Collections
const accounts = client.db("bank").collection("accounts");
const transfers = client.db("bank").collection("transfers");

// Account information
let account_id_sender = "MDB574189300";
let account_id_receiver = "MDB343652528";
let transaction_amount = 100;

// Start the client session
const session = client.startSession();

// Use withTransaction to start a transaction, execute the callback, and commit the transaction
// The callback for withTransaction must be async/await
// Note: Each individual operation must be awaited and have the session passed in as an argument
const main = async () => {
  try {
    const transactionResults = await session.withTransaction(async () => {
      // TODO Step 1: Update the sender balance and pass along the `session` object
      const updateSenderResults = await accounts.updateOne(
        { account_id:account_id_sender },
        { $inc : { balance : -transaction_amount } },
        {session}
        )
        console.log(
        `${updateSenderResults.matchedCount} document(s) matched the filter, updated ${updateSenderResults.modifiedCount} document(s) for the sender account.`
      );
      // Step 2: Update the account receiver balance
      const updateReceiverResults = await accounts.updateOne(
        { account_id: account_id_receiver },
        { $inc: { balance: transaction_amount } },
        { session }
      );
      console.log(
        `${updateReceiverResults.matchedCount} document(s) matched the filter, updated ${updateReceiverResults.modifiedCount} document(s) for the receiver account.`
      );

      // Step 3: Insert the transfer document
      const transfer = {
        transfer_id: "TR21872187",
        amount: 100,
        from_account: account_id_sender,
        to_account: account_id_receiver,
      };

      const insertTransferResults = await transfers.insertOne(transfer, {
        session,
      });
      console.log(
        `Successfully inserted ${insertTransferResults.insertedId} into the transfers collection`
      );

      // Step 4: Update the transfers_complete field for the sender account
      const updateSenderTransferResults = await accounts.updateOne(
        { account_id: account_id_sender },
        { $push: { transfers_complete: transfer.transfer_id } },
        { session }
      );
      console.log(
        `${updateSenderTransferResults.matchedCount} document(s) matched in the transfers collection, updated ${updateSenderTransferResults.modifiedCount} document(s) for the sender account.`
      );
      // Step 5: Update the transfers_complete field for the receiver account
      const updateReceiverTransferResults = await accounts.updateOne(
        { account_id: account_id_receiver },
        { $push: { transfers_complete: transfer.transfer_id } },
        { session }
      );
      console.log(
        `${updateReceiverTransferResults.matchedCount} document(s) matched in the transfers collection, updated ${updateReceiverTransferResults.modifiedCount} document(s) for the receiver account.`
      );
    });

    console.log("Committing transaction ...");
    // If the callback for withTransaction returns successfully without throwing an error, the transaction will be committed
    if (transactionResults) {
      console.log("The reservation was successfully created.");
    } else {
      console.log("The transaction was intentionally aborted.");
    }
  } catch (err) {
    console.error(`Transaction aborted: ${err}`);
    process.exit(1);
  } finally {
    await session.endSession();
    await client.close();
  }
};

main();

```