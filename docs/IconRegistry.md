# Icon Registry System

Sistema global de gestión de iconos que permite registrar y reutilizar iconos personalizados en toda la aplicación.

## 🎯 Características

- ✅ **Registro Global**: Registra iconos una vez, úsalos en cualquier lugar
- ✅ **Sin Duplicación**: No repitas SVG paths en cada uso
- ✅ **30+ Iconos Predefinidos**: Sistema de iconos listos para usar
- ✅ **Categorización**: Organiza iconos por categorías
- ✅ **Type-Safe**: Definiciones tipadas
- ✅ **Eficiente**: Reutilización óptima de recursos

## 📦 Instalación

El sistema ya está integrado en el componente `Icon`. Solo necesitas:

```mint
/* Conecta al store en tu componente */
connect IconRegistry exposing { register, get, has }
```

## 🚀 Uso Básico

### 1. Usar Iconos Predefinidos

```mint
/* Usa iconos del sistema por nombre */
<Icon name="heart" size="lg" variant="error" />
<Icon name="star" size="md" variant="warning" />
<Icon name="user" size="xl" variant="primary" />
```

### 2. Registrar Iconos Personalizados

```mint
component MyApp {
  connect IconRegistry exposing { register }

  fun componentDidMount : Promise(Void) {
    /* Registra un icono personalizado */
    register(
      "logo",                          /* Nombre único */
      "<circle cx='12' cy='12' r='10'/>...",  /* SVG path */
      "brand"                          /* Categoría */
    )

    Promise.never()
  }

  fun render : Html {
    <Icon name="logo" size="xl" />
  }
}
```

### 3. Registrar Múltiples Iconos

```mint
fun initializeIcons : Void {
  let icons = [
    { name: "logo", svg: "<path d='...'/>", category: "brand" },
    { name: "menu", svg: "<path d='...'/>", category: "ui" },
    { name: "close", svg: "<path d='...'/>", category: "ui" }
  ]

  IconRegistry.registerBatch(icons)
}
```

## 📚 API del IconRegistry Store

### `register(name, svg, category)`
Registra un icono individual.

**Parámetros:**
- `name: String` - Nombre único del icono
- `svg: String` - Path SVG del icono
- `category: String` - Categoría (ej: "action", "social", "custom")

**Ejemplo:**
```mint
register("rocket", "<path d='M4.5 16.5...'/>", "custom")
```

### `registerBatch(icons)`
Registra múltiples iconos de una vez.

**Parámetros:**
- `icons: Array(IconDefinition)` - Array de definiciones de iconos

**Ejemplo:**
```mint
registerBatch([
  { name: "icon1", svg: "...", category: "custom" },
  { name: "icon2", svg: "...", category: "custom" }
])
```

### `get(name)`
Obtiene un icono por nombre.

**Retorna:** `Maybe(IconDefinition)`

**Ejemplo:**
```mint
case IconRegistry.get("heart") {
  Maybe::Just(icon) => /* Usar icon.svg */
  Maybe::Nothing => /* Icono no encontrado */
}
```

### `has(name)`
Verifica si un icono existe.

**Retorna:** `Bool`

**Ejemplo:**
```mint
if IconRegistry.has("logo") {
  /* El icono existe */
}
```

### `getByCategory(category)`
Obtiene todos los iconos de una categoría.

**Retorna:** `Array(IconDefinition)`

**Ejemplo:**
```mint
let socialIcons = IconRegistry.getByCategory("social")
```

### `getAll()`
Obtiene todos los iconos registrados.

**Retorna:** `Map(String, IconDefinition)`

### `remove(name)`
Elimina un icono del registro.

### `clear()`
Limpia todos los iconos del registro.

### `count()`
Retorna el número total de iconos registrados.

### `initializeDefaults()`
Inicializa los iconos predefinidos del sistema.

## 🎨 Iconos Predefinidos

El sistema incluye 30+ iconos predefinidos en categorías:

### Action
- `check`, `search`, `upload`, `download`, `trash`, `edit`, `close`, `plus`, `minus`, `eye`, `eye-off`, `link`

### Navigation
- `home`, `menu`, `arrow-right`, `arrow-left`, `arrow-up`, `arrow-down`

### Social
- `heart`, `star`, `share`

### People
- `user`

### Communication
- `mail`

### Notification
- `bell`, `info`, `alert`

### System
- `settings`

### Security
- `lock`, `unlock`

### Time
- `calendar`

### Rating
- `star`

## 💡 Casos de Uso

### Iconos de Marca Personalizados

