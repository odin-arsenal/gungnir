<div class="page-header">

<span class="role-heading">

**Struct**

</span>

<span class="page-title">

# ``Habitat``

</span>

<span class="page-description">

The habitat where sloths live.


Sloths love hanging out in rain forests, and are especially grateful for hot and humid habitats.

They spend much of their time asleep, so make sure the habitats you create provide comfortable and reliable branches in a large number of trees for them to feel safe and protected.

The warmth and humidity of the habitat affect how much a sloth's ``Sloth/energy_level`` increases when they sleep:

```odin

lovely_habitat := Habitat{is_humid = true, is_warm = true}

cold_dry_habitat := Habitat{is_humid = false, is_warm = false}

sloth_sleep(warm_sloth, lovely_habitat)

sloth_sleep(icy_sloth, cold_dry_habitat, number_of_hours = 22)

```

</span>

</div>

## Declaration

```odin
Habitat :: struct
```

---
## Values

### is_humid

An indicator of whether the habitat is humid.

#### Declaration

```odin
is_humid: bool
```

### is_warm

An indicator of whether the habitat is warm.

#### Declaration

```odin
is_warm: bool
```

--- 
## See Also

- [habitat](habitat.md)
- [habitat_comfort_level/1](habitat_comfort_level-db724c769.md)
- [init_habitat/2](init_habitat-2cc9bae26.md)