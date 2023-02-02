#### update a date

```sh
GIT_AUTHOR_DATE=$(date -d 'date') GIT_COMMITTER_DATE="date" git commit -md "message"
```

#### update a recent commit
```sh
git commit --amend --no-edit # amend without edit
git commit --amend -m "with message"
git commit --amend  # opens a text editor
```