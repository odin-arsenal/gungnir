<div class="page-header">

<span class="role-heading">

**Procedure**

</span>

<span class="page-title">

# ``sloth_eat/3``

</span>

<span class="page-description">

Eat the provided specialty sloth food.

Sloths love to eat while they move very slowly through their rainforest habitats. They
are especially happy to consume leaves and twigs, which they digest over long periods
of time, mostly while they sleep.

When they eat food, a sloth's ``energy_level`` increases by the food's
``Food/energy``. You can feed a sloth any custom ``Food`` that you define
yourself, or you can feed them one of the standard foods of ``Food/Twig``,
``Food/Large_Leaf``, or ``Food/Regular_Leaf``:

```odin
sloth_eat(sleepy_sloth, .Twig)

flower := Food{name = "Flower Bud", energy = 10}
sloth_eat(super_sloth, flower)
```

By default, the sloth eats one of the food items you provide, but you can also specify
how many of the items the sloth should eat if you have an abundance to share with them:

```odin
twig := SlothFoodEnum[.Twig]
sloth_eat(twig_happy_slot, twig, 10)
```
## Parameters

- name: The name of the sloth.
- color: The color of the sloth.
- power: The power of the sloth.

## Returns

- The sloth's energy level after eating.

</span>

</div>

## Declaration

```odin
sloth_eat :: proc {
    sloth_eat_food,
    sloth_eat_default_food,
}
```
--- 
## See Also

- [sloth](sloth.md)
- [init_sloth/3](init_sloth-d710023bf.md)
- [sloth_eat/3](sloth_eat-3e351e1ca.md)
- [sloth_eat_food/3](sloth_eat_food-949942c18.md)
- [sloth_eat_default_food/3](sloth_eat_default_food-95c5c58aa.md)
- [sloth_perform/1](sloth_perform-c388865f.md)
- [sloth_sleep/3](sloth_sleep-a454e1238.md)