# goenv

Manage a single system installation of goenv and Go versions.

This uses system packages for *everything*.  It will never download builds from
http://golang.org. This ensures that every install is consistent on every server.

Examples of these packages can be seen at:

- https://github.com/alphagov/packager
- https://launchpad.net/~gds/+archive/govuk/+packages?field.name_filter=goenv

## Example usage

Include:
```
include goenv
```

Setup a version of Go:
```
goenv::version { '1.2.2':
}
```

## License

See [LICENSE](LICENSE) file.
