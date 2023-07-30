# MongoDB Brief introduction
- It is a Document based NoSQL database.
- It is a cross-platform, document oriented database that provides, high performance, high availability, and easy scalability.
- MongoDB works on concept of collection and document.
- Collection is a group of MongoDB documents.
- Document is a set of key-value pairs.
- MongoDB stores data in flexible, JSON-like documents, called BSON (Binary JSON) meaning fields can vary from document to document and data structure can be changed over time with support for other dataypes such as time, date which are not available in vanilla JSON.
- The document model maps to the objects in your application code, making data easy to work with.
- Ad hoc queries, indexing, and real time aggregation provide powerful ways to access and analyze your data.
- MongoDB is a distributed database at its core, so high availability, horizontal scaling, and geographic distribution are built in and easy to use.


## Data Modelling
-  The data model is the foundation of a MongoDB application.
-  It is the process of how data is stored in MongoDB and how its relationships are defined.
- Schema is the organization of a data inside a database.
- Using a good data model:
    - Makes it easier to Manage data.
    - makes queries more efficient.
    - Use less memory and cpu.
    - Reduces costs.
- Data that is accessed together should be stored together.
- Different types of modelling:
    - One to one
    - One to many
    - Many to many
- Primary ways to model data in MongoDB:
    - Embedded data model
    - referenced data model

### Embedded data model
- Embedding is the nesting of objects and arrays inside a JSON document.
- It is a natural way to represent relationships between data.
- It is a good choice when:
    - Data is accessed together.
    - One to one and one to many relationships.
    - Data is not shared between documents.
    - Data is not updated frequently.
    - Data is not too large.
**Note:** Large and unbounded documents can impact performance. BSON documents have a size limit of 16MB.
### Referenced data model
- Referencing is the storing of a reference to another document in another collection.
- It is a good choice when:
    - Data is shared between documents.
    - Many to many relationships.
    - Data is updated frequently.
    - Data is too large.
    - you want to avoid data duplication.

### Scaling a data model
 - An effective data modelling will prevent from leading to issues with query and write performances and with too much memory being used.

## Common schema anti-patterns
- Massive arrays
- Massive number of collections
- Bloated documents
- Unnecessary indexes
- queries without indexes
**note:** Use tools such such as Data explorer and performance advisor to identify and fix anti-patterns issues.


## MongoDB URI
- MongoDB URI is a string that defines the connection parameters to MongoDB.
- It is a string in the following format:
    - `mongodb://[username:password@]host1[:port1][/[database][?options]]`
- The URI is composed of the following parts:
    - `mongodb://` is a required prefix to identify that this is a string in the standard connection format.
    - `username:password@` are optional. If specified, the client will attempt to log in to a database after connecting to a database server.
    - `host1` is the only required part of the URI. It identifies a server address to connect to.
    - `:port1` is optional and defaults to :27017 if not provided.
    - `/database` is the name of the database to login to and thus is only relevant if the username:password@ syntax is used. If not specified the "admin" database will be used by default.
    - `?options` are connection options. Note that if database is absent there is still a / required between the last host and the ? introducing the options. Options are name=value pairs and the pairs are separated by "&". For backwards compatibility, ";" is accepted as a separator in addition to "&", but should be considered as deprecated.


## Install MongoDB for nodejs
- Install mongodb driver for nodejs
``` sh
npm install mongodb
```
- Sample Nodejs code to connect to mongodb
``` js
const MongoClient = require('mongodb').MongoClient;
const assert = require('assert');

// Connection URL
const url = 'mongodb://localhost:27017';

// Database Name
const dbName = 'myproject';

// Create a new MongoClient
const client = new MongoClient(url);

// Use connect method to connect to the Server
client.connect(function(err) {
  assert.equal(null, err);
  console.log("Connected successfully to server");

  const db = client.db(dbName);

  client.close();
});
```


## CRUD Operations
### Insert
- Insert a single document
``` js
const insertDocuments = function(db, callback) {
  // Get the documents collection
  const collection = db.collection('documents');
  // Insert One Document
  collection.insertOne({a : 1}, function(err, result) {
    assert.equal(err, null);
    console.log("Inserted 1 document into the collection");
    callback(result);
  });
  // Insert some documents
  collection.insertMany([
    {a : 1}, {a : 2}, {a : 3}
  ], function(err, result) {
    assert.equal(err, null);
    assert.equal(3, result.result.n);
    assert.equal(3, result.ops.length);
    console.log("Inserted 3 documents into the collection");
    callback(result);
  });
}
```
