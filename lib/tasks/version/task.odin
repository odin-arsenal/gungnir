package gungnir_tasks

import "core:fmt"
import g "../../"

version :: proc() {
	fmt.printfln("%s\n%s\n%s", g.COPYRIGHT, g.AUTHORS, g.WEBSITE)
}
