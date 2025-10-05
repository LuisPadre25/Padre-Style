# ComponentShowcase - Guía de Uso

## 📋 Descripción

**ComponentShowcase** es un componente reutilizable para crear páginas de documentación de componentes con las siguientes características:

- ✅ Sistema de tabs integrado (Preview, Usage, API)
- ✅ Simulador responsive (iPhone móvil / Navegador desktop)
- ✅ Syntax highlighting automático para código
- ✅ Tablas de documentación (Props, Events, Methods, Slots)
- ✅ Controles interactivos
- ✅ Completamente personalizable

---

## 🎯 Casos de Uso

ComponentShowcase está diseñado para soportar **todos los tipos de componentes** del sidebar:

### 1. **Basic Components** (Avatar, Button, Icon, etc.)
- Muestra visual en simulador
- Props básicas
- Controles simples

### 2. **Form Components** (Field, Checkbox, DatePicker, etc.)
- Formularios interactivos
- Validación en tiempo real
- Props + Events

### 3. **Action Components** (Dialog, Loading, Notify, etc.)
- Botones para activar acciones
- Estados de carga/éxito/error
- Methods + Events

### 4. **Display Components** (Badge, Progress, Tag, etc.)
- Variantes visuales
- Props de estilo
- Slots opcionales

### 5. **Navigation Components** (Tabs, Navbar, Sidebar, etc.)
- Navegación funcional
- Props de configuración
- Events de cambio

### 6. **Business Components** (AddressEdit, Card, Coupon, etc.)
- Casos de uso reales
- Forms complejos
- Props + Methods + Events

### 7. **Animations** (Enter/Exit, Gestures, Scroll, etc.)
- Preview con selector de animaciones
- Controles de timing
- Ejemplos de código CSS/Mint

---

## 📦 Props Disponibles

### **Información General**
```mint
title : String = "Component"              // Título del componente
description : String = ""                  // Descripción breve
badge : String = "Component"               // Badge (Component, NEW, etc.)
```

### **Contenido del Preview**
```mint
previewHeader : Html = Html.empty()        // Contenido antes del simulador (selectores, opciones)
previewContent : Html = Html.empty()       // El componente a mostrar
controlsContent : Html = Html.empty()      // Controles interactivos (sliders, inputs, etc.)
hideSimulator : Bool = false               // true = sin simulador móvil/desktop
```

### **Documentación**
```mint
usageText : String = ""                    // Texto explicativo en tab Usage
usageCode : CodeSnippet                    // Ejemplo de código simple (backward compatible)
codeExamples : Array(UsageExample) = []    // ⭐ NUEVO: Múltiples ejemplos con título y descripción
apiProperties : Array(ApiProperty) = []    // Props del componente
events : Array(ApiProperty) = []           // Events del componente
methods : Array(ApiProperty) = []          // Methods del componente
slots : Array(ApiProperty) = []            // Slots del componente
additionalDocs : Html = Html.empty()       // Docs adicionales personalizadas
```

### **Configuración de Tabs**
```mint
enabledTabs : Array(String) = ["preview", "usage", "api"]  // Tabs a mostrar
```

### **Personalización del Simulador**
```mint
mobileTitle : String = ""                  // Título en barra móvil (futuro)
desktopUrl : String = "localhost:3000"     // URL en barra del navegador
```

---

## 💡 Ejemplos de Uso

### Ejemplo 1: Componente Básico con Simulador

```mint
component ButtonPage {
  state variant : String = "primary"
  state size : String = "medium"

  fun getPreviewContent : Html {
    <Button
      variant={variant}
      size={size}
      text="Click Me"/>
  }

  fun getControlsContent : Html {
    <div>
      <h3>"Variant"</h3>
      <select onChange={handleVariantChange}>
        <option value="primary">"Primary"</option>
        <option value="secondary">"Secondary"</option>
      </select>

      <h3>"Size"</h3>
      <select onChange={handleSizeChange}>
        <option value="small">"Small"</option>
        <option value="medium">"Medium"</option>
        <option value="large">"Large"</option>
      </select>
    </div>
  }

  fun render : Html {
    <ComponentShowcase
      title="Button"
      description="Versatile button component with multiple variants and sizes"
      badge="Component"
      previewContent={getPreviewContent()}
      controlsContent={getControlsContent()}
      usageText="Import and use the Button component with your preferred variant."
      usageCode={
        {
          code: "<Button variant=\"primary\" size=\"medium\" text=\"Click Me\"/>",
          language: "mint"
        }
      }
      apiProperties={[
        { name: "variant", description: "Button style", type: "String", defaultValue: "\"primary\"" },
        { name: "size", description: "Button size", type: "String", defaultValue: "\"medium\"" },
        { name: "text", description: "Button text", type: "String", defaultValue: "\"\"" }
      ]}
      events={[
        { name: "onClick", description: "Triggered when clicked", type: "Function(Html.Event, Promise(Void))", defaultValue: "Promise.never" }
      ]}
      enabledTabs={["preview", "usage", "api"]}/>
  }
}
```

