#!/bin/bash

set -e

version=$(git describe --tags)
poetry version "${version}"
poetry build
TWINE_USERNAME="$INPUT_PYPI_USERNAME" TWINE_PASSWORD="$INPUT_PYPI_PASSWORD" twine upload dist/*
