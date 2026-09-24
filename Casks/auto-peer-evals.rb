cask "auto-peer-evals" do
  version "1.0.0"
  sha256 "66cb51e61341ae109d176c1cb717f32465052f7d3d5b7bded40d842934259edf"

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
