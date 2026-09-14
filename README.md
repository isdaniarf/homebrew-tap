# isdaniarf/homebrew-tap

A Homebrew tap for my macOS applications.

## Kafkamitter

Kafkamitter is a native Kafka client for macOS. It browses topics, consumes and produces messages, and reads consumer group offsets.

```sh
brew tap isdaniarf/tap
brew install --cask kafkamitter
```

The cask clears the macOS quarantine flag after it installs the app. Without that step Gatekeeper would block the app, because it carries an ad-hoc signature and is not notarized.
To update:

```sh
brew update
brew upgrade --cask kafkamitter
```

To remove the app and its settings:

```sh
brew uninstall --zap --cask kafkamitter
```

Kafkamitter needs an Apple Silicon Mac and macOS 13 or later.
