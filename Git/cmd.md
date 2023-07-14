
#### initialize a project folder to be tracked by git
``` sh
git init 
```
#### add files to be tracked by git 
``` sh
git add file1 file2  # adds files to the staging area
git add . # add all edited files to the staging area
```


#### commit with a specific date
```sh
GIT_AUTHOR_DATE=$(date -d 'date') GIT_COMMITTER_DATE="date" git commit -md "message"


```
#### change a commits date
```sh
$date_timestamp="in a date format"  # example format: Fri Jul 14 04:12:13 2023 -0500
GIT_COMMITTER_DATE="$date_timestamp" GIT_AUTHOR_DATE="$date_timestamp" git commit --amend --no-edit --date "$date_timestamp"
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