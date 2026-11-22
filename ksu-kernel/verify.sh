#!/usr/bin/env bash
TOP=${ANDROID_BUILD_TOP:-$PWD}
DEST=${KSU_DEST:-$TOP/device/google/raviole-kernels/6.1}
STAMP=$DEST/.ksu-kernel-release
[ -f "$STAMP" ] || { echo "[ksu-verify] GAGAL: stamp tidak ada, KSU tidak ter-patch"; exit 1; }
[[ "$(sed -n 1p "$STAMP")" == ksu-* ]] || { echo "[ksu-verify] GAGAL: isi stamp aneh"; exit 1; }
[ "$(sed -n 2p "$STAMP")" = "$(sha256sum "$DEST/boot.img" | cut -d' ' -f1)" ] \
  || { echo "[ksu-verify] GAGAL: boot.img prebuilt tidak sama dengan yang di-patch"; exit 1; }
for img in "$TOP"/out/target/product/*/boot.img; do
  [ -f "$img" ] || continue
  grep -aqi kernelsu "$img" && echo "[ksu-verify] boot.img build ada jejak KernelSU" \
    || echo "[ksu-verify] PERINGATAN: tidak ada jejak KernelSU di $img"
done
echo "[ksu-verify] OK: $(sed -n 1p "$STAMP")"
