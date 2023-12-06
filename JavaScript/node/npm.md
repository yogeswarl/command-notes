# NPM commands and references

`npm init -y`  create a node project with default settings in the package.json file.

# NPM? What's it.
Node Package Manager makes it easy to start any project by installing the required packages with a simple command `npm i` (or) `npm install` that fetches all packages mentioned in the dependency and dev dependencies. 
The next step is to simply say `npm start`. This command will run the project. 
## fetching a semantic version an example
``` json
{
  "express":"1.2.3", // fetches the exact package version
  "express":"~1.2.3", // fetches the recent patch version (1.2.x)
  "express":"^1.2.3", // fetches the recent minor version (1.x.x)
  "express":"*", // fetches the latest version available
}
```

## Basic structure of package.json
``` json 
{
  "name": "npmProject",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "start":"node index.js" //specify a main entry point to allow any developer to run your project
  },
  "keywords": [],
  "author": "yogi",
  "license": "ISC"
}
```

## NPM commands

Major NPM Commands that are used:
- `npm audit`  provides a list of vulnerable packages. To fix simply add `--fix` to the command and to get a json or readable format add `--json` or `--readable`. You could also do a mock run of the fixes by adding `--dry-run`

- `npm dedup` can reorganize packages to reduce disk space and `npm prune` will remove packages that are no longer being used. 

- `npm search package_name` to search a package

- `npm update` update packages. `-g` will update global packages


## Publishing a NPM package

- login to npm using `npm login`
- `npm publish` to publish the package, if a package name is already published, use scope to publish with your name.
 - `npm unpublish` to remove the package from npm repository.(often advised not to do this)
 - `npm deprecate` to deprecate a package.