# Padre Style - Librería de Componentes para Mint Lang

Una librería completa y moderna de componentes UI para Mint lang, diseñada para crear interfaces de usuario elegantes y funcionales.

## 🚀 Componentes Disponibles

### **Button** - Botón interactivo
```mint
<Button variant="primary" onClick={handleClick}>
  ["Hacer Click"]
</Button>
```

**Variantes disponibles:**
- `primary` (azul) - Por defecto
- `secondary` (gris)
- `success` (verde)

### **Card** - Tarjeta contenedora
```mint
<Card padding="2rem">
  <h3>"Título"</h3>
  <p>"Contenido de la card"</p>
</Card>
```

### **Grid** - Sistema de grillas responsive
```mint
<Grid columns={3} gap="1.5rem">
  <Card>["Item 1"]</Card>
  <Card>["Item 2"]</Card>
  <Card>["Item 3"]</Card>
</Grid>
```

### **Container** - Contenedor centrado
```mint
<Container maxWidth="800px">
  ["Contenido centrado"]
</Container>
```

### **Badge** - Etiquetas pequeñas
```mint
<Badge variant="primary">["Nuevo"]</Badge>
<Badge variant="success">["Activo"]</Badge>
<Badge>["Default"]</Badge>
```

## 🎨 Características

- ✅ **100% Compatible** con Mint lang
- ✅ **Responsive Design** - Se adapta a todos los dispositivos
- ✅ **Event Handling** - Botones completamente funcionales
- ✅ **Customizable** - Propiedades dinámicas para personalización
- ✅ **Modern CSS** - Gradientes, sombras, transiciones
- ✅ **TypeSafe** - Tipado fuerte con Mint

## 🛠️ Uso

1. Importa los componentes en tu proyecto Mint
2. Usa los componentes directamente en tu JSX
3. Personaliza con las propiedades disponibles

```mint
component MyApp {
  fun handleClick (event : Html.Event) : Promise(Void) {
    Debug.log("¡Botón clickeado!")
    Promise.never()
  }

  fun render : Html {
    <Container>
      <h1>"Mi App"</h1>

      <Grid columns={2} gap="2rem">
        <Card>
          <h2>"Panel 1"</h2>
          <p>"Contenido del primer panel"</p>
          <Badge variant="primary">["Nuevo"]</Badge>
        </Card>

        <Card>
          <h2>"Panel 2"</h2>
          <p>"Contenido del segundo panel"</p>
          <Button variant="success" onClick={handleClick}>
            ["Acción"]
          </Button>
        </Card>
      </Grid>
    </Container>
  }
}
```

## 🎯 Propiedades Detalladas

### Button
- `variant: String` - "primary" | "secondary" | "success"
- `onClick: Function(Html.Event, Promise(Void))` - Manejador de clicks
- `children: Array(Html)` - Contenido del botón

### Card
- `padding: String` - Espaciado interno (ej: "1rem", "2rem")
- `children: Array(Html)` - Contenido de la card

### Grid
- `columns: Number` - Número de columnas (ej: 2, 3, 4)
- `gap: String` - Espaciado entre elementos (ej: "1rem", "2rem")
- `children: Array(Html)` - Elementos del grid

### Container
- `maxWidth: String` - Ancho máximo (ej: "800px", "1200px")
- `children: Array(Html)` - Contenido del contenedor

### Badge
- `variant: String` - "default" | "primary" | "success"
- `children: Array(Html)` - Texto o contenido del badge

## 🎨 Paleta de Colores

- **Primary**: #3b82f6 (Azul moderno)
- **Secondary**: #6b7280 (Gris neutro)
- **Success**: #10b981 (Verde éxito)
- **Background**: Gradientes dinámicos
- **Text**: Contrastes optimizados

## 🚀 Demo

El proyecto incluye una demostración completa que muestra todos los componentes en acción:
- Botones interactivos con diferentes variantes
- Grid responsive con 3 columnas
- Cards con contenido y badges
- Layout profesional con gradientes

## 🔧 Desarrollo

```bash
# Iniciar proyecto
mint start

# Verificar sintaxis
mint lint

# Build para producción
mint build
```

## ⚡ Performance

- **CSS Optimizado** - Solo las reglas necesarias
- **Componentes Ligeros** - Sin dependencias externas
- **Renderizado Eficiente** - Mint lang optimizaciones nativas
- **Bundle Pequeño** - Código minimalista

---

**Padre Style** - Componentes elegantes y funcionales para tus aplicaciones Mint lang 🎨✨