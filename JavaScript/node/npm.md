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
## install a package
`npm i express@1.2.3` to install a specific version of a package
`npm i express@latest` to install the latest version of a package
`npm i -g express` to install a package globally
`npm i -D express` to install a package as a dev dependency

## uninstall a package
`npm uninstall express` to uninstall a package
`npm uninstall -g express` to uninstall a package globally
`npm uninstall -D express` to uninstall a package as a dev dependency

## update a package
`npm update express` to update a package
`npm update -g express` to update a package globally
`npm update -D express` to update a package as a dev dependency

## list all packages
`npm list` to list all packages
`npm list -g` to list all packages globally
`npm list -D` to list all packages as a dev dependency

## list outdated packages
`npm outdated` to list all outdated packages
`npm outdated -g` to list all outdated packages globally
`npm outdated -D` to list all outdated packages as a dev dependency

## list all packages with their dependencies
`npm list --depth=0` to list all packages with their dependencies
`npm list --depth=1` to list all packages with their dependencies upto 1 level
`npm list --depth=2` to list all packages with their dependencies upto 2 level

## list all packages with their dependencies in json format
`npm list --json` to list all packages with their dependencies in json format
`npm list --json --depth=0` to list all packages with their dependencies in json format
`npm list --json --depth=1` to list all packages with their dependencies in json format upto 1 level
`npm list --json --depth=2` to list all packages with their dependencies in json format upto 2 level

## Find available versions of a package and package details
`npm view express versions` to view all available versions of a package
`npm view express` to view package details



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