# Homebrew tap for Figghost

[Figghost](https://github.com/eliasbui/figghost) is an all-in-one macOS menu bar app: clipboard history with a pixel mascot, a notch panel, smooth scrolling and per-app sound. It needs an Apple silicon Mac with macOS 13 or later.

    brew tap eliasbui/figghost
    brew trust --tap eliasbui/figghost
    brew install --cask figghost

Homebrew asks you to trust a tap that is not its own before it loads it. The app is signed ad hoc and not notarized, so the cask removes the quarantine flag after it installs it. `brew uninstall --cask figghost` removes the app, and `--zap` its data too.
