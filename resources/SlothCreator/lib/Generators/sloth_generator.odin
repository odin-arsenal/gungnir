/*
Abstract:
A utility type that generates sloths.
*/
package Sloth_Generators

import "core:math/rand"

import "../Sloth"

/// Generates a sloth in the specified habitat.
generate_sloth :: proc(habitat: Sloth.Habitat) -> (sloth: Sloth.Sloth, ok: bool) #optional_ok {
    sloth = Sloth.init_sloth(generate_name(rand.int_max(2)))
    sloth.energy_level = Sloth.sloth_sleep(sloth, habitat)
    return sloth, true
}