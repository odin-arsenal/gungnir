<div class="page-header">

<span class="role-heading">

**Procedure**

</span>

<span class="page-title">

# ``sloth_sleep/3``

</span>

<span class="page-description">

Sleep in the specified habitat for a number of hours.

Sloths need to sleep for a large number of hours each day because of their low metabolic
rate. Each time the sloth sleeps, their ``energy_level`` increases every hour by the
habitat's ``Habitat/comfort_level``.

By default, the sloth sleeps for 12 hours:

```odin
sloth_sleep(tired_sloth, lovely_habitat)
```

You can also specify a custom number of hours:

```odin
sloth_sleep(nearly_awake_sloth, lovely_habitat, 3)
```

### Parameters

- habitat: The location for the sloth to sleep.
- number_of_hours: The number of hours for the sloth to sleep. Default 12 hours.

### Returns 

- The sloth's energy level after sleeping.

</span>

</div>

## Declaration

```odin
sloth_sleep :: proc(sloth: Sloth, habitat: Habitat, number_of_hours: int = 12) -> int
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