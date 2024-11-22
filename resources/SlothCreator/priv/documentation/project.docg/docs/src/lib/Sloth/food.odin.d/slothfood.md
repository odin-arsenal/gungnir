<div class="page-header">

<span class="role-heading">

**Constant**

</span>

<span class="page-title">

# ``SlothFood``

</span>

<span class="page-description">

Default Sloth Food Struct.

```odin
food := SlothFood[.Twig]
```

</span>

</div>

## Declaration

```odin
@(rodata)
SlothFood := [SlothFoodEnum]Food
```

---
## Values

### .Twig

A spindly stick

#### Declaration

```odin
.Twig = Food{name = "Twig", energy = 1}
```

### .Regular_Leaf

A regular-sized leaf.

#### Declaration

```odin
.Regular_Leaf = Food{name = "Regular Leaf", energy = 2},
```

### .Regular_Leaf

A large leaf.

#### Declaration

```odin
.Large_Leaf = Food{name = "Large Leaf", energy = 5},
```

--- 
## See Also

- [food](food.md)
- [init_food/2](init_food-04e4b06c0.md)
- [slothfood](slothfood.md)
- [slothfoodenum](slothfoodenum.md)