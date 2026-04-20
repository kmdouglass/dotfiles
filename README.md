# .dotfiles

## Directions

- Clone this repository.
- Make symbolic links to its files:

```console
./make_symlinks.sh
```

### Optional

- Add the following to `~/.bashrc`:

```sh
# Local configuration
if [ -f ~/.bash_local ]; then
    . ~/.bash_local
fi
```

- Add machine-specific configuration to `.bash_local`

## Updates

- Update [make_symlinks.sh](make_symlinks.sh) when a file is added or removed.

## Deployments

To deploy a configuration onto a server, first create a secrets file in `.private/<SERVER_NAME>.secrets`. Then run:

```console
./scripts/deploy_<SERVER_NAME>.sh
```
