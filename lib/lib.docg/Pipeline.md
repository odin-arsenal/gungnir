# Pipeline

This is the _Pipeline_ followed by _Gungnir_ to create the final _Markdown_ output.

## Step 0: Read Document AST

By using the built in [_Odin_ parser](https://github.com/odin-lang/Odin/blob/master/core/odin/ast/ast.odin), create an _AST Tree_ that can be walked and generate the final structure that holds all the information needed to write the _Markdown_ file.