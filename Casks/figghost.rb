cask "figghost" do
  version "0.8.0"
  sha256 "31b894ce5e0d6cfc970f3594d2931e7fd7a8e2bb2b6f094ac50ee4bbc0acfe51"

  url "https://github.com/eliasbui/figghost/releases/download/v#{version}/Figghost-#{version}.zip"
  name "Figghost"
  desc "Clipboard history, notch panel, smooth scrolling and per-app sound"
  homepage "https://github.com/eliasbui/figghost"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Figghost.app"

  # Signed ad hoc and not notarized: without this Gatekeeper refuses to open it.
  postflight_steps do
    if_path_exists "{{appdir}}/Figghost.app" do
      run "/usr/bin/xattr",
          args: ["-dr", "com.apple.quarantine", "{{appdir}}/Figghost.app"]
    end
  end

  uninstall quit: "vn.figghost.app"

  zap trash: "~/Library/Application Support/Figghost"
end
