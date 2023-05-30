
#### initialize a project folder to be tracked by git
``` sh
git init 
```
#### add files to be tracked by git 
``` sh
git add file1 file2  # adds files to the staging area
git add . # add all edited files to the staging area
```


#### update a date

```sh
GIT_AUTHOR_DATE=$(date -d 'date') GIT_COMMITTER_DATE="date" git commit -md "message"
```

#### commit changes to git
``` sh
git commit # opens the built in text editor to write a short message about the commit

git commit -m "message" # the -m options allows you to add a message in the command line and do a direct commit
```

#### update a recent commit
```sh
git commit --amend --no-edit # amend without edit
git commit --amend -m "with message"
git commit --amend  # opens a text editor
```