# homebrew-taps

Homebrew tap for Ryan Stoffel's personal macOS software: Caffeine, Tidy, Forge, Cadence, and Photon.

## Install

```sh
brew tap ryan-stoffel/taps
brew trust ryan-stoffel/taps          # Homebrew 7+
brew install caffeine
brew install tidy
brew install forge
brew install cadence
brew install --cask photon
```

or directly:

```sh
brew install ryan-stoffel/taps/caffeine
brew install ryan-stoffel/taps/tidy
brew install ryan-stoffel/taps/forge
brew install ryan-stoffel/taps/cadence
brew install --cask ryan-stoffel/taps/photon
```

`brew trust` is needed on Homebrew 7 and later before short names (and `brew upgrade`)
can load formulae and casks from a third-party tap; the fully qualified names below work
without it.

If Photon is already installed and Homebrew still references the retired singular tap:

```sh
brew untap ryanstoffel/homebrew-tap   # only if that stale tap is present
brew tap ryan-stoffel/taps
brew trust ryan-stoffel/taps          # Homebrew 7+
brew update
brew upgrade --cask ryan-stoffel/taps/photon
```

Ryan's GitHub account was renamed from `RyanStoffel` to `ryan-stoffel`. GitHub
redirects old repository links, but Homebrew records trust by tap name, so use
the canonical `ryan-stoffel/taps` name in Homebrew commands.

None of these apps are notarized. On first launch, macOS will block them —
go to **System Settings > Privacy & Security**, find the message about the
app, and click **Open Anyway**.

## Apps

| App | Description |
| --- | --- |
| [Caffeine](https://github.com/ryan-stoffel/caffeine) | Menu bar app that keeps your display awake |
| [Tidy](https://github.com/ryan-stoffel/tidy) | Menu bar app that files your Desktop and Downloads by rule |
| [Forge](https://github.com/ryan-stoffel/forge) | Native terminal, editor, Git, and coding-agent workspace |
| Cadence | Menu bar Pomodoro timer with labeled work logging |
| [Photon](https://github.com/ryan-stoffel/photon) | Fast, minimal launcher: apps, clipboard history, notes, file search, keybinds |

This tap replaces the former per-app tap repos (`ryanstoffel/homebrew-tap`,
`ryanstoffel/homebrew-forge`), which are retired in favor of this single repo.