### Ejemplo 2: Componente con Selector (como EnterExit)

```mint
component AnimationPage {
  state selectedAnimation : String = "fadeIn"

  fun getPreviewHeader : Html {
    <div>
      <h3>"Choose Animation"</h3>
      <div class="animation-grid">
        for animation of getAnimations() {
          <div
            class={if selectedAnimation == animation.id { "active" } else { "" }}
            onClick={(e) { selectAnimation(animation.id) }}>
            {animation.label}
          </div>
        }
      </div>
    </div>
  }

  fun getPreviewContent : Html {
    <AnimatedBox animation={selectedAnimation}/>
  }

  fun render : Html {
    <ComponentShowcase
      previewHeader={getPreviewHeader()}
      previewContent={getPreviewContent()}
      .../>
  }
}
```

### Ejemplo 3: Componente Sin Simulador

Para componentes que no necesitan mockup visual (como utilidades, hooks, etc.):

```mint
<ComponentShowcase
  title="useLocalStorage"
  description="Custom hook for persistent state"
  badge="Hook"
  hideSimulator={true}
  previewContent={<LocalStorageDemo/>}
  .../>
```

### Ejemplo 4: Múltiples Ejemplos de Código ⭐ NUEVO

En lugar de un solo ejemplo, puedes proporcionar múltiples ejemplos organizados:

```mint
component ButtonPage {
  fun getCodeExamples : Array(UsageExample) {
    [
      {
        title: "Basic Button",
        description: "Simple button with default settings",
        snippet: {
          code: "<Button text=\"Click Me\"/>",
          language: "mint"
        }
      },
      {
        title: "Button with Icon",
        description: "Add an icon to enhance visual communication",
        snippet: {
          code: "<Button\n" +
                "  text=\"Save\"\n" +
                "  icon=\"💾\"\n" +
                "  variant=\"primary\"/>",
          language: "mint"
        }
      },
      {
        title: "Loading State",
        description: "Show loading indicator during async operations",
        snippet: {
          code: "state loading : Bool = false\n\n" +
                "<Button\n" +
                "  text=\"Submit\"\n" +
                "  loading={loading}\n" +
                "  onClick={handleSubmit}/>",
          language: "mint"
        }
      },
      {
        title: "Custom Styling",
        description: "Override default styles with CSS",
        snippet: {
          code: "<Button\n" +
                "  text=\"Custom\"\n" +
                "  class=\"my-custom-button\"/>\n\n" +
                "/* CSS */\n" +
                ".my-custom-button {\n" +
                "  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);\n" +
                "  border-radius: 24px;\n" +
                "}",
          language: "mint"
        }
      }
    ]
  }

  fun render : Html {
    <ComponentShowcase
      title="Button"
      codeExamples={getCodeExamples()}
      .../>
  }
}
```

**Ventajas:**
- ✅ Cada ejemplo tiene título y descripción
- ✅ Botón de copiar en cada uno
- ✅ Syntax highlighting individual
- ✅ Se pueden mezclar lenguajes (Mint, CSS, JavaScript)
- ✅ Backward compatible con `usageCode` simple

### Ejemplo 5: Componente con Events y Methods

```mint
<ComponentShowcase
  title="Dialog"
  ...
  events={[
    {
      name: "onOpen",
      description: "Fired when dialog opens",
      type: "Function(Void, Promise(Void))",
      defaultValue: "Promise.never"
    },
    {
      name: "onClose",
      description: "Fired when dialog closes",
      type: "Function(Void, Promise(Void))",
      defaultValue: "Promise.never"
    }
  ]}
  methods={[
    {
      name: "open()",
      description: "Opens the dialog",
      type: "Void",
      defaultValue: "Promise(Void)"
    },
    {
      name: "close()",
      description: "Closes the dialog",
      type: "Void",
      defaultValue: "Promise(Void)"
    }
  ]}
  .../>
```

---

## 🎨 Estructura Visual

