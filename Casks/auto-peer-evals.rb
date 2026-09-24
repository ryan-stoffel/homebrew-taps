cask "auto-peer-evals" do
  version "1.0.1"
  sha256 "349b03a6a1598fc5b919fb5c28bb1ef5d0b80393baa9efeca9345d9f4eb84f11"

  url "https://github.com/ryan-stoffel/homebrew-taps/releases/download/auto-peer-evals-v#{version}/AutoPeerEvals.zip"
  name "Auto Peer Evals"
  desc "Listens to class presentations and fills peer evaluation forms"
  homepage "https://github.com/ryan-stoffel/internship-report-peer-evaulations"

  depends_on formula: "whisper-cpp"
  depends_on macos: :tahoe

  app "Auto Peer Evals.app"

  zap trash: [
    "~/Library/Application Support/PeerEval",
    "~/Library/Logs/PeerEval.log",
    "~/Library/Preferences/com.ryanstoffel.autopeerevals.plist",
  ]
end
