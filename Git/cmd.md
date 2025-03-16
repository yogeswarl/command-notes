
#### Initialize a project folder to be tracked by git
``` sh
git init 
```
#### Config git settings
``` sh
git config --local user.name "name" # change to --global to change the global settings
git config --local user.email "email"
```
#### Add files to be tracked by git 
``` sh
git add file1 file2  # adds files to the staging area
git add . # add all edited files to the staging area
```

#### Commit changes to git
``` sh
git commit # opens the built in text editor to write a short message about the commit
git commit -m "message" # the -m options allows you to add a message in the command line and do a direct commit
```

#### Update a recent commit
``` sh
git commit --amend --no-edit # amend without edit
git commit --amend -m "with message"
git commit --amend  # opens a text editor
```

#### Commit with a specific date
``` sh
GIT_AUTHOR_DATE=$(date -d 'date') GIT_COMMITTER_DATE="date" git commit -md "message"

```
#### Change a commits date
``` sh
$date_timestamp="in a date format"  # example format: Fri Jul 14 04:12:13 2023 -0500
GIT_COMMITTER_DATE="$date_timestamp" GIT_AUTHOR_DATE="$date_timestamp" git commit --amend --no-edit --date "$date_timestamp"
```
#### check the status of the repository
``` sh
git status
```

#### check the log of the repository
``` sh
git log
git log --graph # shows a graph of the commits
```

#### check the difference between the working directory and the staging area
``` sh
git diff
git diff --staged # check the difference between the staging area and the last commit
git diff HEAD # check the difference between the working directory and the last commit
git diff commit1 commit2 # check the difference between two commits
git diff branch1 branch2 # check the difference between two branches
git diff file1 file2 # check the difference between two files
git diff commit1 commit2 file1 file2 # check the difference between two commits of two files
```

#### clone a remote repository
``` sh
git clone remote_url
```
#### add a remote repository
``` sh
git remote add origin remote_url
```
#### Push to a remote repository
``` sh
git push origin main # push to the main branch of the origin remote repository
git push origin --force main #push forcefully
```

#### Pull from a remote repository
``` sh
git pull origin master # pull from the master branch of the origin remote repository
git config pull.rebase false # to enable rebasing - set to true
git config pull.ff only # to enable fast-forwarding - set to true
```

### rebase
- a master branch named `main`
- a development branch named `dev`
- use rebase to bring move all your dev work upfront to the master if they have different times.
- this allows for a fast forward with the master branch
- this should be exectured from the `dev` branch
``` sh

git rebase main

```

