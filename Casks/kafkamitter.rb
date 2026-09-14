cask "kafkamitter" do
  version "0.2.1"
  sha256 "9659f85ecf8eeece6c4eedf379607f53731f7ef570e2b990631c87ef1aa60794"

  url "https://github.com/isdaniarf/kafkamitter/releases/download/v#{version}/Kafkamitter-#{version}-arm64.zip"
  name "Kafkamitter"
  desc "Native Kafka GUI client for macOS"
  homepage "https://github.com/isdaniarf/kafkamitter"

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
