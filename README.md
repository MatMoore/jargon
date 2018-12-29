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
See the [data directory](./data).

## Updating stuff

- Run `bundle exec rake build` to generate the static JSON API.
- Run `bundle exec rake publish` to publish it to github pages