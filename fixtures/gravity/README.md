# Gravity Fixtures

This script records responses from Gravity in production and stores them on disk. It determines the path to query for by
the filename on disk.

For example, to record the data of an artist at the `https://api.artsy.net/api/v1/artist/andy-warhol` URL, you would
perform the following steps:

```sh
$ cd fixtures
$ touch 'gravity/api/v1/artist/andy-warhol.json'
$ yarn run gravity you@example.com your-secret-password
```

Once completed, the touched path will contain the JSON of the artist. Once committed to the repo, it will no longer be
recorded _unless_ you use the `rebuild` option:

```sh
$ yarn run gravity-rebuild you@example.com your-secret-password
```

Some shells might have problems with `?` and `&` used in query parameters, so be sure to quote the path as shown above.

```sh
$ touch 'gravity/api/v1/match?term=ak&fair_id=abu-dhabi-art-2016.json'
```