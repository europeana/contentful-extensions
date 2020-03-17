# Europeana item harvester ID

Harvests metadata from the
[Europeana Record API](https://pro.europeana.eu/resources/apis/record).

## Access

You will need an API key, which may be obtained from
[Europeana Pro](https://pro.europeana.eu/resources/apis/intro#registration).

## Installation

With the Contentful CLI:
```bash
API_KEY=yourApiKey
contentful extension create --descriptor ./extension.json --srcdoc ./index.html \
  --installation-parameters '{"apiKey": "'${API_KEY}'"}'
```
