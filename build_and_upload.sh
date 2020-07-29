#!/bin/bash

set -e

version=$(git describe --tags)
poetry version "${version}"
poetry build $INPUT_POETRY_BUILD_ARGS
TWINE_USERNAME="$INPUT_PYPI_USERNAME" TWINE_PASSWORD="$INPUT_PYPI_PASSWORD" twine upload $INPUT_TWINE_UPLOAD_ARGS dist/*
