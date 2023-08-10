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

