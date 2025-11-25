Reproducible example for quarto, see https://github.com/quarto-dev/quarto-cli/issues/13726

Steps to reproduce
1. `quarto preview --to pdf`: Opens book-pdf successfully in browser
2. Edit any file under `/contents` (eg type char `i` into `Future_Work.qmd`)
3. Error should happen (tries to recompile preview open in browser -> fails (not found ...) -> tries again -> ...

## Sidenotes

- replaced most text with random chars bc thesis is still WIP (using `randomize_text.py`)
