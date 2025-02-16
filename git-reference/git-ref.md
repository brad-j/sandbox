## Git Workflow

1. git checkout dev
2. git pull origin dev (ensure dev is up to date)
3. git checkout -b feature/blog-implementation
4. // do your work
5. git push origin feature/blog-implementation
6. // create PR: feature/blog-implementation → dev
7. // after PR is approved, merge into dev
8. // test in dev environment
9. // when ready to deploy
10. // create PR: dev → main
11. // after PR is approved, merge into main
