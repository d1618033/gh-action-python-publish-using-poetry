# gh-action-python-publish-using-poetry
Github action which versions, builds and publishes python packages that use poetry 

Usage
-----

1. Go to settings/secrets and add two secrets: PYPI_USERNAME and PYPI_PASSWORD
1. Add a workflow:  
    ```yaml
    name: Upload Python Package
    
    on:
      release:
        types: [created]
    
    jobs:
      deploy:
        runs-on: ubuntu-latest
        steps:
        - uses: actions/checkout@v2
        - name: Set up Python
          uses: actions/setup-python@v1
          with:
            python-version: '3.x'
        - name: Build and publish
          uses: d1618033/gh-action-python-publish-using-poetry@master
          with:
            pypi_username: ${{ secrets.PYPI_USERNAME }}
            pypi_password: ${{ secrets.PYPI_PASSWORD }}
    ```
1. Go to Code/releases and draft a new release.
    1. The tag version will become the python package version.

If there are additional arguments you want to pass to the `build` or `upload` commands simply add:

        - name: Build and publish
          uses: d1618033/gh-action-python-publish-using-poetry@master
          with:
            pypi_username: ${{ secrets.PYPI_USERNAME }}
            pypi_password: ${{ secrets.PYPI_PASSWORD }}
            poetry_build_args: '-f sdist'
            twine_upload_args: '-r myrepo'
