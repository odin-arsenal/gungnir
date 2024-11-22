package Sloth_Creator

import "core:fmt"

import "lib/Sloth"
import "lib/Generators"

main :: proc() {
    habitat := Sloth.init_habitat(is_humid = true, is_warm = true)
    sloth := Generators.generate_sloth(habitat)
    sloth.energy_level = Sloth.sloth_eat(sloth, Sloth.SlothFoodEnum.Large_Leaf)

    fmt.printfln("sloth: %s | energy: %d | power: %v ¡ color: %v", sloth.name, sloth.energy_level, sloth.power, sloth.color)
}