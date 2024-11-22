/*
Abstract:
A utility type that generates food.
*/
package Sloth_Generators

import "core:math/rand"
import "../Sloth"

/// A procedure that generates food.
///
/// ## Topics
///
/// ### Generating Food
///
/// - ``generate_food/n``
generate_food :: proc{
    generate_food_from_habitat,
    generate_random_food,
}

/// Generates a piece of food in the specified habitat.
generate_food_from_habitat :: proc(habitat: Sloth.Habitat) -> Sloth.Food {
    if habitat.is_humid && habitat.is_warm {
        return Sloth.SlothFood[.Large_Leaf]
    } else if habitat.is_humid || habitat.is_warm {
        return Sloth.SlothFood[.Regular_Leaf]
    }
    return Sloth.SlothFood[.Twig]
}

/// Generates a random piece of food.
generate_random_food :: proc() -> Sloth.Food {
    number := rand.int_max(2)
    if number > 1 {
        return Sloth.SlothFood[.Large_Leaf]
    }

    if number == 1 {
        return Sloth.SlothFood[.Regular_Leaf]
    }

    return Sloth.SlothFood[.Twig]
}

