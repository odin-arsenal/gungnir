/*
Abstract:
The model type for the habitat where sloths live.
*/
package Sloth

/// The habitat where sloths live.
///
/// Sloths love hanging out in rain forests, and are especially grateful for hot and humid habitats.
/// They spend much of their time asleep, so make sure the habitats you create provide
/// comfortable and reliable branches in a large number of trees for them to feel safe and
/// protected.
///
/// The warmth and humidity of the habitat affect how much a sloth's ``Sloth/energy_level``
/// increases when they sleep:
///
/// ```odin
/// lovely_habitat := Habitat{is_humid = true, is_warm = true}
/// cold_dry_habitat := Habitat{is_humid = false, is_warm = false}
///
/// sloth_sleep(warm_sloth, lovely_habitat)
/// sloth_sleep(icy_sloth, cold_dry_habitat, number_of_hours = 22)
/// ```
Habitat :: struct {
    /// An indicator of whether the habitat is humid.
    is_humid: bool,
    
    /// An indicator of whether the habitat is warm.
    is_warm: bool,
}

/// An indicator of how comfortable a sloth might find the habitat.
habitat_comfort_level :: proc(habitat: Habitat) -> int {
    if habitat.is_humid && habitat.is_warm {
        return 10
    } else if habitat.is_humid || habitat.is_warm {
        return 5
    }
    return 1
}

/// Creates a habitat with the specified humidity and temperature.
init_habitat :: proc(is_humid: bool, is_warm: bool) -> Habitat {
    return Habitat{is_humid = is_humid, is_warm = is_warm}
}