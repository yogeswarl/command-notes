# Typescript Notes

## What is Typescript?
- Typescript(ts) is a superset of Javascript used to add static typing to Javascript. It is compiled to Javascript and can be used in place of Javascript.
- To use Typescript simple install it with npm `npm install -g typescript`.
- To compile a Typescript file to Javascript run `tsc filename.ts` in the command line. This will create a Javascript file with the same name as the Typescript file. To watch for changes to the Typescript file and recompile when changes are made run `tsc filename.ts -w`.
- To use Typescript, You need to add some configuration in the `tsconfig.json` file.
- To convert an existing Javascript to typescript simply change the file extension from `.js` to `.ts` and add the configuration to the `tsconfig.json` file.
- To use types of third party library install them from npm. For example to use the `Jquery` with Typescript simply install `npm install @types/jquery` and import it in the Typescript file with `import * as $ from 'jquery'`.

Assigning types to a variable:
```ts
let variableName: type = value;
```
Typescript has the following types:
- `number` for numbers
- `string` for strings
- `boolean` for booleans
- `any` for any type
- `number[]` for an array of numbers
- `string[]` for an array of strings
- `boolean[]` for an array of booleans
- `any[]` for an array of any type
- `enum` for a set of named constants
- `void` for a function that does not return anything
- `never` for a function that never returns anything
- `object` for an object
- `object[]` for an array of objects

Example:
```ts
let variableName: type = value;
let num: number = 5;
let str: string = 'string';
let bool: boolean = true;
let anyType: any = 5;
let numArray: number[] = [1, 2, 3];
let strArray: string[] = ['string1', 'string2', 'string3'];
let boolArray: boolean[] = [true, false, true];
```

To create an object with custom type:
```ts
Interface Address {
  street: string;
  city: string;
  state: string;
  zip: number;
}
```
create an object with the Address type
```ts
let address: Address = {
  street: 'street',
  city: 'city',
  state: 'state',
  zip: 12345
}
```

You can add a custom type to another custom type by using the extends keyword


```ts
Interface Contact extends Address{
  name: string;
  phone: number;
  email: string;
  date?: Date;  // optional property 
  clone(): Contact; // adding a function to an interface
}

let contact: Contact = {
  name: 'name',
  phone: 1234567890, //defining a string here will throw a compile time error.
  email: 'email', // note: we can omit date here if we want
  street: 'street', // we can also add the properties of the Address type here
  city: 'city',
  state: 'state',
  zip: 12345
}
```

An interface can be overwritten and it will apply to all the places the interface is used
```ts
// File test.ts
interface Contact {
  name: string;
  phone: number;
  email: string;
}

// File test2.ts
interface Contact {
  address: string;
}
```
The above code will mean, in both files. the interface will have the properties `name, phone, email, and address`.
## Declare
We can also add interfaces globally to be accessible from anywhere. A special keyword `declare` is used to declare a global interface.
```ts
declare global {
  interface Contact {
    address: string;
  }
}
```
The above code will add the property `address` to the `Contact` interface globally. it can be used anywhere in the project.
## Enum

Typescript offers a feature to create a variable that can consist of only a certain set of values. This is done with the `enum` keyword.

**Usage:**
```ts
enum Color {Red, Green, Blue}; // Color is now a type that can only have the values Red, Green, and Blue
let color: Color = Color.Red; // color can only be Red, Green, or Blue
```


## Type
**Type alias** is defined with the `type` keyword followed by a variable name to reference it to a normal type.

**Usage:**
```ts
type Name = string; // Name is now a type that can be used in place of string
```
`Type` alias can be used as a replacement to an `enum`:
``` ts
type Color = 'Red' | 'Green' | 'Blue'; // Color is now a type that can only have the values Red, Green, and Blue
```
Types can also have different interfaces or different types together:
```ts
type ContactBirthDate  = Date | string;
type AddressableContact = Contact & Address;
```

