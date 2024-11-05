# Gungnir Command Line

The _Gungnir_ command line accepts many different options. Uses `Odin` style arguments.

## Version Command

It will show version information, as well as the team and github repository. Useful for testing if the command was installed properly

**Command**

```shell
$ gungnir -version
```

**Output**

```text
Gungnir 1.0.0  Copyright (C) Odin's Arsenal, Ninjas.cl
Made with ❤ by Ninjas.cl and friends.
https://github.com/odin-arsenal/gungnir
```

## Single File Output

Since _Gungnir_ requires packages a single file must be treated uniquely.
By default the output will be on the current directory. A param named `-out <path>`
can be used to control where the `file.odin.d` directory is stored.

**Command**
```shell
$ gungnir file.odin -file -out /my/path
```

**Output**

```text
file.odin.d
├── api
│   ├── procedure1.json
│   └── procedure1.md
└── file.odin.md
```

## Package Output

This will take all the files inside a directory and create `*.docg` catalogues directly.

**Command**
```shell

````

**Output**

```text

```
