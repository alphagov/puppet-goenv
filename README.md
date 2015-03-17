# goenv

Manage a single system installation of goenv and Go versions.

Provides a `goenv::version` defined type that wraps the `goenv install` command
to install a specific Go version.

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

Set the default Go version:
```
class { goenv:
  global_version => '1.2.2',
}
```

## License

See [LICENSE](LICENSE) file.
