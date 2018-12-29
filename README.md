# Civil service jargon

An unofficial repository of civil service jargon.

## API

### Lookup an acronym

Use `https://matmoore.github.io/jargon/{ACRONYM}/`

For example: `curl https://matmoore.github.io/jargon/CO/`

```json
{
  "CO": [
    {
      "definition": "Cabinet Office",
      "uri": "government-organisation:D2"
    },
    {
      "definition": "clerical officer"
    }
  ],
  "_links": [
    {
      "name": "government-organisation",
      "href": "https://government-organisation.register.gov.uk/records/{rel}",
      "templated": true
    }
  ]
}
```

### Get all the acronyms

`curl https://matmoore.github.io/jargon/`

(the structure of this response may change without notice)

## CSV Data
See the [data directory](./data) for more details about the data returned by the API. You can also download the data in CSV format.

## Contributing
See [CONTRIBUTING.md](CONTRIBUTING.md)

## Previewing the API locally
First run `bundle exec rake build` from the root of the project, then navigate to the `build` directory.

You can preview the JSON in the browser by running `python -m http.server 8080` and browsing to `localhost:8080` (this requires python 3 to be installed).

The files are generated as `index.json` but github pages serves them as the root for that path. See [Making a JSON API with Github Pages](https://paulsalaets.com/posts/json-api-with-github-pages).

If you want to see what it looks like on github pages, you can fork the repo and run `bundle exec rake publish` to update the `gh-pages` branch.

## License
All code is licenced under the [MIT license](LICENSE).