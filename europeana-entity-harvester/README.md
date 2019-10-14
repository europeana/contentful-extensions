# Europeana entity harvester

Harvests an entity from the
[Europeana Entity API](https://pro.europeana.eu/resources/apis/entity).

## Access

You will need an API key, which may be obtained from
[Europeana Pro](https://pro.europeana.eu/resources/apis/entity#api-key).

## Installation

With the Contentful CLI:
```bash
API_KEY=yourApiKey
contentful extension create --descriptor ./extension.json --srcdoc ./index.html \
  --installation-parameters '{"apiKey": "'${API_KEY}'"}'
```