### Tab Preview (con simulador)
```
┌─────────────────────────────────┐
│  [Preview Header]               │  ← previewHeader
│  (Choose options, selector)     │
├─────────────────────────────────┤
│  ┌─────────────────────────┐   │
│  │  📱 iPhone Mockup       │   │  Mobile Mode
│  │  ┌─────────────────┐   │   │
│  │  │                 │   │   │
│  │  │  [Preview]      │   │   │  ← previewContent
│  │  │                 │   │   │
│  │  └─────────────────┘   │   │
│  │  ┌─────────────────┐   │   │
│  │  │  [Controls]     │   │   │  ← controlsContent
│  │  └─────────────────┘   │   │
│  └─────────────────────────┘   │
└─────────────────────────────────┘

┌──────────────────────────────────────────────┐
│  [Preview Header]                            │
├──────────────────────────────────────────────┤
│  ┌────────────────────────────────────────┐ │
│  │  🖥️ Browser Mockup                     │ │  Desktop Mode
│  │  ┌──────────────┬─────────────────┐   │ │
│  │  │  [Preview]   │   [Controls]    │   │ │
│  │  │              │                 │   │ │
│  │  └──────────────┴─────────────────┘   │ │
│  └────────────────────────────────────────┘ │
└──────────────────────────────────────────────┘
```

### Tab Usage
```
┌─────────────────────────────────┐
│  Usage                          │
│  [usageText]                    │
│                                 │
│  Code Example                   │
│  ┌─────────────────────────┐   │
│  │ [syntax highlighted]    │   │  ← usageCode
│  │ code with copy button   │   │
│  └─────────────────────────┘   │
│                                 │
│  [additionalDocs]               │
└─────────────────────────────────┘
```

### Tab API
```
┌─────────────────────────────────┐
│  Props                          │
│  ┌─────┬─────────┬──────┬─────┐│
│  │Name │Desc     │Type  │Def  ││  ← apiProperties
│  └─────┴─────────┴──────┴─────┘│
│                                 │
│  Events                         │
│  ┌─────┬─────────┬──────┬─────┐│
│  │Name │Desc     │Args  │Type ││  ← events
│  └─────┴─────────┴──────┴─────┘│
│                                 │
│  Methods                        │
│  ┌─────┬─────────┬──────┬─────┐│
│  │Name │Desc     │Params│Ret  ││  ← methods
│  └─────┴─────────┴──────┴─────┘│
│                                 │
│  Slots                          │
│  ┌─────┬─────────┬──────┬─────┐│
│  │Name │Desc     │Type  │Def  ││  ← slots
│  └─────┴─────────┴──────┴─────┘│
│                                 │
│  [additionalDocs]               │
└─────────────────────────────────┘
```

---

## 🔧 Tipos Requeridos

### CodeSnippet
```mint
type CodeSnippet {
  code : String,
  language : String  // "mint", "css", "javascript", etc.
}
```

### UsageExample ⭐ NUEVO
```mint
type UsageExample {
  title : String,
  description : String,
  snippet : CodeSnippet
}
```

**Uso:** Para múltiples ejemplos de código organizados con título y descripción.

### ApiProperty
```mint
type ApiProperty {
  name : String,
  description : String,
  type : String,
  defaultValue : String
}
```

**Nota:** El tipo `ApiProperty` se reutiliza para Props, Events, Methods y Slots. Solo cambian las columnas de la tabla según el contexto.

---

## ✅ Checklist para Crear Nueva Página

1. ✅ Crear archivo en `source/views/[category]/[ComponentName]Page.mint`
2. ✅ Definir state para controles interactivos
3. ✅ Crear función `getPreviewContent()` → retorna el componente
4. ✅ Crear función `getControlsContent()` → retorna sliders/inputs/botones
5. ✅ (Opcional) Crear función `getPreviewHeader()` → selectores/opciones
6. ✅ Definir `usageCode` con ejemplo de código
7. ✅ Definir `apiProperties` con props del componente
8. ✅ (Opcional) Definir `events`, `methods`, `slots` si aplica
9. ✅ Renderizar `<ComponentShowcase .../>`
10. ✅ Agregar route en `Routes.mint`
11. ✅ Agregar entrada en `SidebarConfig.mint`

---

## 🚀 Ventajas del Sistema

1. **Consistencia**: Todas las páginas tienen el mismo diseño
2. **Mantenibilidad**: Cambios en ComponentShowcase se aplican a todos
3. **Responsive**: Funciona en móvil y desktop automáticamente
4. **Productividad**: Crear nueva página toma ~10 minutos
5. **Escalabilidad**: Soporta 90+ componentes diferentes
6. **Flexibilidad**: Props opcionales permiten personalización total

---

## 📝 Notas Finales

- El simulador móvil muestra un iPhone con notch y speaker
- El simulador desktop muestra un navegador con barra macOS
- Los tabs se pueden ocultar usando `enabledTabs`
- El syntax highlighting soporta Mint, CSS, JavaScript, etc.
- Las tablas se ocultan automáticamente si están vacías
- `additionalDocs` permite agregar secciones personalizadas

---

**Archivo ubicado en:** `source/modules/display/ComponentShowcase.mint`
**Tipos en:** `source/core/types/ShowcaseTypes.mint`
**Ejemplo completo:** `source/views/animations/EnterExitPage.mint`
