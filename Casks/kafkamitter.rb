cask "kafkamitter" do
  version "0.1.0"
  sha256 "8843d7b8a09709bf21bf8798672ec91cb825b45f4bbef6afd76e81bcff626b9e"

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
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Kafkamitter.app"]
  end

  zap trash: [
    "~/Library/Application Support/kafkamitter",
    "~/Library/Saved Application State/dev.fithrantyo.kafkamitter.savedState",
  ]
end
