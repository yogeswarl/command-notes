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

