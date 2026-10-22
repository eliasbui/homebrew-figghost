cask "figghost" do
  version "1.7.0"
  sha256 "4f2588f47d297349de8e768b966abbdfdcb44c88f302ccc48ffc80fac29e1453"

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
