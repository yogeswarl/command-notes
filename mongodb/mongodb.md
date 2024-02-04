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
**note:** Use tools such as Data explorer and performance advisor to identify and fix anti-patterns issues.


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


## mongosh and commands
- Mongosh is a the cmd tool to access MongoDB via the terminal/powershell.

### Command List
``` bash 
use DB_Name # database to use
db           # get currently used DB.
show dbs     # show all dbs in the cluster. 
db.runCommand( { listCollections: 1 } ) # Get all the collections and their explanations for the current db

# A DB can be created by simply inserting a collection with an instance into the DB
use myNewDB
db.myNewCollection1.insertOne( { x: 1 } ). 

# create a new collection
db.createCollection(collection_name)

# capped collections 
db.createCollection( collection_name, {
  capped: true, # optional param if specified true,need to specify size
  size: 200
})

# clustered collections
db.runCommand( {
   create: "products",
   clusteredIndex: { "key": { _id: 1 }, "unique": true, "name": "products clustered key" }
})
# Same as the above command
db.createCollection(
   "stocks",
   { clusteredIndex: { "key": { _id: 1 }, "unique": true, "name": "stocks clustered key" } }
)
```


## CRUD Operations
### Insert
- Insert a single/Multiple document(s)
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

### Find
- Find all documents
``` js
const findDocuments = function(db, callback) {
  // Get the documents collection
  const collection = db.collection('documents');
  // Find documents with eq
  collection.find({field: value}) // finds documents irrespective of it being an array or scalar value.
  // Find documents with eq and elemMatch
  collection.find({field: {$elemMatch: {field: value}}}) // finds documents with array field matching the query.
  // Find documents with eq and in
  collection.find({field: {$in: [value1,value2]}})
  // Find documents with eq and nin
  collection.find({field: {$nin: [value1,value2]}}) 
  // Find documents with gt
  collection.find({field: {$gt: value}})
  // Find documents with gte
  collection.find({field: {$gte: value}})
  // Find documents with lt
  collection.find({field: {$lt: value}})
  // Find documents with lte
  collection.find({field: {$lte: value}})
  // Find documents with ne
  collection.find({field: {$ne: value}})
  // Find documents with and
  collection.find({$and: [{field1: value1}, {field2: value2}]})
  // shorthand for and
  collection.find({field1: value1, field2: value2})
  // Find documents with or
  collection.find({$or: [{field1: value1}, {field2: value2}]})
  //Find documents with and together with or
  collection.find({field1:value1,$or:[{field2:{$lt:value}},{field3:/^p/}]}) // /^p/ is pattern matching which finds every field3 with a value starting with "p"
  //Find documents with and together with or (Regex equivalent of pattern matching)
  collection.find({field1:value1,$or:[{field2:{$lt:value}},{field3:{$regex:'^p'}}]}) // /^p/ is pattern matching which finds every field3 with a value starting with "p"
}
```
**Note**: use `$elemMatch` when searching inside nested objects containing arrays of numbers / objects and use `$in` when searching at the top level with a set of array values. 

### Replace
To replace, find and confirm the document to be replaced and then replace it.
- find one document 
``` js
const findDocument = function(db, callback) {
  // Get the documents collection
  const collection = db.collection('documents');
  // Find some documents
  collection.findOne({_id: objectId('5d1e1b3b5c6b2e1f0c6b2e1f')})
}
```
- Replace a document
``` js
const replaceDocument = function(db, callback) {
  // Get the documents collection
  const collection = db.collection('documents');
  // Replace the document with id 5d1e1b3b5c6b2e1f0c6b2e1f
  collections.replaceOne({_id: objectId('5d1e1b3b5c6b2e1f0c6b2e1f')}, {field:value, field2: value2})
}
```

