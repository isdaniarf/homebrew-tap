cask "kafkamitter" do
  version "0.1.1"
  sha256 "1820de174eeaaf4a1c901bdfc6ee36da2a4dc53a4cc1173e94923c66ff430067"

  url "https://github.com/isdaniarf/homebrew-tap/releases/download/v#{version}/Kafkamitter-#{version}-arm64.zip"
  name "Kafkamitter"
  desc "Native Kafka GUI client for macOS"
  homepage "https://github.com/isdaniarf/homebrew-tap"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Kafkamitter.app"

  # The app carries an ad-hoc signature and is not notarized, so Gatekeeper
  # blocks it while the download flag is present. Homebrew 6 removed the
  # `--no-quarantine` option, so the cask clears the flag here.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "/Applications/Kafkamitter.app"]
  end

  zap trash: [
    "~/Library/Application Support/kafkamitter",
    "~/Library/Saved Application State/dev.fithrantyo.kafkamitter.savedState",
  ]
end
