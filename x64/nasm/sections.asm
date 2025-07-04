;| Flag       | Description                                                             |
;| ---------- | ----------------------------------------------------------------------- |
;| `alloc`    | Section should be loaded into memory (used for code/data sections)      |
;| `exec`     | Section contains executable instructions                                |
;| `write`    | Section is writable                                                     |
;| `nowrite`  | Section is not writable (implied if not marked `write`)                 |
;| `readonly` | Alias for `nowrite`                                                     |
;| `nobits`   | Section occupies no space in the file (like `.bss`)                     |
;| `progbits` | Section occupies space in the file (default for `.text`, `.data`, etc.) |
;| `tls`      | Section contains thread-local storage                                   |
;| `note`     | Section contains note information (e.g., `.note.GNU-stack`)             |


section .special write exec nobits
    extern _start
    _start: resb 255

