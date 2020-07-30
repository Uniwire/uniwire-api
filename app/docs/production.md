# Production

We use [Heroku](https://www.heroku.com/) to host our production environment. To
deploy the application, you will need, first of all, access to our Heroku
account.

Once you have it, add the remote repository to your git:

```bash
heroku git:remote -a uniwire-api
```

To deploy the code, merge it in the `master` branch. The deploy will happen
automatically.

The URL of the project is https://uniwire.herokuapp.com
