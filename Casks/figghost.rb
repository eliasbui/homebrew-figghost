cask "figghost" do
  version "2.1.16"
  sha256 "ea2a4b2abde97a8a9be6e203875b14c6a93816ce2df840317127a9644df3c14a"

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
