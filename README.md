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

For `Formula/agentspec.rb`, use this checklist on every `agentspec` release:

1. Confirm the source release tag follows `vX.Y.Z` and assets are published.
2. Update `version` in `Formula/agentspec.rb`.
3. Update all platform-specific URLs and SHA256 values from the release
   `SHA256SUMS` file.
4. Run `brew audit --strict Formula/agentspec.rb`.
5. Run `brew test agentspec` after installing from the tap.
6. Merge only after required CODEOWNERS approval.

## Governance

- One formula per tool under `Formula/`.
- Keep source-repo release PR/tag and tap formula updates coupled.
- Require tap CI (`brew audit` and `brew test`) before merging updates.
