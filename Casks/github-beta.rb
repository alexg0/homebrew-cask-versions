cask "github-beta" do
  arch arm: "arm64", intel: "x64"
  platform = on_arch_conditional arm: "darwin-arm64", intel: "darwin"

  version "3.2.1-beta2-96b42f94"
  sha256 arm:   "ac5bf3bf4ed94c5f193006d5b21a19ee96d7a77ac345e0bc470d65a134747b58",
         intel: "85e2c6cec1e323f8246d803241c5686e33af77db47b5a646b109ab25ce6c1d9d"

  url "https://desktop.githubusercontent.com/github-desktop/releases/#{version}/GitHubDesktop-#{arch}.zip",
      verified: "desktop.githubusercontent.com/github-desktop/releases/"
  name "GitHub Desktop"
  desc "Desktop client for GitHub repositories"
  homepage "https://desktop.github.com/"

  livecheck do
    url "https://central.github.com/deployments/desktop/desktop/latest/#{platform}?env=beta"
    regex(%r{(\d+(?:\.\d+)[^/]*)/GitHubDesktop[._-]#{arch}\.zip}i)
    strategy :header_match
  end

  auto_updates true
  conflicts_with cask: "github"

  app "GitHub Desktop.app"
  binary "#{appdir}/GitHub Desktop.app/Contents/Resources/app/static/github.sh", target: "github"

  zap trash: [
        "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.github.GitHubClient.sfl*",
        "~/Library/Application Support/com.github.GitHubClient",
        "~/Library/Application Support/com.github.GitHubClient.ShipIt",
        "~/Library/Application Support/GitHub Desktop",
        "~/Library/Application Support/ShipIt_stderr.log",
        "~/Library/Application Support/ShipIt_stdout.log",
        "~/Library/Caches/com.github.GitHubClient",
        "~/Library/Caches/com.github.GitHubClient.ShipIt",
        "~/Library/Logs/GitHub Desktop",
        "~/Library/Preferences/ByHost/com.github.GitHubClient.ShipIt.*.plist",
        "~/Library/Preferences/com.github.GitHubClient.helper.plist",
        "~/Library/Preferences/com.github.GitHubClient.plist",
      ],
      rmdir: "~/.config/git"
end
