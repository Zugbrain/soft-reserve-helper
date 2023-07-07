# soft-reserve-helper
This script condenses a copied Discord soft reserve (SR) thread into an easily readable and searchable format.

#### Note to Raid Leaders:
This script will only work properly if players' SR messages are formatted `name - item` on a single line. Case and spacing are not important, but the single hyphen is. Messages that don't conform to this pattern are fully or partially excluded. Encourage players to type the full item name rather than abbreviations (e.g. `onslaught girdle` instead of `osg`).

## Instructions
Start by cloning or downloading this repository. 

You will need a Unix shell to run the script (`soft-reserve-helper.sh`). The standard macOS terminal should work. 

If you're on Windows, you'll need additional software. Here are a couple options:
- [WSL2](https://learn.microsoft.com/en-us/windows/wsl/install) (Windows Subsystem Linux)
    - Pros: Easy install
    - Cons: Nonexistent GUI
- [Visual Studio Code - Dev Container](https://code.visualstudio.com/docs/devcontainers/containers)
    - Pros: Nice GUI, customizable, powerful
    - Cons: Not as easy to install

When you're ready to run the script, copy+paste the contents of the Discord SR thread (default view - compressed mode doesn't work (yet)) into `discord-thread.txt` and save it. Make sure that you only copy the messages and their titles. `CTRL` + `A` doesn't work - click and drag to select. 

Make sure that your current working directory is `soft-reserve-helper`, then run:
```sh
./soft-reserve-helper.sh
```

This will generate a clean list of SRs in a file called `sr.txt` (located in the same directory). A file with item names first is also generated (`isr.txt`). 

From here, you can copy+paste either file to the Discord thread (this also conveniently negates the need to lock the thread). Make sure to copy the entire file's contents, including the "```" at the beginning and end, so that Discord will recognize it as a code block and preserve spacing.
