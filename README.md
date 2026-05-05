# Mishkin99/homebrew-tap

Homebrew Tap maintained by [@Mishkin99](https://github.com/Mishkin99).

## Available casks

| Cask | Description | Status |
|------|-------------|--------|
| `lucid` | macOS menu bar utility that blocks all input while you clean your Mac | Pre-release — see note below |

## Install

```sh
brew tap Mishkin99/tap
brew install --cask lucid
```

Or in one shot:

```sh
brew install --cask Mishkin99/tap/lucid
```

## Update

Lucid ships with [Sparkle](https://sparkle-project.org) and updates itself in-app, so you normally do not need to do anything.

To force an update via Homebrew:

```sh
brew upgrade --cask lucid
```

## Uninstall

```sh
brew uninstall --cask lucid           # remove the app only
brew uninstall --cask --zap lucid     # also wipe preferences, caches, app support
```

> Note: `--zap` does **not** remove your license key from the Keychain. Remove it manually from Keychain Access if you want a fully clean state.

## Status

The `lucid` cask in this repository is a **scaffold**. It will become installable once Lucid 1.0 ships and the cask's `version` / `sha256` are filled in by CI. Until then, attempting to `brew install --cask lucid` will fail.

## License

Cask definitions in this repository are released under the [MIT License](LICENSE). Lucid itself is proprietary; see [lucidmac.app](https://lucidmac.app) for terms.
