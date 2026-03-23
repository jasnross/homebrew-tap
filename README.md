# homebrew-tap

Shared Homebrew tap for `jasnross` CLI tools.

## Install

```sh
brew tap jasnross/tap
brew install agentspec
```

## Update Formulae

Each formula in `Formula/` is owned independently and should be updated per
release of its source repository.

### Automation Contract

- `jasnross/agentspec` release workflow opens or updates a tap PR for each
  `vX.Y.Z` release using release `SHA256SUMS`.
- Tap repository CI (`brew audit` + `brew test`) is the merge gate for that PR.
- CODEOWNERS approval is required before merge.

For `Formula/agentspec.rb`, use this checklist on every `agentspec` release:

1. Confirm the source release tag follows `vX.Y.Z` and assets are published.
2. Update `version` in `Formula/agentspec.rb`.
3. Update all platform-specific URLs and SHA256 values from the release
   `SHA256SUMS` file.
4. Run `brew audit --strict Formula/agentspec.rb`.
5. Run `brew test agentspec` after installing from the tap.
6. Merge only after required CODEOWNERS approval.

### Manual Fallback

If source-repo automation cannot open/update the tap PR (for example token or
permissions issues):

1. Create a branch in `jasnross/homebrew-tap`.
2. Update `Formula/agentspec.rb` version and SHA256 values from source release
   `SHA256SUMS`.
3. Open a PR with a link to the corresponding source release tag.
4. Wait for tap CI and CODEOWNERS approval, then merge.

## Governance

- One formula per tool under `Formula/`.
- Keep source-repo release PR/tag and tap formula updates coupled.
- Require tap CI (`brew audit` and `brew test`) before merging updates.
