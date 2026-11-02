#!/usr/bin/env bash
# Builds orchestra2doc from the fern-demo/fix-orchestra fork and regenerates fern/fix from an Orchestra file.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
REPO="${ORCHESTRA2DOC_REPO:-https://github.com/fern-demo/fix-orchestra.git}"
BRANCH="${ORCHESTRA2DOC_BRANCH:-devin/1793657679-fern-mdx-output}"
WORK="${ROOT}/.build/fix-orchestra"
SPEC="${1:-${WORK}/repository-util/src/test/resources/OrchestraFIXLatest.xml}"

rm -rf "${WORK}" && git clone --depth 1 --branch "${BRANCH}" "${REPO}" "${WORK}"
(cd "${WORK}" && mvn -q -B -DskipTests install && cd orchestra2doc && mvn -q -B -DskipTests package)

rm -rf "${ROOT}/fern/fix"
java -cp "${WORK}"/orchestra2doc/target/orchestra2doc-*-jar-with-dependencies.jar \
  io.fixprotocol.orchestra.docgen.FernDocGenerator "${SPEC}" "${ROOT}/fern/fix" --base-path /fix
echo "Generated $(find "${ROOT}/fern/fix" -name '*.mdx' | wc -l) pages into fern/fix"