```mint
/* Registra el logo de tu empresa */
fun initializeBrandIcons : Void {
  register(
    "company-logo",
    "<path d='M12 2L2 7l10 5 10-5-10-5z...'/>",
    "brand"
  )
}

/* Úsalo en el header */
<Icon name="company-logo" size="xxl" />
```

### Sistema de Iconos de Producto

```mint
/* Registra iconos específicos del producto */
fun initializeProductIcons : Void {
  registerBatch([
    { name: "dashboard", svg: "...", category: "product" },
    { name: "analytics", svg: "...", category: "product" },
    { name: "reports", svg: "...", category: "product" }
  ])
}
```

### Iconos desde Librería Externa

```mint
/* Importa iconos de Heroicons, Feather, etc. */
fun importFromLibrary : Void {
  register("heroicon-academic-cap", heroicons.academicCap, "heroicons")
  register("feather-activity", featherIcons.activity, "feather")
}
```

## 🔧 Configuración Avanzada

### Lazy Loading de Iconos

```mint
/* Carga iconos bajo demanda */
fun loadIconSet (setName : String) : Promise(Void) {
  case setName {
    "social" => loadSocialIcons()
    "ecommerce" => loadEcommerceIcons()
    => Promise.never()
  }
}
```

### Iconos Dinámicos desde API

```mint
/* Carga iconos desde servidor */
fun loadRemoteIcons : Promise(Void) {
  Http.get("/api/icons")
  |> Http.send()
  |> Promise.then(
    (response : Http.Response) : Promise(Void) {
      /* Parse y registra iconos */
      Promise.never()
    }
  )
}
```

## 🎯 Best Practices

1. **Inicializa Temprano**: Registra iconos en `componentDidMount` del componente principal
2. **Usa Categorías**: Organiza iconos por funcionalidad
3. **Nombres Descriptivos**: Usa nombres claros y consistentes
4. **No Duplicar**: Aprovecha el registro en lugar de props inline
5. **Fallback**: El componente Icon acepta SVG inline si el icono no está registrado

## 📊 Ejemplo Completo

```mint
component App {
  connect IconRegistry exposing { register, initializeDefaults }

  state initialized : Bool = false

  fun componentDidMount : Promise(Void) {
    if !initialized {
      /* Inicializa iconos del sistema */
      initializeDefaults()

      /* Registra iconos personalizados */
      register("logo", "<circle cx='12'...'/>", "brand")
      register("feature-1", "<path d='...'/>", "features")
      register("feature-2", "<rect x='3'...'/>", "features")

      next { initialized: true }
    } else {
      Promise.never()
    }
  }

  fun render : Html {
    <div>
      /* Header con logo */
      <Icon name="logo" size="xl" variant="primary" />

      /* Navegación con iconos del sistema */
      <Icon name="home" size="md" />
      <Icon name="user" size="md" />
      <Icon name="settings" size="md" />

      /* Features con iconos personalizados */
      <Icon name="feature-1" size="lg" />
      <Icon name="feature-2" size="lg" />
    </div>
  }
}
```

## 🚀 Ventajas del Sistema

### Antes (Sin Registry)
```mint
/* Repetir SVG path en cada uso */
<Icon svg="<path d='M20.84 4.61...' />" size="lg" />
<Icon svg="<path d='M20.84 4.61...' />" size="md" />
<Icon svg="<path d='M20.84 4.61...' />" size="sm" />
```

### Después (Con Registry)
```mint
/* Registrar una vez */
register("heart", "<path d='M20.84 4.61...' />", "social")

/* Usar en cualquier lugar */
<Icon name="heart" size="lg" />
<Icon name="heart" size="md" />
<Icon name="heart" size="sm" />
```

## 🔗 Integración con Icon Component

El componente `Icon` busca automáticamente en el registry:

1. Si `name` tiene valor → Busca en registry
2. Si no encuentra → Usa `svg` prop (fallback)
3. Si no hay `svg` → Usa `emoji` o `text`

Esto mantiene **100% de retrocompatibilidad** con código existente.

## 📝 Notas

- El registry es **global** y persiste durante la sesión
- Los iconos se almacenan en un `Map` para acceso O(1)
- Las categorías facilitan la organización pero no afectan el rendimiento
- Puedes mezclar iconos del registry con SVG inline según necesites

---

**¿Necesitas más iconos?** Visita:
- [Heroicons](https://heroicons.com)
- [Feather Icons](https://feathericons.com)
- [Lucide](https://lucide.dev)
- [Phosphor Icons](https://phosphoricons.com)
