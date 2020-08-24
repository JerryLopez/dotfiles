HYGEN_DIR="$(pwd)/hygen"
CODE_DIR="/Volumes/CaseSensitive/Code"

if [ ! -f "$CODE_DIR/.hygen.js" ]; then
    ln -s "$HYGEN_DIR/hygen.js.symlink" "$CODE_DIR/.hygen.js"
fi
