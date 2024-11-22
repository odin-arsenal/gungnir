<div class="page-header">

<span class="role-heading">

**Struct**

</span>

<span class="page-title">

# ``Food``

</span>

<span class="page-description">

Food that a sloth can consume.

Sloths love to eat the leaves and twigs they find in the rainforest canopy as they
slowly move around. To feed them these items, you can use the ``Twig``,
``Regular_Leaf`` and ``Large_Leaf`` default foods.

```odin
Sloth.sloth_eat(sloth, Sloth.SlothFoodEnum.Large_Leaf)
```

You can also define your own custom sloth food by providing a name and the
energy level. When the sloth eats your custom food, their energy level increases
by the ``energy`` of the food:

```odin
flower := Food{name = "Flower Bud", energy = 10}
Sloth.sloth_eat(sloth, flower)
```

</span>

</div>

## Declaration

```odin
Food :: struct
```

---
## Values

### name

The name of the food.

#### Declaration

```odin
name: string
```

### energy

The amount of energy the food contains.

When sloths metabolize the food they eat, their ``Sloth/energy_level``
increases by the amount of energy the food contains.

#### Declaration

```odin
energy: int
```

--- 
## See Also

- [food](food.md)
- [init_food/2](init_food-04e4b06c0.md)
- [slothfood](slothfood.md)
- [slothfoodenum](slothfoodenum.md)