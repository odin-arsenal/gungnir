/*
Abstract:
The model type for the foods sloths eat.
*/
package Sloth

/// Food that a sloth can consume.
///
/// Sloths love to eat the leaves and twigs they find in the rainforest canopy as they
/// slowly move around. To feed them these items, you can use the ``Twig``,
/// ``Regular_Leaf`` and ``Large_Leaf`` default foods.
///
/// ```odin
/// Sloth.sloth_eat(sloth, Sloth.SlothFoodEnum.Large_Leaf)
/// ```
///
/// You can also define your own custom sloth food by providing a name and the
/// energy level. When the sloth eats your custom food, their energy level increases
/// by the ``energy`` of the food:
///
/// ```odin
/// flower := Food{name = "Flower Bud", energy = 10}
/// Sloth.sloth_eat(sloth, flower)
/// ```
Food :: struct {
    /// The name of the food.
    name: string,
    
    /// The amount of energy the food contains.
    ///
    /// When sloths metabolize the food they eat, their ``Sloth/energy_level``
    /// increases by the amount of energy the food contains.
    energy: int
}


/// Default Sloth Food Enum.
SlothFoodEnum :: enum {
    /// A spindly stick.
    Twig,
    /// A regular-sized leaf.
    Regular_Leaf,
    /// A large leaf.
    Large_Leaf,
}

/// Default Sloth Food Struct.
/// ```odin
/// food := SlothFood[.Twig]
/// ```
@(rodata)
SlothFood := [SlothFoodEnum]Food {
    /// A spindly stick.
    .Twig = Food{name = "Twig", energy = 1},
    /// A regular-sized leaf.
    .Regular_Leaf = Food{name = "Regular Leaf", energy = 2},
    /// A large leaf.
    .Large_Leaf = Food{name = "Large Leaf", energy = 5},
}

/// Creates food with the specified name and energy level.
/// - Parameters:
///   - name: The name of the food.
///   - energy: The amount of energy the food contains.
init_food :: proc(name: string, energy: int) -> Food {
    return Food{name = name, energy = energy}
}