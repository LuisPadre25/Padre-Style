# 🏗️ Arquitectura del Proyecto - Mint Wū

## 📋 Estructura de Carpetas

```
source/
├── core/                          # Núcleo de la aplicación
│   ├── Main.mint                  # Componente principal de la app
│   ├── Routes.mint                # Definición central de rutas
│   └── types/                     # Tipos compartidos globalmente
│       └── CodeExample.mint       # Tipo para ejemplos de código
│
├── layout/                        # Componentes de layout/estructura
│   ├── Navbar.mint                # Barra de navegación superior
│   ├── Sidebar.mint               # Barra lateral de navegación
│   └── PageContent.mint           # Contenedor de contenido dinámico
│
├── modules/                       # Componentes CORE reutilizables
│   ├── qrcode/                    # Módulo QR Code
│   │   ├── QRCodeCanvas.mint      # Componente visual de QR
│   │   └── QREncoder.mint         # Lógica de codificación QR
│   │
│   ├── barcode/                   # Módulo Barcode
│   │   ├── BarcodeCanvas.mint     # Componente visual de Barcode
│   │   └── Code128.mint           # Lógica de codificación CODE128
│   │
│   └── button/                    # (FUTURO) Módulo Button
│       ├── Button.mint            # Componente Button
│       └── ButtonGroup.mint       # Grupo de botones
│
├── views/                         # PÁGINAS con ejemplos de uso
│   ├── codes/                     # Vista de QR & Barcodes
│   │   ├── CodesPage.mint         # Página de ejemplos
│   │   ├── CodeStore.mint         # Store específico de la vista
│   │   └── CodeExamples.mint      # 24 ejemplos predefinidos
│   │
│   ├── home/                      # (FUTURO) Vista Home
│   │   └── HomePage.mint
│   │
│   └── button/                    # (FUTURO) Vista de ejemplos de Button
│       ├── ButtonPage.mint        # Página de ejemplos
│       └── ButtonExamples.mint    # Ejemplos de uso
│
├── stores/                        # Stores globales de la aplicación
│   └── NavigationStore.mint       # Estado global de navegación
│
└── assets/                        # Assets estáticos (imágenes, SVG, etc.)
    └── logo.svg
```

---

## 🎯 Principios de Arquitectura

### 1. **Separación MODULES vs VIEWS**

#### **modules/** - Componentes Core Reutilizables
- Componentes puros y reutilizables
- Lógica de negocio encapsulada
- Sin dependencias de vistas específicas
- Pueden usarse en múltiples views

**Ejemplo**: `QRCodeCanvas` puede usarse en:
- `views/codes/CodesPage.mint` (página de ejemplos)
- `views/dashboard/DashboardPage.mint` (hipotético)
- Cualquier otro lugar que necesite mostrar QR

#### **views/** - Páginas con Ejemplos
- Páginas completas que muestran ejemplos
- Usan componentes de `modules/`
- Tienen su propio store local (si es necesario)
- Tienen sus propios datos de ejemplo
- Una view = una página en la aplicación

---

## 📦 Estructura de un Módulo

### Módulo: `qrcode/`
```
modules/qrcode/
├── QRCodeCanvas.mint      # Componente visual (REUTILIZABLE)
└── QREncoder.mint         # Lógica de codificación (PURA)
```

**Responsabilidades**:
- ✅ Renderizar QR codes
- ✅ Codificar texto a matriz QR
- ❌ NO contiene ejemplos
- ❌ NO contiene páginas de demo

---

## 📄 Estructura de una View

### View: `codes/`
```
views/codes/
├── CodesPage.mint         # PÁGINA con ejemplos de QR & Barcode
├── CodeStore.mint         # Store LOCAL de esta vista
└── CodeExamples.mint      # Datos de ejemplo para esta vista
```

**Responsabilidades**:
- ✅ Mostrar ejemplos interactivos
- ✅ Usar componentes de `modules/qrcode` y `modules/barcode`
- ✅ Gestionar estado local de la página
- ✅ Proveer datos de ejemplo

**Uso de módulos**:
```mint
// CodesPage.mint usa componentes de modules/
<QRCodeCanvas moduleSize={6} quietZone={4}/>
<BarcodeCanvas barHeight={120} barWidth={3}/>
```

---

## 🔄 Flujo de Datos

```
Usuario navega a /codes
         ↓
Routes.mint activa la ruta
         ↓
PageContent.mint renderiza CodesPage
         ↓
CodesPage (view) usa:
  - QRCodeCanvas (module)
  - BarcodeCanvas (module)
  - CodeStore (view-local)
  - CodeExamples (view-data)
         ↓
Componentes de modules/ renderizan el código
```

---

## 🚀 Cómo Agregar un Nuevo Componente

### Ejemplo: Agregar componente "Button"

#### PASO 1: Crear el módulo (componente reutilizable)
```bash
mkdir -p source/modules/button
```

**source/modules/button/Button.mint**:
```mint
component Button {
  property label : String = "Click me"
  property variant : String = "primary"
  property size : String = "medium"

  style button {
    padding: 8px 16px;
    border-radius: 4px;
    /* ... */
  }

  fun render : Html {
    <button::button>{label}</button>
  }
}
```

#### PASO 2: Crear la view (página de ejemplos)
```bash
mkdir -p source/views/button
```

