# CHANGELOG

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com), adheres to [Semantic Versioning](https://semver.org), and uses [Conventional Commit](https://www.conventionalcommits.org) syntax.

## Unreleased

### :books: Documentation

* [`63df939`](https://github.com/northwood-labs/terraform-provider-corefunc/commit/63df93904c750bae7611fd336b42578123a431c5): Added `CONTRIBUTORS.md` document. ([@skyzyx](https://github.com/skyzyx))
* [`1970cb2`](https://github.com/northwood-labs/terraform-provider-corefunc/commit/1970cb2a5e703d33cad2fdfc0d14512378f360c4): Generate documentation in `README.md.md` ([@github-actions](https://github.com/github-actions))
* [`bb242a1`](https://github.com/northwood-labs/terraform-provider-corefunc/commit/bb242a185180f1c89953066dfde639334b300353): Updated the 'sales pitch' in the `README.md`. ([@skyzyx](https://github.com/skyzyx))
* [`6cceae8`](https://github.com/northwood-labs/terraform-provider-corefunc/commit/6cceae836a24668945bd38ad7f58c7851d8ae0ad): Generate documentation in `README.md.md` ([@github-actions](https://github.com/github-actions))

### :closed_lock_with_key: Security

* [`ccd67df`](https://github.com/northwood-labs/terraform-provider-corefunc/commit/ccd67df6b74cecc3e212320402a49a44d6e5425d): Ignore a vuln in dependency code we don't use. ([@skyzyx](https://github.com/skyzyx))

### :dependabot: Building and Dependencies

* [`6116197`](https://github.com/northwood-labs/terraform-provider-corefunc/commit/61161974c0c42f4966e3082b40b3384073f05196): Bump `trufflesecurity/trufflehog` from 3.70.2 to 3.71.0 ([#1](https://github.com/northwood-labs/mod-aws-resource-tags/issues/1)) ([@dependabot](https://github.com/dependabot))
* [`eb979cf`](https://github.com/northwood-labs/terraform-provider-corefunc/commit/eb979cf09fc02f1f795008e0439dfd6a11b7739d): Bump `actions/dependency-review-action` from 4.1.3 to 4.2.4 ([#2](https://github.com/northwood-labs/mod-aws-resource-tags/issues/2)) ([@dependabot](https://github.com/dependabot))
* [`d02bb14`](https://github.com/northwood-labs/terraform-provider-corefunc/commit/d02bb143774a10c298ed60e81d782bc4b008ed05): Bump `github/codeql-action` from 3.24.8 to 3.24.9 ([#3](https://github.com/northwood-labs/mod-aws-resource-tags/issues/3)) ([@dependabot](https://github.com/dependabot))

### :soap: Linting

* [`f7c0cdc`](https://github.com/northwood-labs/terraform-provider-corefunc/commit/f7c0cdca410fcd6e43fd4f3b66115bb007c9701e): Ran linter against Go code and fixed issues. ([@skyzyx](https://github.com/skyzyx))
* [`0c9c326`](https://github.com/northwood-labs/terraform-provider-corefunc/commit/0c9c3261135bfb94c0a660c390bf74a3f2f26af3): Updated linter configuration files. ([@skyzyx](https://github.com/skyzyx))

### :test_tube: Testing

* [`aa2a0db`](https://github.com/northwood-labs/terraform-provider-corefunc/commit/aa2a0db5665d9044e950789e6459f09dc966cd34): Sync over changes to GitHub Actions workflows. ([@skyzyx](https://github.com/skyzyx))

### <!-- 0 -->:rocket: Features

* [`d2c401d`](https://github.com/northwood-labs/terraform-provider-corefunc/commit/d2c401d4676666fffc35974f490f09e0fb94f10f): Initial commit. ([@skyzyx](https://github.com/skyzyx))

### <!-- 1 -->:bug: Bug Fixes

* [`8b8c9a1`](https://github.com/northwood-labs/terraform-provider-corefunc/commit/8b8c9a127afcc6ff8ac8707ce7f75ea039affc70): Move `go.mod` to root to work better with the Go linter. ([@skyzyx](https://github.com/skyzyx))
* [`aace66c`](https://github.com/northwood-labs/terraform-provider-corefunc/commit/aace66c2aa5ae459ad4f0f35be05da5dea1c67b3): Updated the base Terraform/OpenTofu version to ~> 1.6. ([@skyzyx](https://github.com/skyzyx))

### <!-- ZXX -->:arrows_counterclockwise: Configuration Syncing

* [`24e8dac`](https://github.com/northwood-labs/terraform-provider-corefunc/commit/24e8dac8b2ca76b14d0e11a2645cb63a5f57cd03): Sync shared standardized files. ([@skyzyx](https://github.com/skyzyx))

### <!-- ZZZ -->:gear: Miscellaneous Tasks

* [`b35564c`](https://github.com/northwood-labs/terraform-provider-corefunc/commit/b35564c3ac1d2e1d9d02100e7bb6fde90bf34256): Add the initial GitHub Actions workflows and testing harness. ([@skyzyx](https://github.com/skyzyx))
* [`8ba600d`](https://github.com/northwood-labs/terraform-provider-corefunc/commit/8ba600d2099e1c1bc1a7dfd2f4baf3a211734783): Work out bugs in the testing workflow. ([@skyzyx](https://github.com/skyzyx))
* [`152a50d`](https://github.com/northwood-labs/terraform-provider-corefunc/commit/152a50d8b31478b3cc535f2005f7c28f79623ef7): Tweak some settings for the Go linter. ([@skyzyx](https://github.com/skyzyx))
* [`7130276`](https://github.com/northwood-labs/terraform-provider-corefunc/commit/7130276c26acd2658ab3edcc8c2fda5e1dbd9629): Swapping OSV Detector for OSV Scanner. ([@skyzyx](https://github.com/skyzyx))
* [`ca6faeb`](https://github.com/northwood-labs/terraform-provider-corefunc/commit/ca6faeb9de61d31c53b2f28d30ae09a49c2d78f2): Fixed some issues with running scans in CI. ([@skyzyx](https://github.com/skyzyx))
* [`3ddfcc5`](https://github.com/northwood-labs/terraform-provider-corefunc/commit/3ddfcc5e16f93e3dd92aa7df2f7b517f459b32cf): Add AWS credentials to run tests. ([@skyzyx](https://github.com/skyzyx))
* [`b28843b`](https://github.com/northwood-labs/terraform-provider-corefunc/commit/b28843b74e7559ae4e2635e364cbba9d1b08a386): Add Markdownlint as a CI workflow. ([@skyzyx](https://github.com/skyzyx))

<p>Generated on 2024-03-26.</p>