# About this data

These datasets are non-official and are an attempt to understand how the UK civil service works through its jargon.

They are not expected to be complete, accurate, or up to date. Feel free to suggest improvements by raising an issue or pull request.

## Contents

The data is split into several files:

- [roles](./roles.csv) and [grades](./grades.csv) are ways of describing people
- [organisations](./organisations.csv) and [organisation-types](./organisation-types.csv) are ways of describing groups of people
- [artefacts](./artefacts.csv) and [incantations](./incantations.csv) are things that affect civil servants
- [uncategorised](./uncategorised.csv) is everything else

### Organisations
Organisations include:

- government organisations
- devolved governments
- parliaments and committees
- private companies

Where possible I've tried to match these things to a unique identifier (the `uid` column) to indicate where acronyms basically refer to the same thing. For example `DCLG` and `MHCLG` both point to the URI `government-organisation:D4` because DCLG became MHCLG. `HMSO` points to `company:03049649` because it was a government office that was privatised.

However, it's not always clear cut that one organisation "becomes" another one since functions can be absorbed into other organisations or split up between multiple organisations.

### Organisation types
These terms are labels that can be applied to organisations. For example, `OGD` just means `other government department`.

### Grades
This file just contains the most common grade abbreviations.

Grade structures work differently in different departments. See https://www.instituteforgovernment.org.uk/explainers/grade-structures-civil-service

## Sources
This data is derived from the civil service induction materials and [GOV.UK](https://www.gov.uk/government/organisations/civil-service/about).

All information is licenced under the [Open government licence](http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/).