**source/views/button/ButtonPage.mint**:
```mint
component ButtonPage {
  fun render : Html {
    <div>
      <h1>"Button Examples"</h1>

      <h2>"Primary Button"</h2>
      <Button label="Primary" variant="primary"/>

      <h2>"Secondary Button"</h2>
      <Button label="Secondary" variant="secondary"/>

      <h2>"Sizes"</h2>
      <Button label="Small" size="small"/>
      <Button label="Medium" size="medium"/>
      <Button label="Large" size="large"/>
    </div>
  }
}
```

#### PASO 3: Agregar ruta en Routes.mint
```mint
/button {
  NavigationStore.setPageAndSection("button", "Components")
}
```

#### PASO 4: Agregar link en Sidebar.mint
```mint
<a::link href="/button">"Button"</a>
```

---

## 📊 Comparación MODULES vs VIEWS

| Aspecto | **modules/** | **views/** |
|---------|-------------|-----------|
| **Propósito** | Componentes reutilizables | Páginas de ejemplos |
| **Reutilización** | Alta (múltiples views) | Baja (una página) |
| **Lógica** | Pura, sin contexto | Específica de la página |
| **Store** | Sin store propio | Puede tener store local |
| **Datos** | Sin datos hardcodeados | Contiene ejemplos |
| **Ejemplo** | `Button`, `QRCodeCanvas` | `ButtonPage`, `CodesPage` |

---

## 🎨 Estándares de Código

### Componente en modules/
```mint
// modules/button/Button.mint
component Button {
  property label : String = "Click"
  property variant : String = "primary"

  style button {
    /* estilos */
  }

  fun handleClick : Promise(Void) {
    /* lógica */
  }

  fun render : Html {
    <button::button onClick={handleClick}>
      {label}
    </button>
  }
}
```

### Página en views/
```mint
// views/button/ButtonPage.mint
component ButtonPage {
  state exampleText : String = "Hello"

  fun render : Html {
    <div>
      <h1>"Button Examples"</h1>

      <section>
        <h2>"Basic Usage"</h2>
        <Button label={exampleText}/>
      </section>

      <section>
        <h2>"Variants"</h2>
        <Button label="Primary" variant="primary"/>
        <Button label="Secondary" variant="secondary"/>
      </section>
    </div>
  }
}
```

---

## 📈 Roadmap

### Módulos en Producción
- ✅ **qrcode**: QRCodeCanvas, QREncoder
- ✅ **barcode**: BarcodeCanvas, Code128

### Views en Producción
- ✅ **codes**: CodesPage con ejemplos de QR & Barcode

### Planificados
**Modules**:
- 🔲 **button**: Button, ButtonGroup, IconButton
- 🔲 **input**: Input, TextArea, Select
- 🔲 **card**: Card, CardHeader, CardBody
- 🔲 **form**: Form, FormItem, FormValidation
- 🔲 **table**: Table, TableColumn, TableRow

**Views**:
- 🔲 **home**: Página de inicio
- 🔲 **button**: Ejemplos de Button
- 🔲 **input**: Ejemplos de Input
- 🔲 **card**: Ejemplos de Card
- 🔲 **form**: Ejemplos de formularios

---

## 🔍 Reglas de Importación

### ✅ Permitido
```mint
// View usa módulo
views/codes/CodesPage → modules/qrcode/QRCodeCanvas
views/button/ButtonPage → modules/button/Button

// View usa store global
views/codes/CodesPage → stores/NavigationStore

// Layout usa store global
layout/Sidebar → stores/NavigationStore
```

### ❌ Evitar
```mint
// Módulo NO debe depender de view
modules/button/Button → views/button/ButtonPage  // ❌

// View NO debe depender de otra view
views/codes/CodesPage → views/button/ButtonPage  // ❌

// Módulo NO debe tener datos hardcodeados
modules/button/Button → "ejemplos hardcodeados"  // ❌
```

---

## 🎯 Resumen de Arquitectura

```
┌─────────────────────────────────────────┐
│          USUARIO NAVEGA A /codes        │
└─────────────────┬───────────────────────┘
                  │
         ┌────────▼─────────┐
         │  Routes.mint     │
         │  (core/)         │
         └────────┬─────────┘
                  │
         ┌────────▼─────────┐
         │  PageContent     │
         │  (layout/)       │
         └────────┬─────────┘
                  │
         ┌────────▼──────────────┐
         │  CodesPage            │ ◄─── VIEW
         │  (views/codes/)       │
         └────┬──────────────┬───┘
              │              │
    ┌─────────▼───┐    ┌────▼──────────┐
    │ QRCodeCanvas│    │BarcodeCanvas  │ ◄─── MODULES
    │(modules/qr) │    │(modules/bar)  │
    └─────────────┘    └───────────────┘
```

---

## 📚 Referencias

- [Mint Lang Docs](https://mint-lang.com)
- [Vant UI Reference](https://vant-ui.github.io/vant)
- [Component-Driven Development](https://www.componentdriven.org/)

---

**Última actualización**: 2025-01-04
**Bundle Size**: 94.6KB
**Total Files**: 15 archivos `.mint`
**Mint Version**: 0.28.0-devel

---

## 🏆 Ventajas de esta Arquitectura

1. ✅ **Componentes Reutilizables**: `Button` puede usarse en cualquier view
2. ✅ **Separación Clara**: Módulos son puros, views tienen ejemplos
3. ✅ **Escalable**: Agregar nuevo componente = 1 módulo + 1 view
4. ✅ **Mantenible**: Lógica separada de presentación
5. ✅ **Testeable**: Módulos son independientes y testeables
