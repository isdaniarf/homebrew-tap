# isdaniarf/homebrew-tap

A Homebrew tap for my macOS applications.

## Kafkamitter

Kafkamitter is a native Kafka client for macOS. It browses topics, consumes and produces messages, and reads consumer group offsets.

```sh
brew tap isdaniarf/tap
brew install --cask --no-quarantine kafkamitter
```

The `--no-quarantine` flag is necessary. The app carries an ad-hoc signature and is not notarized, so macOS blocks it without that flag.

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
