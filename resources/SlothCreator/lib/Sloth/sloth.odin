/*
Abstract:
The model type for a sloth.
*/
package Sloth

/// A model representing a sloth.
///
/// Sloths are mammals known for their slowness of movement. They spend most of their lives hanging upside down in trees.
///
/// You can create a sloth using the ``init_sloth/3`` initializer, or
/// create a randomly generated sloth using ``Generators/generate_sloth/1``:
///
/// ```odin
/// habitat := Sloth.init_habitat(is_humid = true, is_warm = true)
///
/// sloth := Generators.generate_sloth(habitat)
/// ```
Sloth :: struct {
    
    /// The name of the sloth.
    name: string,
    
    /// The color of the sloth.
    color: Color,
    
    /// The power of the sloth.
    power: Power,
    
    /// The energy level of the sloth.
    ///
    /// Sloths have a very low metabolic rate, so their energy level is often low as well. It's
    /// important to check their energy level often, and offer them food or opportunities to sleep
    /// before asking them to perform an activity or exercise.
    ///
    /// You can increase the sloth's energy level by asking them to
    /// ``sloth_eat/3`` or ``sloth_sleep/3``.
    energy_level: int,
    
    /// The care schedule of the sloth.
    ///
    /// A care schedule maintains the health and happiness of the sloth.
    schedule: Schedule,
}

/// Creates a sloth with the specified name and color.
///
/// - Parameters:
///   - name: The name of the sloth.
///   - color: The color of the sloth.
///   - power: The power of the sloth.
init_sloth :: proc(name: string, color: Color = .Yellow, power: Power = .None) -> Sloth {
    events := make(map[int]Event)
    defer delete(events)

    events[0] = Event.Breakfast
    events[1] = Event.Lunch
    events[2] = Event.Dinner
    events[3] = Event.Bedtime

    return Sloth{name = name, color = color, power = power, energy_level = 10, schedule = init_schedule(events)}
}

/// Eat the provided specialty sloth food.
///
/// Sloths love to eat while they move very slowly through their rainforest habitats. They
/// are especially happy to consume leaves and twigs, which they digest over long periods
/// of time, mostly while they sleep.
///
/// When they eat food, a sloth's ``energy_level`` increases by the food's
/// ``Food/energy``. You can feed a sloth any custom ``Food`` that you define
/// yourself, or you can feed them one of the standard foods of ``Food/Twig``,
/// ``Food/Large_Leaf``, or ``Food/Regular_Leaf``:
///
/// ```odin
/// sloth_eat(sleepy_sloth, .Twig)
///
/// flower := Food{name = "Flower Bud", energy = 10}
/// sloth_eat(super_sloth, flower)
/// ```
///
/// By default, the sloth eats one of the food items you provide, but you can also specify
/// how many of the items the sloth should eat if you have an abundance to share with them:
///
/// ```odin
/// twig := SlothFoodEnum[.Twig]
/// sloth_eat(twig_happy_slot, twig, 10)
/// ```
///
/// - Parameters:
///   - food: The food for the sloth to eat.
///   - quantity: The quantity of the food for the sloth to eat.
/// - Returns: The sloth's energy level after eating.
sloth_eat :: proc {
    sloth_eat_food,
    sloth_eat_default_food,
}

/// Sloth eat with a food struct param
sloth_eat_food :: proc(sloth : Sloth, food: Food, quantity: int = 1) -> int {
    return sloth.energy_level + food.energy * quantity
}

/// Sloth eat with a food enum param
sloth_eat_default_food :: proc(sloth: Sloth, food : SlothFoodEnum, quantity: int = 1) -> int {
    yum := SlothFood[food]
    return sloth_eat_food(sloth, yum, quantity)
}

/// Sleep in the specified habitat for a number of hours.
///
/// Sloths need to sleep for a large number of hours each day because of their low metabolic
/// rate. Each time the sloth sleeps, their ``energy_level`` increases every hour by the
/// habitat's ``Habitat/comfort_level``.
///
/// By default, the sloth sleeps for 12 hours:
///
/// ```odin
/// sloth_sleep(tired_sloth, lovely_habitat)
/// ```
///
/// You can also specify a custom number of hours:
///
/// ```odin
/// sloth_sleep(nearly_awake_sloth, lovely_habitat, 3)
/// ```
///
/// - Parameters:
///   - habitat: The location for the sloth to sleep.
///   - number_of_hours: The number of hours for the sloth to sleep. Default 12 hours.
/// - Returns: The sloth's energy level after sleeping.
sloth_sleep :: proc(sloth: Sloth, habitat: Habitat, number_of_hours: int = 12) -> int {
    return sloth.energy_level + habitat_comfort_level(habitat) * number_of_hours
}

/// A type that declares an activity a Sloth can perform.
/// Performs the work or sequence of actions for an activity.
///
/// - parameter sloth: The sloth performing the activity.
/// - returns: The speed at which the sloth performs the activity.
sloth_perform :: proc(sloth: Sloth) -> Speed {

    if sloth.power == Power.Lightning {
        return Speed.Supersonic
    }

    if sloth.power == Power.Fire {
        return Speed.Fast
    }

    if sloth.power == Power.Ice {
        return Speed.Medium
    }

    return Speed.Slow
}
