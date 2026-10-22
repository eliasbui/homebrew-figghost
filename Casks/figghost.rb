cask "figghost" do
  version "1.8.0"
  sha256 "08293f10bec07d44fdc47928715a569db7b85adae76fed0472c43b7d6bfb8d6c"

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
