# Padre Style - Documentation Pages

Esta carpeta contiene el sistema de documentación completo de la librería Padre Style.

## 📁 Estructura

```
pages/
├── DocsPage.mint              # Página principal de documentación
├── LayoutDocsPage.mint        # Documentación de Layout Components
├── FormsDocsPage.mint         # Documentación de Form Components
├── ChartsDocsPage.mint        # Documentación de Charts
├── MediaDocsPage.mint         # Documentación de Media Components
├── NavigationDocsPage.mint    # Documentación de Navigation
├── FeedbackDocsPage.mint      # Documentación de Feedback Components
├── DataDisplayDocsPage.mint   # Documentación de Data Display
└── README.md                  # Este archivo
```

## 🚀 Uso

### Renderizar la documentación completa

Para usar el sistema de documentación en tu aplicación:

```mint
// En Main.mint o cualquier componente
<DocsPage/>
```

### Renderizar una página específica

```mint
// Solo Layout docs
<LayoutDocsPage/>

// Solo Forms docs
<FormsDocsPage/>

// Solo Charts docs
<ChartsDocsPage/>

// Solo Media docs
<MediaDocsPage/>
```

## 📖 Componentes Documentados

### ✅ Layout Components (LayoutDocsPage)
- **Flex** - Flexbox container con todas las propiedades
- **Stack** - Stack vertical/horizontal con spacing
- **Grid** - CSS Grid responsive
- **Container** - Contenedor centrado con max-width
- **Box** - Contenedor genérico con padding/margin

### ✅ Form Components (FormsDocsPage)
- **Input** - Text input básico
- **AutocompleteInput** - Input con sugerencias
- **PasswordInput** - Input de contraseña con toggle
- **SelectInput** - Dropdown seleccionable
- **CheckboxInput** - Checkbox personalizado
- **RadioGroup** - Grupo de radio buttons
- **ToggleSwitch** - Switch on/off
- **DateInput** - Date picker
- **DateRangePicker** - Selector de rango de fechas
- **NumberInput** - Input numérico
- **SliderInput** - Range slider
- **CurrencyInput** - Input de moneda formateado
- **TagsInput** - Input para agregar tags
- **OTPInput** - Input de código OTP
- **FileUpload** - Drag & drop file upload
- **ColorPicker** - Selector de colores

### ✅ Charts Components (ChartsDocsPage)
- **LineChart** - Gráfico de líneas
- **BarChart** - Gráfico de barras
- **AreaChart** - Gráfico de área
- **DonutChart** - Gráfico de dona
- **RadarChart** - Gráfico de radar
- **HeatMap** - Mapa de calor
- **PercentageRing** - Anillo de porcentaje

### ✅ Media Components (MediaDocsPage)
- **ImageCarousel** - Carrusel de imágenes completo
- **AdvancedLightbox** - Lightbox profesional con navegación
- **LazyImage** - Lazy loading con LQIP
- **VideoPlayer** - Video player personalizado completo
- **MiniVideoPlayer** - Video player compacto
- **ImageMasonry** - Grid estilo Pinterest
- **ImageComparison** - Comparador before/after
- **ImageZoom** - Zoom interactivo

### 🚧 Navigation Components (NavigationDocsPage)
- TopNav
- VerticalNav
- TabBar
- Breadcrumbs

### 🚧 Feedback Components (FeedbackDocsPage)
- Alert
- Toast
- Modal
- Tooltip
- Spinner

### 🚧 Data Display Components (DataDisplayDocsPage)
- Table
- DynamicCard
- MetricCard
- Badge
- Tag

## 🎨 Características del Sistema de Documentación

### ✨ Diseño Responsive
- Sidebar fija con navegación por categorías
- Contenido principal scrollable
- Adaptativo a diferentes tamaños de pantalla

### 🌈 Theming Completo
- Todos los componentes usan ThemeStore
- Soporte para todos los temas: Glass, Dark, Light, Dracula, Nord, etc.
- Los ejemplos se actualizan automáticamente al cambiar tema

