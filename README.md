# FIX Orchestra → Fern docs demo

A Fern docs site whose FIX reference (`fern/fix/`) is generated from a FIX Orchestra file by `FernDocGenerator` on the [`devin/1793657679-fern-mdx-output`](https://github.com/fern-demo/fix-orchestra/tree/devin/1793657679-fern-mdx-output) branch of `fern-demo/fix-orchestra` (fork of `FIXTradingCommunity/fix-orchestra`, module `orchestra2doc`).

```bash
./scripts/generate.sh [path/to/orchestra.xml]   # rebuilds fern/fix (needs Java 11 + Maven)
cd fern && fern generate --docs --preview
```

Defaults to the FIX Latest sample Orchestra file from the fork. Hand-written pages live in `fern/guides/`.
