# OkinawaCompPhysFoodSurvey2024.jl

みんなで作る WordCloud

このリポジトリは計算物理春の学校 2024 の教材です．

## How to use

- Install Julia

```
$ make build
$ julia --project interactive.jl
$ julia --project formatcheck.jl
$ make test
$ make web
```

## Contribution Guide

Please refer to those [instructions](https://github.com/AtelierArith/OkinawaCompPhysFoodSurvey2024.jl/issues/6)

## 進捗状況

![wc_favorite_food.svg](https://atelierarith.github.io/OkinawaCompPhysFoodSurvey2024.jl/dev/wc_favorite_food.svg)

## トラブルシューティング

### Github usernameが設定されていない

> ERROR: LoadError: Git hosting service username is required, set one with keyword `githubuser="<YourGitHubUserName>"`

が出る場合。以下を設定すると解決します。

> $ git config github.user <your-gh-name>
