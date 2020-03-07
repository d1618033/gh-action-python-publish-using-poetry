#!/bin/bash

poetry build
TWINE_USERNAME="$1" TWINE_PASSWORD="$2" twine upload dist/*