### update
- update a document field with set operator
``` js
const collection = db.collection('documents');
collection.updateOne({field: value},{$set: {field2: value2}})
```
- update a document field with push
``` js
const collection = db.collection('documents');
collections.updateOne({ _id: ObjectId("5e8f8f8f8f8f8f8f8f8f8f8") }, { $push: { field: value } })
```
- update a document field with set and add a new document if not present
``` js
collection.updateOne({field: value},{$set: {field2: value2}},{upsert: true})
```
### find and modify
 - find and modify a document
 ``` js
 const collection = db.collection('documents'); 
 collection.findAndModify({query:{field: value},{update:{$set: {field2: value2}}},new: true})
 ```

 ### updateMany
 - update many documents
 ``` js
  const collection = db.collection('documents');
  collection.updateMany({field: value},{$set: {field2: value2}})  
```
### deleteOne
- delete one document
``` js
const collection = db.collection('documents');
collection.deleteOne({field: value})
``` 
### deleteMany
- delete many documents
``` js
const collection = db.collection('documents');
collection.deleteMany({field: value})
```
### BulkWrite
- Perform multiple CRUD operations at once.
``` js
const collection = db.collection('documents');
collection.bulkWrite(
   [
      { insertOne : document },
      { updateOne : document },
      { updateMany : document },
      { replaceOne : document },
      { deleteOne : document },
      { deleteMany : document }
   ],
   { ordered : false }  // Ordered false will not maintain the order in which the bulkwrite will perform.
)
```

### Sorting and limiting query results

- Sort the results by a field in ascending order
``` js
const collection = db.collection('documents');
collection.find({field: value}).sort({field: 1})  // 1 for ascending order,  -1 for descending order
```
- Limit the number of results
``` js
const collection = db.collection('documents');
collection.find({field: value}).sort({field:-1}).limit(5)
```

### Projection
- Projection is used to select only necessary data from the document. By default **`_id`** field is always included in the result. You can set 0 to exclude the **`_id`** field.
``` js
const collection = db.collection('documents');
collection.find({field: value},{field2: 1, field3: 0}) // 1 for including the field, 0 for excluding the field
collection.find({field: {$gt:value}},{field2: 1, field3: 0}) // adding conditions to your field selection
```

### CountDocuments
- Count the number of documents
``` js
const collection = db.collection('documents');
collection.countDocuments({field: value})
```
- Count the number of documents with a value inside an array
``` js
const collection = db.collection('documents');
collection.countDocuments({field: {$elemMatch: {field: value}}})
```


### aggregate
- aggregate documents using match and group
- `$match` acts like `find` and `$group` acts like `group by` in sql
- Using match reduces the number of documents required to group inturn leading to lesser processing time. 
``` js
const collection = db.collection('documents');
collection.aggregate([{$match: {field: value}},{$group: {_id: "$field", count: {$sum: 1}}},{$sort: {count: -1}}])
```
- `$sort` and `$limit` can be used to sort and limit the results
``` js
const collection = db.collection('documents');
collection.aggregate([{$sort: {count: -1}},{$limit: 5}])
```
- `$project` can be used to project the fields
``` js
const collection = db.collection('documents');
collection.aggregate([{$project: {field: 1, field2: 1}}])
```
- `$set` can be used to add or update a value in a field
``` js
const collection = db.collection('documents');
collection.aggregate([{$set: {field: value}}])
```
- `$count` can be used to count the number of documents
``` js
const collection = db.collection('documents');
collection.aggregate([{$count: "count"}])
```

- `$out` can be used to store the results in a new collection
``` js
const collection = db.collection('documents');
collection.aggregate([{$match:{field:{$gte: value}}},{$out: "newCollection"}])
```

### indexes
- get the number of indexes used
``` js  
const collection = db.collection('documents');
collection.getIndexes()
```
- create a single field index
A single field index is an index on a single field.
A multikey index is an index on an array field.
``` js
const collection = db.collection('documents');
collection.createIndex({field: 1}) // 1 for ascending order, -1 for descending order
collection.createIndex({field: 1},{unique: true}) // create a single field unique index
```
- create a compound index
``` js
const collection = db.collection('documents');
collection.createIndex({field1: 1, field2: -1}) // 1 for ascending order, -1 for descending order
```
- delete an index
``` js
const collection = db.collection('documents');
collectionn.hideIndex('indexName') // better to hide than delete as it is costly to recreate the index
collection.dropIndex('indexName') 
collection.dropIndex(['indexName1', 'indexName2']) // drop multiple indexes
collection.dropIndex({field1: 1, field2: -1}) // delete index by key
collections.deleteIndexes() // delete all indexes except the default index on _id
```