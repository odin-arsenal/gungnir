/*
Abstract:
A utility type that generates names for sloths.
*/
package Sloth_Generators

/// A type that generates names for sloths.

/// Generates a name for a sloth.
///
/// - parameter seed: A value that influences randomness.
generate_name :: proc(seed: int = 0) -> string {
    names := [?]string {"Slothy", "Slothew", "Slothmas"}
    return names[seed]
}
