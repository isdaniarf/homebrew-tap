cask "kafkamitter" do
  version "0.2.2"
  sha256 "98e1d5a90e32556889f68c90f012473f7c0d5e1f07b838601fb72957c7c6c7a9"

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
