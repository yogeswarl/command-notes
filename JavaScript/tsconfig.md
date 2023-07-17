# typescript configuration file

## tsconfig.json

A sample `tsconfig.json` file with comments for each option:

```json
{
  "compilerOptions": {
    "allowJs": true, // allow javascript files to be compiled
    "checkJs": true, // report errors in .js files
    "target": "es6",  // set target version of compiled js to es6
    "module": "commonjs", // set module type to commonjs
    "lib": ["es6", "dom"], // set lib to es6 and dom
    "sourceMap": true, // generate source map
    "outDir": "./dist", // set output directory
    "strict": true, // enable all strict type checking options
    "noImplicitAny": true, // raise error on expressions and declarations with an implied 'any' type
    "strictNullChecks": true, // enable strict null checks
    "strictFunctionTypes": true, // enable strict checking of function types
    "noImplicitThis": true, // raise error on 'this' expressions with an implied 'any' type
    "alwaysStrict": true, // parse in strict mode and emit "use strict" for each source file
    "noUnusedLocals": true, // raise error on unused locals
    "noUnusedParameters": true, // raise error on unused parameters
    "noImplicitReturns": true, // raise error on functions that do not return a value
    "noFallthroughCasesInSwitch": true, // raise error on switch statements that fall through
    "esModuleInterop": true, // emit additional JavaScript to ease support for importing CommonJS modules
    "experimentalDecorators": true, // enable experimental support for decorators
    "emitDecoratorMetadata": true, // emit design-type metadata for decorated declarations in source files
    "skipLibCheck": true, // skip type checking of declaration files
    "forceConsistentCasingInFileNames": true // ensure that casing is correct in imports
  },
  "include": ["src/**/*"], // folder to choose where to compile from
  "exclude": ["node_modules", "**/*.spec.ts"] // folders to exclude from compilation
}
```