**Difference between `type` and `interface`**:
- types cannot be used with classes, as it can support only primitive types.
- interfaces can be used with classes, as it can support complex types.


### Using types with Functions
**Functions** can also have a type safe mechanism.
**Example:**
```ts
function clone(source: Contact): Contact {
  return object.apply({}, source);
}

const a: Contact = {id: 1, name: 'name', phone: 1234567890, email: 'email'};
const b: Contact = clone(a);
```

Generics are used to define a function that can take any type as an argument and return the same type as the argument.
**Example:**
```ts
function clone<T>(source: T): T {
  return object.apply({}, source);
}

const a: Contact = {id: 1, name: 'name', phone: 1234567890, email: 'email'};
const b: Contact = clone(a);
```
Now if you wanted to mention different types for the argument and return type you can do so by mentioning the type in the function call.
**Example:**
```ts
function clone<T1,T2>(source: T1): T2 {
  return object.apply({}, source);
}

const a: Contact = {id: 1, name: 'name', phone: 1234567890, email: 'email'};
const b: Contact = clone<Contact,Contact>(a);
```

From the above example, Typescript infers the type of the argument and return type from the function call. So we can omit the type in the function call.

## Keyof

`keyof` is used to get the keys that are only available in an object.
**Example:**
```ts
interface Contact {
  id: number;
  name: string;
  phone: number;
  email: string;
}
type ContactField = keyof Contact
function getValue<T,U extends keyof T>(source: T, key: keyof U):  {
  return source[key];
}
const getKeyValue = getValue<Contact, ContactField>(contact, 'name');
```

## typeof
You can use the javascript `typeof` operator to get the type of a variable. But in typescript you can simply use the `typeof` keyword to make sure any variable follows the same type.
```ts
const myNum = {min: 1, max: 5}

function save(source: typeof myNum){
  // do something
}
```
Indexed access types are used to get the type of a property in an object.
```ts
type ContactStatus = 'New' | 'Active' | 'Inactive';
interface Contact {
  id: number;
  name: string;
  status: ContactStatus;
  address: string;
}
interface ContactEvent {
  contactId: contact["id"];
}
interface contactStatusChangedEvent extends ContactEvent {
  OldStatus: contact["status"];
  NewStatus: contact["status"];
}
type ContactField = Contact['name']

function handleEvent<T extends keyof contactEvents>(eventName: T, handler: (evt => contactEvents[T])=> void){
  if event === "statusChanged" {
    handler({contactId: 1, OldStatus: 'New', NewStatus: 'Active'});
  } 
}
```

## Some more typescript features for dynamic type setting:

`Record`: Used to create a type with a set of properties of a certain type.
```ts
type Contact = Record<'id' | 'name' | 'phone' | 'email', string>; // can only contain the properties id, name, phone, and email of type string
```

`Partial`: Used to create a type with all the properties of another type but with all the properties set to optional.
```ts
type Contact = Partial<Contact>; // can contain all the properties of Contact but all the properties are optional
```
`Omit` : Used to create a type with all the properties of another type but with the specified properties omitted.
```ts
type Contact = Omit<Contact, 'id'>; // can contain all the properties of Contact but the id property is omitted
```
`Exclude` : Similar to Omit. 
```ts
type Contact = Exclude<Contact, 'id'>; // can contain all the properties of Contact but the id property is omitted
```
The main difference between `Omit` and `Exclude`: Omit type creates a new type by removing a property from a type. The Exclude type creates a new type by removing a constituent from a union type.

`Pick` : Used to create a type with only the specified properties of another type.
```ts
type Contact = Pick<Contact, 'id' | 'name'>; // can only contain the properties id and name of Contact
```

`Required` : Used to create a type with all the properties of another type but with all the properties set to required.
```ts
type Contact = Required<Contact>; // can contain all the properties of Contact but all the properties are required
```

