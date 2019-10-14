#!/usr/bin/env sh

set -e

read -p 'Contentful space ID: ' contentful_space_id
read -p 'Contentful environment ID: ' contentful_environment_id
read -p 'Europeana Entity API key: ' entity_api_key
read -p 'Europeana Record API key: ' record_api_key

contentful extension create --space-id ${contentful_space_id} --environment-id ${contentful_environment_id} \
  --descriptor ./disabled-single-line-text/extension.json \
  --srcdoc ./disabled-single-line-text/index.html

contentful extension create --space-id ${contentful_space_id} --environment-id ${contentful_environment_id} \
  --descriptor ./europeana-entity-harvester/extension.json \
  --srcdoc ./europeana-entity-harvester/index.html \
  --installation-parameters '{"apiKey": "'${entity_api_key}'"}'

contentful extension create --space-id ${contentful_space_id} --environment-id ${contentful_environment_id} \
  --descriptor ./europeana-image-harvester/extension.json \
  --srcdoc ./europeana-image-harvester/index.html \
  --installation-parameters '{"apiKey": "'${record_api_key}'"}'

contentful extension create --space-id ${contentful_space_id} --environment-id ${contentful_environment_id} \
  --descriptor ./europeana-record-id/extension.json \
  --srcdoc ./europeana-record-id/index.html \
  --installation-parameters '{"API_KEY": "'${record_api_key}'"}'