### 📝 Cada Componente Incluye:
1. **Nombre y Badge** - Categoría y estado (New, Updated, etc.)
2. **Descripción** - Explicación clara del propósito
3. **Ejemplo Live** - Componente funcional renderizado
4. **Código de Ejemplo** - Snippet copiable
5. **Tabla de Props** - Documentación completa de propiedades
6. **Características** - Lista de funcionalidades

### 🎯 Navegación Intuitiva
- Categorías organizadas por tipo
- Navegación rápida con sidebar
- Estados activos visuales
- Scroll suave entre secciones

## 🔧 Personalización

### Agregar Nueva Categoría

1. Crear archivo en `pages/`:
```mint
component MiCategoriaDocsPage {
  connect ThemeStore exposing { currentTheme }

  fun render : Html {
    <div>
      <h1>"Mi Categoría"</h1>
      // ... contenido
    </div>
  }
}
```

2. Agregar a `DocsPage.mint`:
```mint
fun renderNavItem (label : String, category : String) : Html {
  // ...
  renderNavItem("🎯 Mi Categoría", "Mi Categoría")
}

fun renderContent : Html {
  case activeCategory {
    // ...
    "Mi Categoría" => <MiCategoriaDocsPage/>
    => <div>"Select a category"</div>
  }
}
```

### Personalizar Estilos

Todos los estilos están centralizados en cada página:
- `pageTitle` - Título principal
- `sectionTitle` - Títulos de sección
- `componentCard` - Tarjetas de componentes
- `exampleContainer` - Contenedor de ejemplos
- `codeBlock` - Bloques de código

## 📊 Estadísticas

- **Total de componentes documentados**: 40+
- **Categorías**: 8
- **Páginas de documentación**: 7
- **Ejemplos interactivos**: 50+

## 🚀 Próximos Pasos

### Pendiente de Documentar:
1. ✅ Layout - COMPLETO
2. ✅ Forms - COMPLETO
3. ✅ Charts - COMPLETO
4. ✅ Media - COMPLETO
5. 🚧 Navigation - Pendiente
6. 🚧 Feedback - Pendiente
7. 🚧 Data Display - Pendiente
8. ⏳ Code Components - Por hacer
9. ⏳ Advanced Components - Por hacer
10. ⏳ Utilities - Por hacer

### Mejoras Futuras:
- [ ] Búsqueda de componentes
- [ ] Filtros por categoría
- [ ] Exportar código del ejemplo
- [ ] Dark/Light mode toggle en ejemplos
- [ ] Links directos a componentes
- [ ] Versioning de componentes
- [ ] Playground interactivo

## 💡 Ejemplos de Uso

### Ejemplo 1: Mostrar solo Forms
```mint
component MyApp {
  fun render : Html {
    <FormsDocsPage/>
  }
}
```

### Ejemplo 2: Documentación completa con navegación
```mint
component MyApp {
  fun render : Html {
    <DynamicThemeProvider>
      <DocsPage/>
    </DynamicThemeProvider>
  }
}
```

### Ejemplo 3: Integrar en tu app existente
```mint
component MyApp {
  state showDocs : Bool = false

  fun render : Html {
    if showDocs {
      <DocsPage/>
    } else {
      <YourApp/>
    }
  }
}
```

## 📚 Recursos

- **Componentes**: `source/components/`
- **Showcases**: `source/showcase/`
- **Theme System**: `source/ThemeHelpers.mint`
- **Main Entry**: `source/Main.mint`

## 🤝 Contribuir

Para agregar documentación de un nuevo componente:

1. Crear ejemplo en `ComponentDocsPage.mint`
2. Incluir descripción clara
3. Agregar tabla de props
4. Proporcionar código de ejemplo
5. Agregar badge de categoría
6. Actualizar este README

---

**Padre Style** - Modern UI Component Library for Mint Lang
