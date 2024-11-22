<div class="page-header">

<span class="role-heading">

**Struct**

</span>

<span class="page-title">

# ``Sloth``

</span>

<span class="page-description">

A model representing a sloth.

Sloths are mammals known for their slowness of movement. They spend most of their lives hanging upside down in trees.

You can create a sloth using the ``init_sloth/3`` initializer, or
create a randomly generated sloth using ``Generators/generate_sloth/1``:

```odin
habitat := Sloth.init_habitat(is_humid = true, is_warm = true)

sloth := Generators.generate_sloth(habitat)
```

</span>

</div>

## Declaration

```odin
Sloth :: struct
```

---
## Values

### name

The name of the sloth.

#### Declaration

```odin
name: string
```

### color

The color of the sloth.

#### Declaration

```odin
color: Color
```

### power

The power of the sloth.

#### Declaration

```odin
power: Power
```

### energy_level

The energy level of the sloth.

Sloths have a very low metabolic rate, so their energy level is often low as well. It's
important to check their energy level often, and offer them food or opportunities to sleep
before asking them to perform an activity or exercise.

You can increase the sloth's energy level by asking them to ``sloth_eat/3`` or ``sloth_sleep/3``.

#### Declaration

```odin
energy_level: int
```

### schedule

The care schedule of the sloth.

A care schedule maintains the health and happiness of the sloth.

#### Declaration

```odin
schedule: Schedule
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